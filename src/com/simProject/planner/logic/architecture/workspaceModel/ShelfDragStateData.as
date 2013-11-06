package com.simProject.planner.logic.architecture.workspaceModel
{
	import flash.geom.Point;

	/**
	 * Перетаскиваемый объект.
	 * Представляет состояние для перетаскиваемого объекта. 
	 * @author Глеб
	 */
	public final class ShelfDragStateData
	{
		/** Позиция перетаскиваемого объекта. */
		private var _viewPos:Point = null;
		/** Доступен для добавления. */
		private var _enabled:Boolean = false;
		
		
		/**
		 * Конструктор класса. Создаёт экземпляр класса.
		 * 
		 * @param stagePos позиция перетаскиваемого объекта
		 * @param enabled доступен для добавления
		 */
		public function ShelfDragStateData(viewPos:Point,enabled:Boolean)
		{
			_viewPos = viewPos;
			_enabled = enabled;
		}
		

		/** Позиция перетаскиваемого объекта. */
		public function get viewPos():Point
		{
			return _viewPos;
		}
		
		/** Позиция абсолютная. */
		public function get enabled():Boolean
		{
			return _enabled;
		}
		
		/** Возвращает строковое представление дорожки. */
		public function toString():String
		{
			return	"dragObject  {" + _viewPos + ", " + _enabled + "}";
		}

	}
}