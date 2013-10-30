package com.simProject.planner.logic.architecture
{
	import com.simProject.planner.logic.states.ControllerLoadingState;

	/**
	 * Событие "Изменилось состояние контроллера".
	 * @eventType com.gleb.customComponents.logic.events.ControllerEvent.STATE_CHANGED
	 */
	[Event(name="state_changed", type="com.gleb.customComponents.logic.events.ControllerEvent")]
	
	/**
	 * Событие "Произошла ошибка при загрузке данных"
	 * @eventType com.gleb.customComponents.logic.events.ControllerEvent.ERROR_LOADING
	 */
	[Event(name="error_loading", type="com.gleb.customComponents.logic.events.ControllerEvent")]
	
	/**
	 * Событие "Прогресс загрузки"
	 * @eventType flash.events.ProgressEvent.PROGRESS
	 */
	[Event(name="progress", type="flash.events.ProgressEvent")]

	
	/**
	 * Контроллер. 
	 * @author Глеб
	 */
	public final class Controller extends ControllerContext
	{
		[Bindable(event="state_changed")]
		[Bindable(event="error_loading")]

		/**
		 * Конструктор контроллера.
		 * Создаёт экземпляр класса. 
		 */
		public function Controller()
		{
			super();
			currentState = 
				new ControllerLoadingState(this);
		}
		
				
		public override function dispose():void
		{	
			super.dispose();
		}

		
	}
}