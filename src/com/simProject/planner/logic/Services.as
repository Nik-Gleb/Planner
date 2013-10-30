package com.simProject.planner.logic
{

	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLRequest;

	/**
	 * Внутренние службы. 
	 * @author Глеб
	 */
	public final class Services
	{
		/* Определения констант */
		
		public static const STATE_LOADING:String = "loading";
		public static const STATE_READY:String = "ready";
		
		/** Домен, на котором, хранятся данные. */
		private static const BASE_URL:String = "http://flash.musiconegivc.com";
		/** Путь к папке с данными. */
		private static const PATH_URL:String = "/planner_db/";
		/** Имя файла с данными. */
		private static const PRODUCTS_XML:String = "products2.xml";
		
		/** Полный путь к файлу с данными. */
		public static const PRODUCTS_XML_FULLPATH:String = BASE_URL + PATH_URL + PRODUCTS_XML;
		
		/* Определения методов */
		
		/**
		 * Метод загружает данные с сервера и формирует модель данных.
		 * 
		 * @param onComplete обработчик удачной загрузки
		 * @param onError обработчик ошибки загрузки
		 * 
		 */
		public static function loadModel(onComplete:Function,onError:Function):void
		{
			var loader:Loader = new Loader();

			var disposeLoader:Function = function():void{
				loader.contentLoaderInfo.removeEventListener(Event.COMPLETE,completeHandler);
				loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR,errorHandler);
				loader.unloadAndStop();
			}
			
			var completeHandler:Function = function(event:Event):void{
				
				onComplete(true);
				
				disposeLoader();
				loader = null;
			}
			
			var errorHandler:Function = function(event:IOErrorEvent):void{
				
				onError(event.errorID);
				
				disposeLoader();
				loader = null;				
			}
	
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE,completeHandler);
			loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,errorHandler);
			loader.load(new URLRequest(BASE_URL + PATH_URL + Math.random()));
		}
		
		/** 
		 * @return URL-запрос для загрузки без кэширования.
		 */
		public static function getNoCachedURL(url:String):URLRequest
		{
			return new URLRequest(url + "?nocache=" + Math.random());
		}
		
	}
}