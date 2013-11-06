package com.simProject.planner.logic.architecture
{
	import flash.display.Stage;
	import flash.geom.Point;

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
		
		/**
		 * Нажат пункт из списка полок. 
		 * @param id идентификатор полки
		 * @param itemPos позиция относительно элемента
		 * @param stagePos позиция абсолютная
		 */
		function onShelfItemPressed(id:uint, itemPos:Point, stagePos:Point):void;
		
		/**
		 * Переместилась мышь с нажатой клавишей 
		 * @param stagePos позиция курсора.
		 */
		function onShelfItemMoved(stagePos:Point):void;
		
		/** Отпущена мышь над пунктом из списка полок. */
		function onShelfItemUp():void;
		
		/** Переместили перетаскиваемый объект. */
		function onShelfItemDrag(stagePos:Point):void;
		
		/** Бросили перетаскиваемый объект. */
		function onShelfItemStopDrag(stagePos:Point):void
	}
}