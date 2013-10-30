package com.simProject.planner.logic.architecture.dataDomain
{
	import flash.display.BitmapData;

	/**
	 * Сборка.
	 * Определяет готовый набор товаров и их расположение. 
	 * @author Глеб
	 */
	public final class Assembly
	{
		/** Внутренний идентификатор. */
		private var _id:uint = 0;
		/** Название шаблона. */
		private var _name:String = null;
		/** Изображение шаблона. */
		private var _image:BitmapData = null;
		/** Элементы, из которых состоит сборка.*/
		private var _goods:Vector.<AssemblyItem> = null;
		
		/**
		 * Конструктор класса.
		 * Создаёт экземпляр сборки, устанавливает свойства.
		 *  
		 * @param id внутренний идентификатор
		 * @param name название шаблона
		 * @param image изображение шаблона
		 * @param goods элементы, из которых состоит сборка
		 * 
		 */
		public function Assembly(
			id:uint,
			name:String,
			image:BitmapData,
			goods:Vector.<AssemblyItem>)
		{
			this._id = id;
			this._name = name;
			this._image = image;
			this._goods = goods;
		}

		/** Внутренний идентификатор. */
		public function get loader():uint
		{
			return _id;
		}

		/** Название шаблона. */
		public function get name():String
		{
			return _name;
		}

		/** Изображение шаблона. */
		public function get image():BitmapData
		{
			return _image;
		}

		/** Элементы, из которых состоит сборка.*/
		public function get goods():Vector.<AssemblyItem>
		{
			return _goods;
		}
		
		/** Возвращает строковое представление сборки. */
		public function toString():String
		{
			return	"assembly №" + _id + " {" + "\n\t" +
				_name + "\n\t" +
				_image + "\n\t" +
				_goods +"\n}";
		}
		
	}
}