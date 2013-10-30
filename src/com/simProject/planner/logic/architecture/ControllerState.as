package com.simProject.planner.logic.architecture
{
	/**
	 * Абстрактное состояние контроллера. 
	 * @author Глеб
	 */
	public class ControllerState implements IControllerState
	{
		/** Контроллер для обращения к нему. */
		private var _context:IControllerContext = null;
		
		/**
		 * Создаёт экземпляр класса.
		 * Задаёт контроллер.
		 * @param context контроллер.
		 */
		public function ControllerState(context:IControllerContext)
		{
			this._context = context;
		}
		
		/** @return имя состояния. */
		public function getName():String
		{
			return "default";
		}
		
		/** @return возвращает контекст. */
		protected function get context():IControllerContext
		{
			return _context;
		}
		
		public function dispose():void
		{
			_context = null;
		}
	}
}