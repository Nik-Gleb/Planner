package com.simProject.planner.logic.architecture.workspaceModel
{
	import flash.geom.Point;

	/**
	 * Перетаскиваемый объект.
	 * Представляет данные для перетаскиваемого объекта. 
	 * @author Глеб
	 */
	public final class ShelfDragData
	{
		/** Идентификатор нажатого товара. */
		private var _id:uint = 0;
		/** Позиция относительно элемента. */
		private var _itemPos:Point = null;
		/** Позиция абсолютная. */
		private var _stagePos:Point = null;
		/** Позиция перетаскиваемого объекта. */
		private var _viewPos:Point = null;
		/** Доступен для добавления. */
		private var _enabled:Boolean = false;
		
		
		/**
		 * Конструктор класса. Создаёт экземпляр класса.
		 * 
		 * @param id идентификатор нажатого товара
		 * @param itemPos позиция относительно элемента
		 * @param stagePos позиция абсолютная
		 * @param enabled доступен для добавления
		 */
		public function ShelfDragData(id:uint, itemPos:Point, stagePos:Point, enabled:Boolean)
		{
			_id = id;
			_itemPos = itemPos;
			_stagePos = stagePos;
			_enabled = enabled;
		}
		

		/** Идентификатор нажатого товара. */
		public function get id():uint
		{
			return _id;
		}

		/** Позиция относительно элемента. */
		public function get itemPos():Point
		{
			return _itemPos;
		}
		
		/** Позиция абсолютная. */
		public function get stagePos():Point
		{
			return _stagePos;
		}

		/** @private */
		public function set stagePos(value:Point):void
		{
			_stagePos = value;
		}

		/** Позиция перетаскиваемого объекта. */
		public function get viewPos():Point
		{
			return _viewPos;
		}
		
		/** @private */
		public function set viewPos(value:Point):void
		{
			_viewPos = value;
		}

		/** Позиция абсолютная. */
		public function get enabled():Boolean
		{
			return _enabled;
		}
		
		/** @private */
		public function set enabled(value:Boolean):void
		{
			_enabled = value;
		}

		/** Возвращает строковое представление дорожки. */
		public function toString():String
		{
			return	"dragObject  {" + _id + ", " + _itemPos + ", " + _stagePos + ", " + _viewPos + ", " + _enabled + "}";
		}

	}
}