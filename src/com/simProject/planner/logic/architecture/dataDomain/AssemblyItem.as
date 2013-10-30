package com.simProject.planner.logic.architecture.dataDomain
{
	/**
	 * Элемент сборки.
	 * Определяет товар и его положение в сборке. 
	 * @author Глеб
	 */
	public final class AssemblyItem
	{
		/** Идентификатор продукта. */
		private var _commodity_id:uint = 0;
		/** Горизонтальная позиция в сборке от верхнего левого угла стены в мм. */
		private var _x:uint = 0;
		/** Вертикальная позиция в сборке от верхнего левого угла стены в мм. */
		private var _y:uint = 0;

		/**
		 * Конструктор класса.
		 * Создаёт экземпляр элемента сборки, устанавливает свойства.
		 *  
		 * @param commodity_id идентификатор продукта
		 * @param x горизонтальная позиция в сборке от верхнего левого угла стены в мм
		 * @param y вертикальная позиция в сборке от верхнего левого угла стены в мм
		 */		
		public function AssemblyItem(commodity_id:uint,x:uint,y:uint)
		{
			this._commodity_id = commodity_id;
			this._x = x;
			this._y = y;
		}
		
		/** Идентификатор продукта. */
		public function get commodity_id():uint
		{
			return _commodity_id;
		}

		/** Горизонтальная позиция в сборке от верхнего левого угла стены в мм. */
		public function get x():uint
		{
			return _x;
		}

		/** Вертикальная позиция в сборке от верхнего левого угла стены в мм. */
		public function get y():uint
		{
			return _y;
		}

		/**
		 * Возвращает строковое представление элемента сборки.
		 */ 
		public function toString():String
		{
			return	"commodity_id: " + _commodity_id + ";   pos: " + x + "," + y;
		}
		
	}
}