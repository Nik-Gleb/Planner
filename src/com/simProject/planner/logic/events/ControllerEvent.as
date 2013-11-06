package com.simProject.planner.logic.events
{
	import flash.events.Event;
	
	/**
	 * Событие от контроллера.
	 * @author Глеб
	 */
	public final class ControllerEvent extends Event
	{
		/** Тип события "Изменилось состояние контроллера". **/
		public static const STATE_CHANGED:String = "state_changed";
		/** Тип события "Произошла ошибка при загрузке данных". */
		public static const ERROR_LOADING:String = "error_loading";
		/** Перемещение элемента списка полок. */
		public static const SHELF_ITEM_DRAG:String = "shelf_item_drag";


		/** Имя события. */
		private var _name:String = null;
		
		/**
		 * Конструктор класса. Создаёт экземпляр события.
		 * @param name имя события 
		 * @param type тип события
		 * @param bubbles поднимаемое или нет
		 * @param cancelable сбрасываемое или нет
		 * 
		 */
		public function ControllerEvent(type:String, name:String=null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this._name = name;
		}

		/** Имя события. */
		public function get name():String
		{
			return _name;
		}
		
		public override function clone():Event
		{
			return new ControllerEvent(type, name, bubbles, cancelable)
		}

	}
}