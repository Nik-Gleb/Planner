package com.simProject.planner.logic.architecture
{
	
	import com.simProject.planner.logic.events.ControllerEvent;
	
	import flash.display.Stage;
	import flash.events.EventDispatcher;
	import flash.geom.Point;

	/**
	 * Контекст контроллера для состояний 
	 * 
	 * @author Глеб
	 */
	public class ControllerContext extends EventDispatcher implements IControllerContext
	{
		/** Текущее состояние.  */
		private var _currentState:IControllerState = null;
		/** Модель. */
		private var _model:Model = new Model();
		
		public function get model():Model
		{
			return _model;
		}
		
		/** Текущее состояние.  */
		public function get currentState():IControllerState
		{
			return _currentState;
		}

		/** @private */
		public function set currentState(value:IControllerState):void
		{
			if( _currentState !== value)
			{
				if (_currentState) _currentState.dispose();
				_currentState = value;
				dispatchEvent(new ControllerEvent(ControllerEvent.STATE_CHANGED, value.getName()));
			}
		}
		
		public function getName():String
		{
			if (_currentState)
				return _currentState.getName();
			else
				return null;
		}
		
		public function dispose():void
		{
			_model.dispose();
			_model = null;
			_currentState.dispose();
			_currentState = null;
		}
		
		public function onShelfItemPressed(id:uint, itemPos:Point, stagePos:Point):void
		{
			if (_currentState)
				_currentState.onShelfItemPressed(id, itemPos, stagePos);
		}
		
		public function onShelfItemMoved(stagePos:Point):void
		{
			if (_currentState)
				_currentState.onShelfItemMoved(stagePos);
			
		}
		
		public function onShelfItemUp():void
		{
			if (_currentState)
				_currentState.onShelfItemUp();
			
		}

		public function onShelfItemDrag(stagePos:Point):void
		{
			if (_currentState)
				_currentState.onShelfItemDrag(stagePos);
		}
		
		public function onShelfItemStopDrag(stagePos:Point):void
		{
			if (_currentState)
				_currentState.onShelfItemStopDrag(stagePos);
		}
	}
}