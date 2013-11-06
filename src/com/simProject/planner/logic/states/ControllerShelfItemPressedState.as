package com.simProject.planner.logic.states
{
	import com.simProject.planner.logic.Services;
	import com.simProject.planner.logic.architecture.ControllerState;
	import com.simProject.planner.logic.architecture.IControllerContext;
	
	import flash.display.Stage;
	import flash.geom.Point;

	/**
	 * Состояние "нажат элемент из списка полок". 
	 * @author Глеб
	 */
	public final class ControllerShelfItemPressedState extends ControllerState
	{
		/** Идентификатор нажатого товара. */
		private var _id:uint = 0;
		/** Позиция относительно элемента. */
		private var _itemPos:Point = null;
		/** Позиция абсолютная. */ 
		private var _stagePos:Point = null;
		
		/**
		 * Конструктор класса. Создаёт экземпляр класса.
		 * @param context контроллер для обращения к нему 
		 * @param id идентификатор нажатого товара
		 * @param itemPos позиция относительно элемента
		 * @param stagePos позиция абсолютная
		 * 
		 */
		public function ControllerShelfItemPressedState(context:IControllerContext, id:uint, itemPos:Point, stagePos:Point)
		{
			super(context);
			_id = id;
			_itemPos = itemPos;
			_stagePos = stagePos;
		}
		
		public override function getName():String
		{
			return Services.STATE_SHELF_ITEM_PRESSED;
		}
		
		public override function dispose():void
		{
			super.dispose();
		}
		
		
		public override function onShelfItemMoved(stagePos:Point):void
		{
			if (Point.distance(stagePos, _stagePos) > Services.SHELF_ITEM_STICK_SIZE)
				context.currentState = new ControllerShelfItemDraggingState(context, _id, _itemPos, stagePos);
		}
		
		public override function onShelfItemUp():void
		{
			context.currentState = new ControllerReadyState(context);
		}

	}
}