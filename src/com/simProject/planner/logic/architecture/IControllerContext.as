package com.simProject.planner.logic.architecture
{

	/**
	 * Контекст контроллера для состояний.
	 * @author Глеб
	 */
	public interface IControllerContext
	{
		/** @return модель */
		function get model():Model;
		
		/**
		 * Переходит к другому состоянию 
		 * @param value новое состояние
		 */
		function set currentState(value:IControllerState):void;
		
		/** Уничтожение. */
		function dispose():void;

	}
}