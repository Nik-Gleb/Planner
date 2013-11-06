package com.simProject.planner.logic.architecture
{
	import com.simProject.planner.logic.states.ControllerLoadingState;

	/**
	 * Событие "Изменилось состояние контроллера".
	 * @eventType com.simProject.planner.logic.events.ControllerEvent.STATE_CHANGED
	 */
	[Event(name="state_changed", type="com.simProject.planner.logic.events.ControllerEvent")]
	
	/**
	 * Событие "Произошла ошибка при загрузке данных"
	 * @eventType com.simProject.planner.logic.events.ControllerEvent.ERROR_LOADING
	 */
	[Event(name="error_loading", type="com.simProject.planner.logic.events.ControllerEvent")]
	
	/**
	 * Событие "Прогресс загрузки"
	 * @eventType flash.events.ProgressEvent.PROGRESS
	 */
	[Event(name="progress", type="flash.events.ProgressEvent")]
	
	/**
	 * Событие "Изменилось состояние перетаскиваемого объекта"
	 * @eventType com.simProject.planner.logic.events.ControllerEvent.SHELF_ITEM_DRAG
	 */
	[Event(name="shelf_item_drag", type="com.simProject.planner.logic.events.ControllerEvent")]


	
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