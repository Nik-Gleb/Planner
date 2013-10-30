package com.simProject.planner.logic.architecture.workspaceModel
{
	/**
	 * Секция.
	 * Представляет одну секцию на рабочей области. 
	 * @author Глеб
	 */
	public final class Section
	{
		/** Позиция от левого края рабочей области. */
		private var _pos:uint = 0;
		/** Дорожки. */
		private var _tracks:Vector.<Track> = null;
		
		/**
		 * Конструктор класса.
		 * Создаёт экземпляр секции, устанавливает свойства.
		 *  
		 * @param pos позиция от левого края рабочей области.
		 * @param tracks дорожки
		 */
		public function Shelf(pos:uint, tracks:Vector.<Track>)
		{
			this._pos = pos;
			this._tracks = tracks;
		}

		/** Позиция от левого края рабочей области. */
		public function get pos():uint
		{
			return _pos;
		}
		
		/** Дорожки. */
		public function get tracks():uint
		{
			return _tracks;
		}

		/** Возвращает строковое представление дорожки. */
		public function toString():String
		{
			return	"section  {" + _pos + ", " + _tracks + "}";
		}
		
	}
}