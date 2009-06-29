/** * @version 1.0 * @author David Dahlstroem | daviddahlstroem.com *  *  * Copyright (c) 2009 David Dahlstroem | daviddahlstroem.com *  * Permission is hereby granted, free of charge, to any person obtaining a copy * of this software and associated documentation files (the "Software"), to deal * in the Software without restriction, including without limitation the rights * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell * copies of the Software, and to permit persons to whom the Software is * furnished to do so, subject to the following conditions: *  * The above copyright notice and this permission notice shall be included in * all copies or substantial portions of the Software. *  * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN * THE SOFTWARE. * */package org.tractionas3.managers {	import org.tractionas3.core.Application;	import org.tractionas3.events.WeakEventDispatcher;	import flash.events.ContextMenuEvent;	import flash.ui.ContextMenu;	import flash.ui.ContextMenuItem;		/**	 * ContextMenuManager is used to manage the context menu of the Flash Player.	 */		public class ContextMenuManager extends WeakEventDispatcher	{		private static var _instance:ContextMenuManager;

		private var _contextMenu:ContextMenu;
				/**		 * @private		 */		
		public function ContextMenuManager(singletonEnforcer:SingletonEnforcer)		{			if(!singletonEnforcer)			{				throw new ArgumentError("ContextMenuManager is a singleton class and may only be accessed via its accessor method getInstance().");				return;			}						_contextMenu = new ContextMenu();						_contextMenu.addEventListener(ContextMenuEvent.MENU_SELECT, handleEvents);						Application.root.contextMenu = _contextMenu;		}
				/**		 * ContextMenuManager accessor.		 */		
		public static function getInstance():ContextMenuManager 		{			if(_instance == null) _instance = new ContextMenuManager(new SingletonEnforcer());			return _instance;		}
				/**		 * Adds a context menu item to the context menu.		 * 		 * @param menuItem Menu item to be added.		 */		
		public function addMenuItem(menuItem:ContextMenuItem):ContextMenuItem		{			var item:ContextMenuItem = menuItem;						_contextMenu.customItems.push(item);						return item;		}				/**		 * Removes a context menu item from the context menu.		 * 		 * @param menuItem Menu item to be removed.		 */				
		public function removeMenuItem(menuItem:ContextMenuItem):void		{			for(var i:int = 0;i < _contextMenu.customItems.length; ++i)			{				if(_contextMenu.customItems[i] == menuItem)				{					_contextMenu.customItems.splice(i, 1);					return;
				}			}		}		
		private function handleEvents(e:ContextMenuEvent):void		{				switch(e.type)			{				case ContextMenuEvent.MENU_SELECT:					this.dispatchEvent(e);					break;			}		}	}}

internal class SingletonEnforcer 
{
}