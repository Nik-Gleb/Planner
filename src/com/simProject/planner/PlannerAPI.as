<<<<<<< HEAD
/*
 * SIM-PROJECT PLANNER
 * Copyright 2013
 * 
 * Sim-Project Inc.
 * All Rights Reserved.
 *
 * NOTICE: Sim-Project permits you to use, modify, and distribute this file in 
 * accordance with the terms of the license agreement accompanying it.
 **/
package com.simProject.planner
{
	import com.simProject.planner.core.PlannerScreen;
	
	import mx.core.Application;
	import mx.core.FlexGlobals;
	
	import spark.components.Button;

	/**
	 * Главный класс приложения.
	 * 
	 * <p>Определяет взаимодействие MXML и ActionScript.</p>
	 * 
	 * @author Gleb Nikitenko
	 **/
	internal final class PlannerAPI
	{
		/** Информация о верссии. */
		include "Version.as";
		
		/** Текущий экран приложения. */
		private static var currentScreen:String = PlannerScreen.SPLASH;
		
		/**
		 * Конструктор.
		 * Создаёт новый экземпляр класса.
		 **/ 
		public function PlannerAPI()
		{
			
		}
		
		/**
		 * Метод инициализирует класс.
		 */
		public static function initialize():void
		{
			trace("PlannerAPI.initialize()");
			
		}
		
		/**
		 * Метод вызывается при клике по кнопке "ForwradButton".
		 */ 
		public static function onForwardButtonClick():void
		{
			/*
			switch(currentScreen)
			{
				case PlannerScreen.SHELF_SIZES:
				{
					
					break;
				}
					
				default:
				{
					break;
				}
			}*/
			trace("PlannerAPI.onForwardButtonClick()");
			
		}
		
		/**
		 * Метод вызывается при клике по кнопке "BackButton".
		 */ 
		public static function onBackButtonClick():void
		{
			trace("PlannerAPI.onBackButtonClick()");
			
			var button:Button = Button(FlexGlobals.topLevelApplication["forwardButton"]);
			trace(button.enabled);
		}

	}
=======
/*
 * SIM-PROJECT PLANNER
 * Copyright 2013
 * 
 * Sim-Project Inc.
 * All Rights Reserved.
 *
 * NOTICE: Sim-Project permits you to use, modify, and distribute this file in 
 * accordance with the terms of the license agreement accompanying it.
 **/
package com.simProject.planner
{
	import com.simProject.planner.core.PlannerScreen;
	
	import mx.core.Application;
	import mx.core.FlexGlobals;
	
	import spark.components.Button;

	/**
	 * Главный класс приложения.
	 * 
	 * <p>Определяет взаимодействие MXML и ActionScript.</p>
	 * 
	 * @author Gleb Nikitenko
	 **/
	internal final class PlannerAPI
	{
		/** Информация о верссии. */
		include "Version.as";
		
		/** Текущий экран приложения. */
		private static var currentScreen:String = PlannerScreen.SPLASH;
		
		/**
		 * Конструктор.
		 * Создаёт новый экземпляр класса.
		 **/ 
		public function PlannerAPI()
		{
			
		}
		
		/**
		 * Метод инициализирует класс.
		 */
		public static function initialize():void
		{
			trace("PlannerAPI.initialize()");
			
		}
		
		/**
		 * Метод вызывается при клике по кнопке "ForwradButton".
		 */ 
		public static function onForwardButtonClick():void
		{
			/*
			switch(currentScreen)
			{
				case PlannerScreen.SHELF_SIZES:
				{
					
					break;
				}
					
				default:
				{
					break;
				}
			}*/
			trace("PlannerAPI.onForwardButtonClick()");
			
		}
		
		/**
		 * Метод вызывается при клике по кнопке "BackButton".
		 */ 
		public static function onBackButtonClick():void
		{
			trace("PlannerAPI.onBackButtonClick()");
			
			var button:Button = Button(FlexGlobals.topLevelApplication["forwardButton"]);
			trace(button.enabled);
		}

	}
>>>>>>> b7404822940bc7efd1279e6bd291f82811180eb2
}