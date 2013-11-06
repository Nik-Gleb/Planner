package com.simProject.planner.logic.architecture
{
	
	import com.simProject.planner.logic.architecture.dataDomain.AssemblyItem;
	import com.simProject.planner.logic.architecture.dataDomain.DataModel;
	import com.simProject.planner.logic.architecture.workspaceModel.ShelfDragData;
	
	import flash.events.EventDispatcher;
	import flash.geom.Rectangle;
	
	/**
	 * Модель. 
	 * @author Глеб
	 */
	public final class Model extends EventDispatcher
	{
		/** Исходные данные. */
		private var _dataDomain:DataModel = null;
		/** Рабочая область. */
		private var _workSpace:Vector.<AssemblyItem> = null;
		/** Новая перетаскиваемая полка. */
		private var _newShelfDrag:ShelfDragData = null;
		private var _workSpaceRect:Rectangle = null;
		
		/**
		 * Конструктор модели. 
		 */
		public function Model()
		{
			_workSpace = new Vector.<AssemblyItem>();
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
		
		/** Рабочая область. */
		public function get workSpace():Vector.<AssemblyItem>
		{
			return _workSpace;
		}
		
		/** @private */
		public function set workSpace(value:Vector.<AssemblyItem>):void
		{
			_workSpace = value;
		}
		
		/** Новая перетаскиваемая полка. */
		public function get newShelfDrag():ShelfDragData
		{
			return _newShelfDrag;
		}

		/** @private */
		public function set newShelfDrag(value:ShelfDragData):void
		{
			_newShelfDrag = value;
		}

		
		/** Прямоугольник рабочей области. */
		public function get workSpaceRect():Rectangle
		{
			return _workSpaceRect;
		}
		
		/** @private */
		public function set workSpaceRect(value:Rectangle):void
		{
			_workSpaceRect = value;
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
			if (_workSpace){
				_workSpace = null;
			}
			if (_newShelfDrag){
				_newShelfDrag = null;
			}
			
		}
		

	}
}