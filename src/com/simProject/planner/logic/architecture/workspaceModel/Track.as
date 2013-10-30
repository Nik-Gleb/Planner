package com.simProject.planner.logic.architecture.workspaceModel
{
	/**
	 * Дорожка.
	 * Представляет одну дорожку из полок в секции. 
	 * @author Глеб
	 */
	public final class Track
	{
		/** Высота. */
		private var _width:uint = 0;
		/** Ширина. */
		private var _height:uint = 0;
		/** Полки. */
		private var _shelfs:Vector.<Shelf> = null;
		
		/**
		 * Конструктор класса.
		 * Создаёт экземпляр дорожки, устанавливает свойства.
		 *  
		 * @param width ширина
		 * @param height высота
		 * @param shelfs полки
		 * 
		 */
		public function Track(
			width:uint,
			height:uint,
			shelfs:Vector.<Shelf>)
		{
			this._width = width;
			this._height = height;
			this._shelfs = shelfs;
		}

		/** Ширина. */
		public function get width():uint
		{
			return _width;
		}
		
		/** Высота. */
		public function get height():uint
		{
			return _height;
		}


		/** Полки. */
		public function get shelfs():Vector.<Shelf>
		{
			return _shelfs;
		}

		/** Возвращает строковое представление дорожки. */
		public function toString():String
		{
			return	"track  {" + "\n\t" +
				_width + "\n\t" +
				_height + "\n\t" +
				_shelfs +"\n}";
		}
		
	}
}