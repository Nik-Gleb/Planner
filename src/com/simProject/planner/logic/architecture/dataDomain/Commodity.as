package com.simProject.planner.logic.architecture.dataDomain
{
	import flash.display.BitmapData;

	/**
	 * Товар.
	 * Определяет свойства товара.
	 * @author Глеб
	 */	
	public final class Commodity
	{
		/** Внутренний идентификатор. */
		private var _id:uint = 0;
		/** Имя, для отображения в списке выбора товаров. */
		private var _name:String = null;
		/** Описание, для отображения в конечном отчете. */
		private var _description:String = null;
		/** Артикул, для отображения в конечном отчете. */
		private var _article:String = null;
		/** Цена, для отображения и просчётов в конечном отчете. */
		private var _price:uint = 0;
		/** Ширина товара в мм. */
		private var _width:uint = 0;
		/** Высота товара в мм. */
		private var _height:uint = 0;
		/** Изображение товара. */
		private var _image:BitmapData = null;

		/**
		 * Конструктор класса.
		 * Создаёт экземпляр товара, устанавливает свойства.
		 * 
		 * @param id внутренний идентификатор
		 * @param name имя, для отображения в списке выбора товаров
		 * @param description описание, для отображения в конечном отчете
		 * @param article артикул, для отображения в конечном отчете
		 * @param price цена, для отображения и просчётов в конечном отчете
		 * @param width ширина товара в мм
		 * @param height высота товара в мм
		 * @param image изображение товара
		 * 
		 */
		public function Commodity(
			id:uint,
			name:String,
			description:String,
			article:String,
			price:uint,
			width:uint,height:uint,
			image:BitmapData)
		{
			this._id = id;
			this._name = name;
			this._description = description;
			this._article = article;
			this._price = price;
			this._width = width;
			this._height = height;
			this._image = image;
		}

		/** Внутренний идентификатор. */
		public function get id():uint
		{
			return _id;
		}

		/** Имя, для отображения в списке выбора товаров. */
		public function get name():String
		{
			return _name;
		}

		/** Описание, для отображения в конечном отчете. */
		public function get description():String
		{
			return _description;
		}

		/** Артикул, для отображения в конечном отчете. */
		public function get article():String
		{
			return _article;
		}

		/** Цена, для отображения и просчётов в конечном отчете. */
		public function get price():uint
		{
			return _price;
		}

		/** Ширина товара в мм. */
		public function get width():uint
		{
			return _width;
		}

		/** Высота товара в мм. */
		public function get height():uint
		{
			return _height;
		}

		/** Изображение товара. */
		public function get image():BitmapData
		{
			return _image;
		}

		/** Возвращает строковое представление товара. */ 
		public function toString():String
		{
			return	"commodity №" + _id + " {" + "\n\t" +
					_name+", "+_description+", " + _article + ", " + _price + " rub., " + "\n\t" +
					_width+" mm x "+_height+" mm, " + "\n\t" +
					_image+"\n}";
		}
		
	}
}