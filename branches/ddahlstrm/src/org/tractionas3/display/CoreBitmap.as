/**
 * @version 1.0
 * @author David Dahlstroem | daviddahlstroem.com
 * 
 * 
 * Copyright (c) 2009 David Dahlstroem | daviddahlstroem.com
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 *
 */
 
package org.tractionas3.display 
{
	import org.tractionas3.core.interfaces.ICoreInterface;
	import org.tractionas3.reflection.stringify;

	import flash.display.Bitmap;
	import flash.display.BitmapData;
	/**
	 * CoreBitmap is the core Bitmap class of the TractionAS3 API.
	 */

	public class CoreBitmap extends Bitmap implements ICoreInterface 
	{
		public function CoreBitmap(bitmapData:BitmapData = null, pixelSnapping:String = "auto", smoothing:Boolean = false)
		{
			super(bitmapData, pixelSnapping, smoothing);
		}

		/**
		 * Returns a string representation of the CoreSprite instance.
		 */

		override public function toString():String
		{
			return stringify(this);
		}

		/**
		 * @inheritDoc
		 */

		public function destruct(deepDestruct:Boolean = false):void
		{
			if(bitmapData) bitmapData.dispose();
		}

		/**
		 * @inheritDoc
		 */

		public function listDestructableProperties():Array
		{
			return ["bitmapData"];
		}
	}
}
