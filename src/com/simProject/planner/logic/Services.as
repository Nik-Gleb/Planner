package com.simProject.planner.logic
{

	import com.simProject.planner.logic.architecture.dataDomain.Commodity;
	import com.simProject.planner.logic.architecture.workspaceModel.ShelfDragStateData;
	
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.net.URLRequest;
	
	import mx.collections.IList;

	/**
	 * Внутренние службы. 
	 * @author Глеб
	 */
	public final class Services
	{
		/* Определения констант */
		
		public static const STATE_LOADING:String = "loading";
		public static const STATE_READY:String = "ready";
		public static const STATE_SHELF_ITEM_PRESSED:String = "shelf_item_pressed";
		public static const STATE_SHELF_ITEM_DRAGGING:String = "shelf_item_dragging";
		
		/** Домен, на котором, хранятся данные. */
		private static const BASE_URL:String = "http://flash.musiconegivc.com";
		/** Путь к папке с данными. */
		private static const PATH_URL:String = "/planner_db/";
		/** Имя файла с данными. */
		private static const PRODUCTS_XML:String = "products2.xml";
		
		/** Полный путь к файлу с данными. */
		public static const PRODUCTS_XML_FULLPATH:String = BASE_URL + PATH_URL + PRODUCTS_XML;
		
		public static const SHELF_ITEM_STICK_SIZE:uint = 48;
		
		public static const REAL_SCALE:uint = 144;
		
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
		
		/** Вычисляет позицию и состояние перетаскиваемого объекта. */
		public static function calcDragObjectState(rect:Rectangle, workSpaceRect:Rectangle):ShelfDragStateData
		{
			var stickRes:int = isBoundStick(rect.x,rect.y,rect.width,rect.height,workSpaceRect.x,workSpaceRect.y,workSpaceRect.width,workSpaceRect.height,SHELF_ITEM_STICK_SIZE);

			var enabled:Boolean = false;
			var viewPos:Point = null;

			switch(stickRes)
			{
				case 0:
				{
					enabled = true;
					viewPos = rect.topLeft;
					break;
				}
					
				case 1:
				{
					viewPos = new Point(workSpaceRect.left,rect.y);
					enabled = true;
					break;
				}
				case 2:
				{
					viewPos = new Point(rect.x,workSpaceRect.top);
					enabled = true;
					break;
				}
				case 3:
				{
					viewPos = new Point(workSpaceRect.right - rect.width,rect.y);
					enabled = true;
					break;
				}
				case 4:
				{
					viewPos = new Point(rect.x,workSpaceRect.bottom - rect.height);
					enabled = true;
					break;
				}

				default:
				{
					break;
				}
			}
			
			return new ShelfDragStateData(viewPos, enabled);
		}
		
		/**
		 * Проверяет смещение точки на прилипаемость. 
		 * 
		 * @param offset смещение
		 * @param stickArea размер области прилипания
		 * @return результат в формате
		 * 
		 * "-1" - уходит в лево или вверх
		 * " 0" - прилипает
		 * " 1" - уходит в право или вниз
		 * 
		 */
		private static function isStick(offset:int, stickArea:uint):int
		{
			return Math.abs(offset) < (stickArea*0.5) ? 0 : offset < 0 ? -1 : 1;
		}

		
		/**
		 * Проверка на выход за границы или прилипание к ним.
		 * 
		 * @param segment сегмент, который необходимо проверить
		 * @param model модель, по которой нужно проверять сегмент
		 * @return результат в формате
		 * 
		 * "-1" - выходит за пределы
		 * " 0" - не прилипает
		 * " 1" - прилипает к левой границе
		 * " 2" - прилипает к верхней границе
		 * " 3" - прилипает к правой границе
		 * " 4" - прилипает к нижней границе
		 */
		public static function isBoundStick(
			xSrc:int, ySrc:int, widthSrc:int, heightSrc:int,
			xDst:int, yDst:int, widthDst:int, heightDst:int,
			stickArea:uint):int
		{
			
			// Проверяем левую границу
			var leftBound:int = isStick(xSrc - xDst,stickArea);
			if (leftBound < 0)
				
				// Левый край сегмента левее левого края рабочей области
				return -1;
			else {
				
				// Проверяем верхнюю границу
				var topBound:int = isStick(ySrc - yDst,stickArea);
				if (topBound < 0)
					
					// Верхний край сегмента выше верхнего края рабочей области
					return -1;
				else
					
					// Проверяем правую границу
					var rightBound:int = isStick((xSrc+widthSrc)-(xDst+widthDst),stickArea);
				if (rightBound > 0)
					
					// Правый край сегмента правее правого края рабочей области
					return -1;
				else
					
					// Проверяем нижнюю границу
					var bottomBound:int = isStick((ySrc+heightSrc)-(yDst+heightDst),stickArea);
				if (rightBound > 0)
					
					// Нижний край сегмента ниже нижнего края рабочей области
					return -1;
				else {
					
					// Считаем прилипания
					var bounds:Vector.<int> = new Vector.<int>();
					if (!leftBound) bounds.push(1);
					if (!topBound) bounds.push(2);
					if (!rightBound) bounds.push(3);
					if (!bottomBound) bounds.push(4);
					
					// Если ни одного - то не прилипает
					if (bounds.length == 0)
						return 0;
					else
						
						// Если одно прилипание - то его и возвращаем
						if (bounds.length == 1)
							return bounds[0];
						else
							
							// Если несколько прилипание вернём любое из них ;)
							return bounds[Math.round((bounds.length-1) * Math.random())]
				}		
			}
		}
		
	}
		
}