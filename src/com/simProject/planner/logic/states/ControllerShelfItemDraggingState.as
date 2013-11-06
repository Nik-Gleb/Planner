package com.simProject.planner.logic.states
{
	import com.simProject.planner.logic.Services;
	import com.simProject.planner.logic.architecture.ControllerState;
	import com.simProject.planner.logic.architecture.IControllerContext;
	import com.simProject.planner.logic.architecture.workspaceModel.ShelfDragData;
	import com.simProject.planner.logic.architecture.workspaceModel.ShelfDragStateData;
	import com.simProject.planner.logic.events.ControllerEvent;
	
	import flash.display.Stage;
	import flash.events.EventDispatcher;
	import flash.events.ProgressEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;

	/**
	 * Состояние "перетаскиваем полку". 
	 * @author Глеб
	 */
	public final class ControllerShelfItemDraggingState extends ControllerState
	{
		
		/**
		 * Конструктор класса. Создаёт экземпляр класса.
		 * @param context контроллер для обращения к нему 
		 * @param id идентификатор нажатого товара
		 * @param itemPos позиция относительно элемента
		 * @param stagePos позиция абсолютная
		 * 
		 */
		public function ControllerShelfItemDraggingState(context:IControllerContext, id:uint, itemPos:Point, stagePos:Point)
		{
			super(context);
			
			
			context.model.newShelfDrag = new ShelfDragData(id,itemPos,stagePos,false);

			context.model.newShelfDrag.itemPos.setTo(
				context.model.dataDomain.goods[id].width / 2000 * Services.REAL_SCALE,
				context.model.dataDomain.goods[id].height / 2000 * Services.REAL_SCALE);
			context.model.newShelfDrag.viewPos = stagePos.subtract(context.model.newShelfDrag.itemPos);
		}
		
		public override function getName():String
		{
			return Services.STATE_SHELF_ITEM_DRAGGING;
		}
		
		public override function dispose():void
		{
			context.model.newShelfDrag = null;
			super.dispose();
			
		}
		
		public override function onShelfItemDrag(stagePos:Point):void
		{
			context.model.newShelfDrag.stagePos = stagePos;
			var pos:Point = stagePos.subtract(context.model.newShelfDrag.itemPos);
			var shelfDragStateData:ShelfDragStateData = Services.calcDragObjectState(
				new Rectangle(pos.x,pos.y,context.model.newShelfDrag.itemPos.x * 2,context.model.newShelfDrag.itemPos.y * 2),
				context.model.workSpaceRect
			);
			
			if (shelfDragStateData.viewPos)
				context.model.newShelfDrag.viewPos = shelfDragStateData.viewPos;
			else
				context.model.newShelfDrag.viewPos = pos;
			
			context.model.newShelfDrag.enabled = shelfDragStateData.enabled;
			
			(context as EventDispatcher).dispatchEvent(
				new ControllerEvent(ControllerEvent.SHELF_ITEM_DRAG));

		}
		
		public override function onShelfItemStopDrag(stagePos:Point):void
		{
			// Handle
			context.currentState = new ControllerReadyState(context);
		}
		
		

	}
}