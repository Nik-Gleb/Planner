package com.simProject.planner.logic.states
{
	import com.simProject.planner.logic.Services;
	import com.simProject.planner.logic.architecture.ControllerState;
	import com.simProject.planner.logic.architecture.IControllerContext;
	
	import flash.display.Stage;
	import flash.geom.Point;

	/**
	 * Состояние приложение готово к работе. 
	 * @author Глеб
	 */
	public final class ControllerReadyState extends ControllerState
	{
		public function ControllerReadyState(context:IControllerContext)
		{
			super(context);
		}
		
		public override function getName():String
		{
			return Services.STATE_READY;
		}
		
		public override function dispose():void
		{
			super.dispose();
		}
		
		public override function onShelfItemPressed(id:uint, itemPos:Point, stagePos:Point):void
		{
			context.currentState = new ControllerShelfItemPressedState(context, id, itemPos, stagePos);
		}
		
	}
}