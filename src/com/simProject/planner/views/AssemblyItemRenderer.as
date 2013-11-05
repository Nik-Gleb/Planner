package com.simProject.planner.views
{
	import com.simProject.planner.logic.architecture.dataDomain.Assembly;
	import com.simProject.planner.logic.architecture.dataDomain.Commodity;
	
	import mx.controls.Label;
	import mx.controls.listClasses.IListItemRenderer;
	import mx.core.UIComponent;
	import mx.graphics.BitmapScaleMode;
	import mx.states.OverrideBase;
	
	import spark.components.Image;
	import spark.components.VGroup;
	import spark.layouts.HorizontalAlign;
	import spark.layouts.VerticalAlign;
	
	/**
	 * ItemRenderer для элемента списка шаблонов. 
	 * @author Глеб
	 */
	public final class AssemblyItemRenderer
		extends UIComponent implements IListItemRenderer
	{
		/** Данные компонента. */
		private var _data:Assembly = null;
		
		/** Изображение полки. */
		private var image:Image = null;
		/** Текстовая метка имени. */
		private var nameLabel:Label = null;
		
		/** Изображение фона. */
		private var image_bg:Image = null;

		
		/**
		 * Конструктор класса.
		 * Создаёт экземпляр элемента списка. 
		 */
		public function AssemblyItemRenderer()
		{
			super();
			
		}

		/** Данные компонента. */
		public function get data():Object
		{
			return _data;
		}

		/**
		 * @private
		 */
		public function set data(value:Object):void
		{
			_data = value as Assembly;
			invalidateProperties();
		}
		
		override protected function createChildren():void
		{
			// Вызываем метод createChildren() суперкласса.
			super.createChildren();
			
			// Проверки на существование объекта перед его созданием.
			// Это не обязательно, но делается потому что, подкласс может
			// создать другой дочерний объект.
			
			if (!image_bg) {
				image_bg = new Image();
				image_bg.source = "assets/shelfItem_bg.png";
				image_bg.scaleMode = BitmapScaleMode.STRETCH;
				image_bg.alpha = 0.75;
			}
			
			if (!image) {
				image = new Image();
			}
			
			if (!nameLabel) {
				nameLabel = new Label();
				nameLabel.truncateToFit = true;
				nameLabel.setStyle("fontSize", "12");
				nameLabel.setStyle("fontStyle", "normal");
				nameLabel.setStyle("fontWeight", "bold");
				nameLabel.setStyle("locale", "ru");
				nameLabel.setStyle("textAlign", "center");
			}
			
			
			/*
			if (!layout) {
				layout = new VGroup();
				layout.addElement(image);
				layout.addElement(nameLabel);
				layout.addElement(sizeLabel);
				layout.gap = 8;
				layout.paddingBottom = 8;
				layout.paddingLeft = 8;
				layout.paddingRight = 8;
				layout.paddingTop = 8;
				layout.horizontalAlign = HorizontalAlign.CONTENT_JUSTIFY;
				addChild(layout);				
			}
			*/
			//addChild(image_bg);
			addChild(image);
			addChild(nameLabel);
		}
		
		override protected function commitProperties():void  
		{
			super.commitProperties();
			if (!_data) return;
			image.source = _data.image;
			nameLabel.text = _data.name;
		}
		
		override protected function updateDisplayList(
			unscaledWidth:Number,unscaledHeight:Number):void
		{
			
			super.updateDisplayList(unscaledWidth, unscaledHeight);
			
			var nameLabelHeight:uint = nameLabel.measureText(nameLabel.text).height;
			
			var imageHeight:uint = (unscaledHeight-8) - (nameLabelHeight );
			
			image_bg.move(0,0);
			image_bg.setActualSize(unscaledWidth, unscaledHeight);
			
			image.move(4,4);
			image.setActualSize(unscaledWidth-8, imageHeight);
			
			nameLabel.move(4, imageHeight + 4);
			nameLabel.setActualSize(unscaledWidth-8, nameLabelHeight);
			

		}
		
		override protected function measure():void
		{
			super.measure();
			measuredMinWidth = 48;
			measuredMinHeight = 48;
			measuredWidth = 192;
			measuredHeight = 136;
		}

	}
}