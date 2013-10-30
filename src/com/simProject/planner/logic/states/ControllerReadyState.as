package com.simProject.planner.logic.states
{
	import com.simProject.planner.logic.Services;
	import com.simProject.planner.logic.architecture.ControllerState;
	import com.simProject.planner.logic.architecture.IControllerContext;

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
	}
}