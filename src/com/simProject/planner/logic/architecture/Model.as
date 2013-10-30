package com.simProject.planner.logic.architecture
{
	
	import com.simProject.planner.logic.architecture.dataDomain.DataModel;
	
	import flash.display.BitmapData;
	import flash.events.EventDispatcher;

	/**
	 * Модель. 
	 * @author Глеб
	 */
	public final class Model extends EventDispatcher
	{
		/** Исходные данные. */
		private var _dataDomain:DataModel = null;
		
		/**
		 * Конструктор модели. 
		 */
		public function Model()
		{
		}

		/** Исходные данные. */
		public function get dataDomain():DataModel
		{
			return _dataDomain;
		}

		/** @private */
		public function set dataDomain(value:DataModel):void
		{
			if (_dataDomain !== value)
			{
				_dataDomain = value;
				//dispatchEvent(new Event("valueChange"));
			}
		}
		
		/**
		 * Уничтожение объекта. 
		 */
		public function dispose():void
		{
			if (_dataDomain){
				//_dataDomain.dispose();
				_dataDomain = null;
			}
			
		}

	}
}