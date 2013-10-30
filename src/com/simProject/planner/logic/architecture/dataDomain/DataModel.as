package com.simProject.planner.logic.architecture.dataDomain
{
	/**
	 * Модель данных.
	 * Определяет данные всего приложения.
	 * @author Глеб
	 */	
	public final class DataModel
	{
		/** Товары. */
		private var _goods:Vector.<Commodity> = null;
		/** Стойка. */
		private var _rack:Detail = null;
		/** Рельс. */
		private var _rail:Detail = null;
		/** Сборки. */
		private var _assemblies:Vector.<Assembly> = null;

		/**
     	 * Конструктор класса.
		 * Создаёт экземпляр модели данных, устанавливает все данные.
		 * 
		 * @param goods товары
		 * @param rack стойка
		 * @param rail рельс
		 * @param assemblies сборки
		 * 
		 */
		public function DataModel(
				goods:Vector.<Commodity>,
				rack:Detail,
				rail:Detail,
				assemblies:Vector.<Assembly>
			)
		{
			this._goods = goods;
			this._rack = rack;
			this._rail = rail;
			this._assemblies = assemblies;
		}
		
		/** Товары. */
		public function get goods():Vector.<Commodity>
		{
			return _goods;
		}

		/** Стойка. */
		public function get rack():Detail
		{
			return _rack;
		}

		/** Рельс. */
		public function get rail():Detail
		{
			return _rail;
		}

		/** Сборки. */
		public function get assemblies():Vector.<Assembly>
		{
			return _assemblies;
		}
		
		/** Возвращает строковое представление модели данных. */
		public function toString():String
		{
			return	"===DataModel===" + "\n" +
				"goods:" + "\n" +
				_goods + "\n" +
				"rack" + "\n" +
				_rack + "\n" +
				"rail" + "\n" +
				_rail + "\n" +
				"assemblies" + "\n" +
				_assemblies + "\n" +
				"===============";
		}
		
	}
}