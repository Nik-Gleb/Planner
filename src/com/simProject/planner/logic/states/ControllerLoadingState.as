package com.simProject.planner.logic.states
{
	
	import com.simProject.planner.logic.Services;
	import com.simProject.planner.logic.architecture.ControllerState;
	import com.simProject.planner.logic.architecture.IControllerContext;
	import com.simProject.planner.logic.architecture.dataDomain.Assembly;
	import com.simProject.planner.logic.architecture.dataDomain.AssemblyItem;
	import com.simProject.planner.logic.architecture.dataDomain.Commodity;
	import com.simProject.planner.logic.architecture.dataDomain.DataModel;
	import com.simProject.planner.logic.architecture.dataDomain.Detail;
	import com.simProject.planner.logic.events.ControllerEvent;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.system.System;
	

	/**
	 * Состояние загрузки данных. 
	 * @author Глеб
	 */
	public final class ControllerLoadingState extends ControllerState
	{
		/** Загрузчик. */
		private var loader:Loader = new Loader();
		
		/** Загрузчик xml. */
		private var _xmlLoader:URLLoader = new URLLoader();
		
		/** Данные в формате XML. */
		private var _dataXml:XML = null;
		
		/** Список картинок. */
		private var _images:Vector.<Loader> = null;
				
		/** Полный размер по элементам. */
		private var _total:Vector.<uint> = null;
		
		/** Загруженный размер по элементам. */
		private var _loaded:Vector.<uint> = null;
		
		/** Число загруженных изображений. */
		private var completeCount:uint = 0;
		
		/** Число продуктов. */
		private var goodsCount:uint = 0;
		
		/** Число деталей. */
		private var detailsCount:uint = 0;
		
		/** Число сборок. */
		private var assemblyCount:uint = 0;
		
		
		
		/**
		 * Конструктор состояния.
		 * Создаёт экземпляр класса.
		 * Устанавливает контекст контроллера, запускает загрузку файлов.
		 * 
		 * @param context контекст контроллера.
		 * 
		 */
		public function ControllerLoadingState(context:IControllerContext)
		{
			super(context);
			
			_xmlLoader = new URLLoader();
			_xmlLoader.dataFormat = URLLoaderDataFormat.TEXT;
			_xmlLoader.addEventListener(Event.COMPLETE, onXMLLoadingComplete);
			_xmlLoader.addEventListener(ProgressEvent.PROGRESS, onXMLLoadingProgress);
			_xmlLoader.addEventListener(IOErrorEvent.IO_ERROR, onXMLLoadingError);
			
			try {
				_xmlLoader.load(Services.getNoCachedURL(Services.PRODUCTS_XML_FULLPATH));
			} catch (error:Error) {
				commonError(error.message);
				return;
			}
			/*
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE,onCompleteLoading);
			loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,onErrorLoading);
			loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, onProgressLoading);
			loader.load(Services.getNoCachedURL(Services.PRODUCTS_XML_FULLPATH));
			*/
		}
		
		/** Обработчик события ошибки загрузки изображения. */
		private function onImageLoadingError(event:IOErrorEvent):void
		{
			event.stopPropagation();
			commonError(event.text);
		}
		
		/** Обработчик события прогресса загрузки изображения. */
		private function onImageLoadingProgress(event:ProgressEvent):void
		{
			var index:uint = (event.target as LoaderInfo).loader.tabIndex;
			
			_total[index] = event.bytesTotal;
			_loaded[index] = event.bytesLoaded;
						
			event.stopPropagation();
			
			sendProgressEvent();
			
		}
		
		/** Обработчик события успешной загрузки изображения. */
		private function onImageLoadingComplete(event:Event):void
		{
			event.stopPropagation();
			completeCount++;
			if (completeCount == _images.length) onCommonComplete();
			//var loaderInfo:LoaderInfo = event.target as LoaderInfo;
			//var bitmap:Bitmap = loaderInfo.content as Bitmap;
			//var bitmapData:BitmapData = bitmap.bitmapData;
			
		}
		
		/** Обработчик события успешной загрузки xml. */
		private function onXMLLoadingComplete(event:Event):void
		{
			event.stopPropagation();
			_dataXml = new XML(event.target.data);
			
			goodsCount = _dataXml.goods.children().length()-1;
			detailsCount = 2;
			assemblyCount = _dataXml.assemblies.children().length()-1
				
			_images = new Vector.<Loader>(goodsCount + detailsCount + assemblyCount);
			_images.fixed = true;
			
			_loaded = new Vector.<uint>(_images.length);
			_loaded.fixed = true;
			
			_total = new Vector.<uint>(_images.length);
			_total.fixed = true;

			for (var i:int = 0; i < _images.length; i++) 
			{
				var url:String = null;
				var id:uint = 0;
				
				if (i<goodsCount){
					url = _dataXml.goods.commodity.@image[i];
					id = i;
				}else
					if (i>=goodsCount && i<goodsCount + detailsCount){
						if (i == goodsCount){
							url = _dataXml.details.rack.@image[0];
							id = i; //????
						}else{
							url = _dataXml.details.rail.@image[0];
							id = i; //????							
						}
					}else
						if (i>=goodsCount + detailsCount){
							url = _dataXml.assemblies.assembly.@image[i-(goodsCount + detailsCount)];
							id = i;
						}

				_images[i] = new Loader();
				_images[i].tabIndex = id;
				_images[i].contentLoaderInfo.addEventListener(Event.COMPLETE, onImageLoadingComplete);
				_images[i].contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, onImageLoadingError);
				_images[i].contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, onImageLoadingProgress);
				//_images[i].load(Services.getNoCachedURL(url));
				_images[i].load(Services.getNoCachedURL("http://upload.wikimedia.org/wikipedia/ru/8/83/Thunderbird_logo.png"));
			}
			
		}
		
		/** Обработчик события ошибки загрузки xml. */
		private function onXMLLoadingError(event:IOErrorEvent):void
		{
			event.stopPropagation();
			commonError(event.text);
		}
		
		/** Обработчик события прогресса загрузки xml. */
		private function onXMLLoadingProgress(event:ProgressEvent):void
		{
			event.stopPropagation();
			(context as EventDispatcher).dispatchEvent(event.clone() as ProgressEvent);
		}

		
		public override function getName():String
		{
			return Services.STATE_LOADING;
		}
		
		public override function dispose():void
		{
			super.dispose();
			
			if (_xmlLoader) disposeXMLLoader();
			if (_dataXml) disposeXMLData();
			if (_images) disposeBitmapData();
			if (_total) _total = null;
			if (_loaded) _loaded = null;

			
			/*
			loader.contentLoaderInfo.removeEventListener(Event.COMPLETE,onCompleteLoading);
			loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR,onErrorLoading);
			loader.contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS, onProgressLoading);
			loader.unloadAndStop();
			loader = null;
			*/
		}
		
		/** Уничтожает XML-загрузчик. */
		private function disposeXMLLoader():void
		{
			_xmlLoader.removeEventListener(Event.COMPLETE, onXMLLoadingComplete);
			_xmlLoader.removeEventListener(ProgressEvent.PROGRESS, onXMLLoadingProgress);
			_xmlLoader.removeEventListener(IOErrorEvent.IO_ERROR, onXMLLoadingError);
			_xmlLoader.close();
			_xmlLoader = null;
		}
		
		/** Уничтожает XML-данные. */
		private function disposeXMLData():void
		{
			System.disposeXML(_dataXml);
			_dataXml = null;
		}

		/** Уничтожение списка картинок. */
		private function disposeBitmapData():void
		{
			for (var i:int = 0; i < _images.length; i++) 
				if (_images[i]!=null){
					
					if (_images[i].contentLoaderInfo.hasEventListener(Event.COMPLETE))
						_images[i].contentLoaderInfo.removeEventListener(Event.COMPLETE, onImageLoadingComplete);
					if (_images[i].contentLoaderInfo.hasEventListener(IOErrorEvent.IO_ERROR))
						_images[i].contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, onImageLoadingError);
					if (_images[i].contentLoaderInfo.hasEventListener(ProgressEvent.PROGRESS))
						_images[i].contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS, onImageLoadingProgress);

					_images[i].unloadAndStop();
					_images[i] = null;
				};
			
			_images = null;
		}
		
		/**
		 * Метод вызывается при возникновении любой ошибки загрузки
		 * @param message текс сообщения об ошибке.
		 */
		private function commonError(message:String):void
		{
			(context as EventDispatcher).dispatchEvent(new ControllerEvent(
				ControllerEvent.ERROR_LOADING,
				message
			));

		}
		
		/** Вычисляет прогресс и отправляет событие прогресса. */
		private function sendProgressEvent():void
		{
			var loaded:uint = 0;
			var total:uint = 0;
			
			for (var i:int = 0; i < _images.length; i++) 
			{
				loaded += _loaded[i];
				total += _total[i];
			}
			
			(context as EventDispatcher).dispatchEvent(
				new ProgressEvent(ProgressEvent.PROGRESS,false,false,loaded,total));

		}
		
		/** Вызывается, когда успешно загружены все изображения. */
		private function onCommonComplete():void
		{
			var bitmap:Bitmap = null;
			
			var goods:Vector.<Commodity> = new Vector.<Commodity>(goodsCount);
			goods.fixed = true;
			
			for (var i:int = 0; i < goodsCount; i++) 
			{
				bitmap = _images[i].contentLoaderInfo.content as Bitmap;

				goods[i] = new Commodity(i,
					_dataXml.goods.commodity.@name[i],
					_dataXml.goods.commodity.@description[i],
					_dataXml.goods.commodity.@article[i],
					_dataXml.goods.commodity.@price[i],
					_dataXml.goods.commodity.@width[i],
					_dataXml.goods.commodity.@height[i],
					bitmap.bitmapData.clone());
			}
			
			bitmap = _images[goodsCount].contentLoaderInfo.content as Bitmap;

			var rack:Detail = new Detail(
				_dataXml.details.rack.@description[0],
				_dataXml.details.rack.@article[0],
				_dataXml.details.rack.@price[0],
				_dataXml.details.rack.@width[0],
				_dataXml.details.rack.@height[0],
				bitmap.bitmapData.clone());
			
			bitmap = _images[goodsCount+1].contentLoaderInfo.content as Bitmap;
			
			var rail:Detail = new Detail(
				_dataXml.details.rail.@description[0],
				_dataXml.details.rail.@article[0],
				_dataXml.details.rail.@price[0],
				_dataXml.details.rail.@width[0],
				_dataXml.details.rail.@height[0],
				bitmap.bitmapData.clone());

			var assemblies:Vector.<Assembly> =
				new Vector.<Assembly>(_images.length - (goodsCount + detailsCount));
			assemblies.fixed = true;
			
			for (var i:int = goodsCount + detailsCount; i < _images.length; i++) 
			{
				var index:uint = i-(goodsCount + detailsCount);
				
				var itemsCount:uint = _dataXml.assemblies.assembly[index].children().length();
				var items:Vector.<AssemblyItem> = new Vector.<AssemblyItem>(itemsCount);
				
				items.fixed = true;
				
				for (var j:int = 0; j < items.length; j++) 
				{
					items[j] = new AssemblyItem(
						_dataXml.assemblies.assembly[index].item.@commodity_id[j],
						_dataXml.assemblies.assembly[index].item.@x[j],
						_dataXml.assemblies.assembly[index].item.@y[j]);
				}				
				
				bitmap = _images[i].contentLoaderInfo.content as Bitmap;
				
				assemblies[index] = new Assembly(index,
					_dataXml.assemblies.assembly.@name[index],
					bitmap.bitmapData.clone(),items);
			}
			
			context.model.dataDomain = new DataModel(goods,rack,rail,assemblies);
			
			context.currentState = new ControllerReadyState(context);
		}
	}
}