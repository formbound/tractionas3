/** * @version 1.0 * @author David Dahlstroem | daviddahlstroem.com *  *  * Copyright (c) 2009 David Dahlstroem | daviddahlstroem.com *  * Permission is hereby granted, free of charge, to any person obtaining a copy * of this software and associated documentation files (the "Software"), to deal * in the Software without restriction, including without limitation the rights * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell * copies of the Software, and to permit persons to whom the Software is * furnished to do so, subject to the following conditions: *  * The above copyright notice and this permission notice shall be included in * all copies or substantial portions of the Software. *  * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN * THE SOFTWARE. * */package org.tractionas3.load.loaders{	import org.tractionas3.core.interfaces.ICloneable;	import org.tractionas3.load.ILoadable;	import flash.display.BitmapData;	import flash.display.DisplayObject;	/**	 * BitmapDataLoader loads the bitmap data of an external image.	 */	public class BitmapDataLoader extends DisplayLoader implements ILoadable	{		/**		 * Specifies whether the BitmapData allows transparency when <i>BitmapDataLoader.data</i> is retrieved.		 */		public var allowTransparency:Boolean;		/**		 * Specifies the fill color of the BitmapData when <i>BitmapDataLoader.data</i> is retrieved. 		 */		public var fillColor:uint;		/**		 * Creates a new BitmapDataLoader object.		 * 		 * @param url The URL from wich the data should be loaded.		 * @param loaderName Assigned name to the loader.		 */		public function BitmapDataLoader(url:String = null, loaderName:String = null)		{			super(url, loaderName);		}		/**		 * Returns the loaded data as a new BitmapData object created from the loaded image.		 * @inheritDoc		 */		override public function get data():*		{				var loadedContent:DisplayObject = super.data as DisplayObject;						var bitmapData:BitmapData = new BitmapData(loadedContent.width, loadedContent.height, allowTransparency, fillColor);						bitmapData.draw(loadedContent);						return bitmapData;		}		/**		 * @inheritDoc		 */		override public function reset():void		{			allowTransparency = true;						fillColor = 0xFF0000;						super.reset();		}		/**		 * @inheritDoc		 */		override public function clone():ICloneable		{			var			loader:BitmapDataLoader = new BitmapDataLoader(url, name);						loader.allowTransparency = allowTransparency;						loader.fillColor = fillColor;						return loader;		}	}}