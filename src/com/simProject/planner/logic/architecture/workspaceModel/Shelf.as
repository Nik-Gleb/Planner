package com.simProject.planner.logic.architecture.workspaceModel
{
	/**
	 * Полка.
	 * Представляет одну полку на дорожке. 
	 * @author Глеб
	 */
	public final class Shelf
	{
		/** Позиция от верхнего края рабочей области. */
		private var _pos:uint = 0;
		/** ID полки. */
		private var _id:uint = 0;
		
		/**
		 * Конструктор класса.
		 * Создаёт экземпляр полки, устанавливает свойства.
		 *  
		 * @param pos позиция от верхнего края рабочей области.
		 * @param id ID полки
		 */
		public function Shelf(pos:uint, height:uint)
		{
			this._pos = pos;
			this._id = id;
		}

		/** Позиция от верхнего края рабочей области. */
		public function get pos():uint
		{
			return _pos;
		}
		
		/** ID полки. */
		public function get id():uint
		{
			return _id;
		}

		/** Возвращает строковое представление дорожки. */
		public function toString():String
		{
			return	"shelf  {" + _pos + ", " + _id + "}";
		}
		
	}
}