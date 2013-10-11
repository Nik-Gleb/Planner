package com.simProject.planner
{
	public final class ResultItem
	{
		private var _id:uint = 0;
		private var _name:String = "";
		private var _count:uint = 1;
		private var _price:uint = 0;
		private var _sum:uint = 0;
		
		public function ResultItem()
		{
		}
		
		public function get id():uint
		{
			return _id;
		}

		public function set id(value:uint):void
		{
			_id = value;
		}

		public function get name():String
		{
			return _name;
		}
		
		public function set name(value:String):void
		{
			_name = value;
		}
		
		public function get count():uint
		{
			return _count;
		}
		
		public function set count(value:uint):void
		{
			_count = value;
		}

		public function get price():uint
		{
			return _price;
		}

		public function set price(value:uint):void
		{
			_price = value;
		}

		public function get sum():uint
		{
			return _sum;
		}

		public function set sum(value:uint):void
		{
			_sum = value;
		}


	}
}