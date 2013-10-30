package com.simProject.planner.logic.architecture.dataDomain
{
	import flash.display.BitmapData;

	public final class Detail
	{
		/** Описание, для отображения в конечном отчете. */
		private var _description:String = null;
		/** Артикул, для отображения в конечном отчете. */
		private var _article:String = null;
		/** Цена, для отображения и просчётов в конечном отчете. */
		private var _price:uint = 0;
		/** Ширина детали в мм. */
		private var _width:uint = 0;
		/** Высота детали в мм. */
		private var _height:uint = 0;
		/** Изображение детали. */
		private var _image:BitmapData = null;

		/**
		 * Конструктор класса.
		 * Создаёт экземпляр детали, устанавливает свойства.
		 * 
		 * @param description описание, для отображения в конечном отчете
		 * @param article артикул, для отображения в конечном отчете
		 * @param price цена, для отображения и просчётов в конечном отчете
		 * @param width ширина товара в мм
		 * @param height высота товара в мм
		 * @param image изображение товара
		 * 
		 */
		public function Detail(
			description:String,
			article:String,
			price:uint,
			width:uint,height:uint,
			image:BitmapData)
		{
			this._description = description;
			this._article = article;
			this._price = price;
			this._width = width;
			this._height = height;
			this._image = image;
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
		
		/** Ширина детали в мм. */
		public function get width():uint
		{
			return _width;
		}
		
		/** Высота детали в мм. */
		public function get height():uint
		{
			return _height;
		}
		
		/** Изображение детали. */
		public function get image():BitmapData
		{
			return _image;
		}

		/** Возвращает строковое представление детали. */ 
		public function toString():String
		{
			return	"detail {" + "\n\t" +
				_description+", " + _article + ", " + _price + " rub., " + "\n\t" +
				_width+" mm x "+_height+" mm, " + "\n\t" +
				_image+"\n}";
		}

	}
}