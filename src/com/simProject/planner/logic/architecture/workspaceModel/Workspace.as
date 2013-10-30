package com.simProject.planner.logic.architecture.workspaceModel
{
	/**
	 * Рабочее пространство.
	 * Содержит информацию о секциях. дорожках и полках. 
	 * @author Глеб
	 */
	public final class Workspace
	{
		/** Позиция от левого края контейнера. */
		private var _x:uint = 0;
		/** Позиция от верхнего края контейнера. */
		private var _y:uint = 0;
		/** Секции. */
		private var _sections:Vector.<Section> = null;
		
		/**
		 * Конструктор класса.
		 * Создаёт экземпляр рабочего пространства, устанавливает свойства.
		 *  
		 * @param x позиция от левого края контейнера
		 * @param y позиция от левого края контейнера
		 * @param sections секции
		 */
		public function Workspace(x:uint, y:uint, sections:Vector.<Section>)
		{
			this._x = x;
			this._y = y;
			this._sections = sections;
		}

		/** Позиция от левого края контейнера. */
		public function get x():uint
		{
			return _x;
		}
		
		/** Позиция от верхнего края контейнера. */
		public function get y():uint
		{
			return _y;
		}

		/** Секции. */
		public function get sections():uint
		{
			return _sections;
		}

		/** Возвращает строковое представление рабочего пространства. */
		public function toString():String
		{
			return	"workspace  {" + "\n\t" +
				"pos(" + _x + "," _y + ")" + "\n\t" +
				_sections + "}";
		}
	}
}