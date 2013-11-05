package com.simProject.planner.views
{
	import com.simProject.planner.logic.architecture.dataDomain.Commodity;
	
	import flash.events.Event;
	
	import mx.collections.IList;
	
	/**
	 * Провайдер данных для компонента ShelfsList 
	 * @author Глеб
	 */
	public final class ShelfsDataProvider implements IList
	{
		/** Список продуктов. */
		private var _data:Vector.<Commodity> = null;
		
		public function ShelfsDataProvider(data:Vector.<Commodity>)
		{
			_data = data;
		}
		
		public function get length():int
		{
			return _data.length;
		}
		
		public function addItem(item:Object):void
		{
			var temp:Commodity = item as Commodity;
			if (!temp) return;
			_data.push(temp);
		}
		
		public function addItemAt(item:Object, index:int):void
		{
			if(index < 0 || index >= _data.length)
			{
				throw new RangeError("setItemAt index: " + index + " is out of range");
			}
			
			var temp:Commodity = item as Commodity;
			if (!temp) return;
			
			_data = _data.splice(index,0,temp);

		}
		
		public function getItemAt(index:int, prefetch:int=0):Object
		{
			return _data[index] as Object;
		}
		
		public function getItemIndex(item:Object):int
		{
			var temp:Commodity = item as Commodity;
			if (!temp) return -1;

			return _data.indexOf(temp);
		}
		
		public function itemUpdated(item:Object, property:Object=null, oldValue:Object=null, newValue:Object=null):void
		{
			trace("itemUpdated NOT IMPLEMENTED");
		}
		
		public function removeAll():void
		{
			_data.splice(0, _data.length);
		}
		
		public function removeItemAt(index:int):Object
		{
			_data = _data.splice(index,1);
			return _data[0];
		}
		
		public function setItemAt(item:Object, index:int):Object
		{
			if(index < 0 || index >= _data.length)
			{
				throw new RangeError("setItemAt index: " + index + " is out of range");
			}
			var temp:Commodity = _data[index];
			_data = _data.splice(index, 0, item);
			return temp;
		}
		
		public function toArray():Array
		{
			//TODO: реализация функции
			return null;
		}
		
		public function addEventListener(type:String, listener:Function, useCapture:Boolean=false, priority:int=0, useWeakReference:Boolean=false):void
		{
			//TODO: реализация функции
		}
		
		public function removeEventListener(type:String, listener:Function, useCapture:Boolean=false):void
		{
			//TODO: реализация функции
		}
		
		public function dispatchEvent(event:Event):Boolean
		{
			//TODO: реализация функции
			return false;
		}
		
		public function hasEventListener(type:String):Boolean
		{
			//TODO: реализация функции
			return false;
		}
		
		public function willTrigger(type:String):Boolean
		{
			//TODO: реализация функции
			return false;
		}
	}
}