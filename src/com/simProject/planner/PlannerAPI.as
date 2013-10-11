/*
 * SIM-PROJECT PLANNER
 * Copyright 2013
 * 
 * Sim-Project Inc.
 * All Rights Reserved.
 *
 * NOTICE: Sim-Project permits you to use, modify, and distribute this file in 
 * accordance with the terms of the license agreement accompanying it.
 **/
package com.simProject.planner
{
	import com.simProject.planner.core.PlannerScreen;
	
	import flash.events.MouseEvent;
	
	import mx.collections.ArrayCollection;
	import mx.collections.ArrayList;
	import mx.collections.IList;
	import mx.controls.List;
	import mx.core.Application;
	import mx.core.FlexGlobals;
	import mx.events.CollectionEvent;
	import mx.rpc.CallResponder;
	import mx.rpc.events.ResultEvent;
	import mx.utils.ArrayUtil;
	
	import services.dets.Dets;
	import services.products.Products;
	
	import spark.components.Button;
	import spark.components.Panel;
	
	import valueObjects.Detail;
	import valueObjects.Product;
	import valueObjects.Product_id;
	import valueObjects.Template;

	/**
	 * Главный класс приложения.
	 * 
	 * <p>Определяет взаимодействие MXML и ActionScript.</p>
	 * 
	 * @author Gleb Nikitenko
	 **/
	internal final class PlannerAPI
	{
		/** Информация о верссии. */
		include "Version.as";
		
		/** Источник данных продуктов.*/
		private static var productsCallResponder:CallResponder = new CallResponder();
		/** Источник данных деталей.*/
		private static var detailsCallResponder:CallResponder = new CallResponder();
		/** Источник данных шаблонов.*/
		private static var templatesCallResponder:CallResponder = new CallResponder();

		
		/** Массив продуктов. */
		private static var products:Vector.<Product> = null;
		/** Массив деталей. */
		private static var details:Vector.<Detail> = null;
		/** Массив шаблонов. */
		private static var templates:Vector.<Template> = null;

		
		/** Текущий экран приложения. */
		private static var currentScreen:String = PlannerScreen.SHELF_SIZES;
		
		/** Конечный список товаров для отчёта. */ 
		public static var resultProducts:ArrayCollection = new ArrayCollection();
		
		/**
		 * Конструктор.
		 * Создаёт новый экземпляр класса.
		 **/ 
		public function PlannerAPI()
		{
			
		}
		
		/**
		 * Метод инициализирует класс.
		 */
		public static function initialize():void
		{
			trace("PlannerAPI.initialize()");
			
			getData();
			
		}
		
		/**
		 * Метод вызывается при клике по кнопке "ForwradButton".
		 */ 
		public static function onForwardButtonClick():void
		{
			var planner:Planner = Planner(FlexGlobals.topLevelApplication);
			planner.currentState = "designer";
		}
		
		/**
		 * Метод вызывается при выборе пункта в списке продуктов.
		 */ 
		public static function onProductsListChanged():void
		{
			var planner:Planner = Planner(FlexGlobals.topLevelApplication);
			
			var product:Product = Product(planner.productsList.selectedItem);
			if(product == null)return;
			planner.productInfo.text = "PRODUCT ID:	" + product.id + "\n" +
				"NAME:	" + product.name + "\n" +
				"PRICE:	" + product.price + " RUB.\n"
			
			
		}
		
		/**
		 * Метод вызывается при двойном клике по пункту в списке продуктов.
		 */ 
		public static function onProductsListDoubleClick(data:Object):void
		{
			var product:Product = Product(data);
			var list:ArrayList = new ArrayList();			
			
			list.addItem(product);
			
			addShelfs(list);
		}
		
		
		/**
		 * Метод вызывается при выборе пункта в списке шаблонов.
		 */ 
		public static function onTemplatesListChanged():void
		{
			
			var planner:Planner = Planner(FlexGlobals.topLevelApplication);
			
			var template:Template = Template(planner.templatesList.selectedItem);
			
			var products_str:String = "";
			
			for (var i:int = 0; i < template.product_id.length; i++) 
			{
				var product:Product = products[uint(Product_id(template.product_id[i]).id)];
				products_str = products_str + i + ").   " + product.name + "(id=" + product.id + ") - " + product.price + " rub." + "\n";	
			}
			
			planner.templateInfo.text = "TEMPLATE ID:	" + template.id + "\n" +
				products_str;
			
		}
		
		/**
		 * Метод вызывается при двойном клике по пункту в списке шаблонов.
		 */ 
		public static function onTemplatesListDoubleClick(data:Object):void
		{
			var template:Template = Template(data);
			var list:ArrayList = new ArrayList();
			
			for (var i:int = 0; i < template.product_id.length; i++) 
			{
				var product:Product = products[uint(Product_id(template.product_id[i]).id)];
				list.addItem(product);
			}
			
			
			addShelfs(list);
			
		}

		/**
		 * Метод вызывается при двойном клике по пункту в списке результатов.
		 */ 
		public static function onResultsListDoubleClick(data:Object):void
		{
			var index:int = resultProducts.getItemIndex(data);
			if(uint(Product(data).id)>15)return;
			if(index != -1)removeShelf(index);
			
		}
		
		/**
		 * Метод получает данные из источника данных.
		 */ 
		private static function getData():void
		{
			products = null;
			details = null;
			templates = null;
			
			var planner:Planner = Planner(FlexGlobals.topLevelApplication);
			
			planner.products.addEventListener(ResultEvent.RESULT,
				function(event:ResultEvent):void{onProductsLoaded(event.result)});
			
			planner.dets.addEventListener(ResultEvent.RESULT,
				function(event:ResultEvent):void{onDetailsLoaded(event.result)});
			
			planner.templatesService.addEventListener(ResultEvent.RESULT,
				function(event:ResultEvent):void{onTemplatesLoaded(event.result)});

			productsCallResponder.token = planner.products.getData();
			detailsCallResponder.token = planner.dets.getData();
			templatesCallResponder.token = planner.templatesService.getData();
			
		}
		
		/**
		 * Вызывается, когда данные о продуктах получены.
		 * @param data список продуктов.
		 */ 
		private static function onProductsLoaded(data:Object):void
		{
			products = Vector.<Product>(data);
			var planner:Planner = Planner(FlexGlobals.topLevelApplication);
			planner.productsList.dataProvider = productsCallResponder.lastResult;
		}
		
		/**
		 * Вызывается, когда данные о деталях получены.
		 * @param data список деталей.
		 */ 
		private static function onDetailsLoaded(data:Object):void
		{
			details = Vector.<Detail>(data);
		}

		/**
		 * Вызывается, когда данные о шаблонах получены.
		 * @param data список шаблонов.
		 */ 
		private static function onTemplatesLoaded(data:Object):void
		{
			templates = Vector.<Template>(data);
			var planner:Planner = Planner(FlexGlobals.topLevelApplication);
			planner.templatesList.dataProvider = templatesCallResponder.lastResult;

		}
		
		
		/**
		 * Добавляет полки в конечный список.
		 */ 
		private static function addShelfs(value:ArrayList):void
		{
			if(value == null)return;
			if(value.length == 0)return;
			
			var st_details:ArrayList = new ArrayList();
			var st_products:ArrayList = new ArrayList();
			
			for (var i:int = 0; i < resultProducts.length; i++) 
			{
				var product:Product = Product(resultProducts[i]);
				
				if(uint(product.id)>15)
					st_details.addItem(product);
				else
					st_products.addItem(product);
			}
			
			var planner:Planner = Planner(FlexGlobals.topLevelApplication);
			var index:int = resultProducts.length;
			
			if(st_products.length == 0){
				resultProducts.addItem(createDetailAsProduct(0));
				resultProducts.addItem(createDetailAsProduct(1));
				index = 1;
			}else{
				index--;
			}
								
			
			if(value.length == 1){
				// Добавляется один элемент
				resultProducts.addItemAt(value.source.pop(),index);
			}else{
				// Добавляется несколько элементов
				resultProducts.addAllAt(value,index);
			}
			
		}
		
		/**
		 * Удалет полку из списка.
		 */ 
		private static function removeShelf(index:uint):void
		{
			if(index>resultProducts.length-1)return;
			if(uint(Product(resultProducts[index]).id)>15)return;
			
			var st_details:ArrayList = new ArrayList();
			var st_products:ArrayList = new ArrayList();
			
			for (var i:int = 0; i < resultProducts.length; i++) 
			{
				var product:Product = Product(resultProducts[i]);
				
				if(uint(product.id)>15)
					st_details.addItem(product);
				else
					st_products.addItem(product);
			}
			
			var planner:Planner = Planner(FlexGlobals.topLevelApplication);
			var temp_index:int = resultProducts.length;
			
			if(st_products.length == 1)
				resultProducts.removeAll();
			else
				resultProducts.removeItemAt(index);

			
		}
		
		/**
		 * Создаёт продукт по детали.
		 **/ 
		private static function createDetailAsProduct(index:uint):Product
		{
			var product:Product = new Product();
			var detail:Detail = details[index];
			product.id = detail.id;
			product.name = detail.name;
			product.price = detail.price;
			return product;
		}

	}
}
