package com.simProject.planner.logic.architecture
{
	/**
	 * Интерфейс состояния контроллера. 
	 * @author Глеб
	 */
	public interface IControllerState
	{
		/** @return возвращает имя состояния. */
		function getName():String;
		
		/** Уничтожение состояния. */
		function dispose():void;
	}
}