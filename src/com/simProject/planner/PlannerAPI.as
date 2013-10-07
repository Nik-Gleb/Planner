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
	
	import mx.collections.IList;
	import mx.core.Application;
	import mx.core.FlexGlobals;
	import mx.rpc.CallResponder;
	import mx.rpc.events.ResultEvent;
	import mx.utils.ArrayUtil;
	
	import services.dets.Dets;
	import services.products.Products;
	
	import spark.components.Button;
	import spark.components.Panel;
	
	import valueObjects.Detail;
	import valueObjects.Product;

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
		
		/** Массив продуктов. */
		private static var products:Vector.<Product> = null;
		/** Массив деталей. */
		private static var details:Vector.<Detail> = null;
		
		/** Текущий экран приложения. */
		private static var currentScreen:String = PlannerScreen.SHELF_SIZES;
		
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
			
			switch(currentScreen)
			{
				case PlannerScreen.SHELF_SIZES:
				{
					onShelfSizesComplete();
					break;
				}
				
				case PlannerScreen.CONSTRUCTOR:
				{
					onConstructorComplete();
					break;
				}
				
				default:
				{
					throw new Error("Рыба схавала вертолёт.");
					break;
				}
			}
			
		}
		
		/**
		 * Метод вызывается при клике по кнопке "BackButton".
		 */ 
		public static function onBackButtonClick():void
		{
			switch(currentScreen)
			{
					
				case PlannerScreen.CONSTRUCTOR:
				{
					onConstructorCancel();
					break;
				}
					
				case PlannerScreen.REPORT:
				{
					onReportCancel();					
					break;
				}
					
				default:
				{
					throw new Error("Рыба схавала вертолёт.");
					break;
				}
			}

		}
		
		/**
		 * Метод получает данные из источника данных.
		 */ 
		private static function getData():void
		{
			products = null;
			details = null;
			
			var planner:Planner = Planner(FlexGlobals.topLevelApplication);
			
			planner.products.addEventListener(ResultEvent.RESULT,
				function(event:ResultEvent):void{onProductsLoaded(event.result)});
			
			planner.dets.addEventListener(ResultEvent.RESULT,
				function(event:ResultEvent):void{onDetailsLoaded(event.result)});
			
			productsCallResponder.token = planner.products.getData();
			detailsCallResponder.token = planner.dets.getData();
			
		}
		
		/**
		 * Вызывается, когда данные о продуктах получены.
		 * @param data список продуктов.
		 */ 
		private static function onProductsLoaded(data:Object):void
		{
			products = Vector.<Product>(data);
		}
		
		/**
		 * Вызывается, когда данные о деталях получены.
		 * @param data список деталей.
		 */ 
		private static function onDetailsLoaded(data:Object):void
		{
			details = Vector.<Product>(data);
		}

		
		
		/**
		 * Вызывается, когда размер полки установлен.
		 */
		private static function onShelfSizesComplete():void
		{
			currentScreen = PlannerScreen.CONSTRUCTOR;
			
			var button:Button = Button(FlexGlobals.topLevelApplication["backButton"]);
			if(button != null){
				button.enabled = true;
			}else{
				throw new Error("Рыба схавала вертолёт.");
			}
			
			var shelf_sizes_panel:Panel = Panel(FlexGlobals.topLevelApplication["shelf_sizes_panel"]);
			var constructor_panel:Panel = Panel(FlexGlobals.topLevelApplication["constructor_panel"]);
			if(shelf_sizes_panel != null && constructor_panel != null){
				shelf_sizes_panel.visible = false;
				constructor_panel.visible = true;
			}else{
				throw new Error("Рыба схавала вертолёт.");
			}

			trace(currentScreen);
		}
		
		/**
		 * Вызывается, когда стенка собрана.
		 */
		private static function onConstructorComplete():void
		{
			currentScreen = PlannerScreen.REPORT;

			var button:Button = Button(FlexGlobals.topLevelApplication["forwardButton"]);
			if(button != null){
				button.enabled = false;
			}else{
				throw new Error("Рыба схавала вертолёт.");
			}
			
			var constructor_panel:Panel = Panel(FlexGlobals.topLevelApplication["constructor_panel"]);
			var report_panel:Panel = Panel(FlexGlobals.topLevelApplication["report_panel"]);
			if(constructor_panel != null && report_panel != null){
				constructor_panel.visible = false;
				report_panel.visible = true;
			}else{
				throw new Error("Рыба схавала вертолёт.");
			}

			trace(currentScreen);
			
			
			var planner:Planner = Planner(FlexGlobals.topLevelApplication);
			//planner.getData();
			
		}
		
		/**
		 * Вызывается, когда пользователь вернулся назад из конструктора.
		 */
		private static function onConstructorCancel():void
		{
			currentScreen = PlannerScreen.SHELF_SIZES;
			
			var button:Button = Button(FlexGlobals.topLevelApplication["backButton"]);
			if(button != null){
				button.enabled = false;
			}else{
				throw new Error("Рыба схавала вертолёт.");
			}
			
			var constructor_panel:Panel = Panel(FlexGlobals.topLevelApplication["constructor_panel"]);
			var shelf_sizes_panel:Panel = Panel(FlexGlobals.topLevelApplication["shelf_sizes_panel"]);
			if(constructor_panel != null && shelf_sizes_panel != null){
				constructor_panel.visible = false;
				shelf_sizes_panel.visible = true;
			}else{
				throw new Error("Рыба схавала вертолёт.");
			}

			
			trace(currentScreen);
			
		}

		/**
		 * Вызывается, когда пользователь вернулся назад из отчета.
		 */
		private static function onReportCancel():void
		{
			currentScreen = PlannerScreen.CONSTRUCTOR;
			
			var button:Button = Button(FlexGlobals.topLevelApplication["forwardButton"]);
			if(button != null){
				button.enabled = true;
			}else{
				throw new Error("Рыба схавала вертолёт.");
			}
			
			var report_panel:Panel = Panel(FlexGlobals.topLevelApplication["report_panel"]);
			var constructor_panel:Panel = Panel(FlexGlobals.topLevelApplication["constructor_panel"]);
			
			if(report_panel != null && constructor_panel != null){
				report_panel.visible = false;
				constructor_panel.visible = true;
			}else{
				throw new Error("Рыба схавала вертолёт.");
			}
			
			trace(currentScreen);
		}


	}
}
