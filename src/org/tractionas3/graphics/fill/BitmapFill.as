/** * @version 1.0 * @author David A *  *  * Copyright (c) 2009 David A *  * Permission is hereby granted, free of charge, to any person obtaining a copy * of this software and associated documentation files (the "Software"), to deal * in the Software without restriction, including without limitation the rights * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell * copies of the Software, and to permit persons to whom the Software is * furnished to do so, subject to the following conditions: *  * The above copyright notice and this permission notice shall be included in * all copies or substantial portions of the Software. *  * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN * THE SOFTWARE. * */package org.tractionas3.graphics.fill{	import org.tractionas3.geom.Dimension;	import flash.display.BitmapData;	import flash.display.Graphics;	import flash.geom.Matrix;	import flash.geom.Point;	/**	 * BitmapFill fills a Graphics object with a bitmap fill.	 */	public class BitmapFill implements IFill 	{			/**		 * Specifies the rotation of the bitmap fill		 */		public var rotation:Number;		/**		 * Specifies whether the bitmap fill is smoothed		 */		public var smooth:Boolean;		/**		 * Specifies whether the bitmap fill is repeating		 */		public var repeat:Boolean;		/**		 * Specifies the bitmap data of the bitmap fill		 */		public var bitmapData:BitmapData;		/**		 * Specifies the origin of the bitmap fill. 		 */		public var origin:Point;		/**		 * Specifies the offset of the bitmap fill.		 */		public var offset:Point;		/**		 * Specifies the scale of the bitmap fill along the x axis. 		 */		public var scaleX:Number;		/**		 * Specifies the scale of the bitmap fill along the y axis. 		 */		public var scaleY:Number;		private var _matrix:Matrix;		/**		 * Creates a new  BitmapFill object.		 * 		 * @param bitmapDataSource A BitmapData object to be used as bitmap fill source.		 */		public function BitmapFill(bitmapDataSource:BitmapData)		{			bitmapData = bitmapDataSource;						rotation = 0;						smooth = false;						repeat = true;						origin = new Point(0, 0);						offset = new Point(0, 0);						scaleX = 1;						scaleY = 1;		}		/**		 * @inheritDoc		 */		public function begin(graphics:Graphics, fillDimension:Dimension = null, clearGraphics:Boolean = false):void		{			_matrix = new Matrix();						_matrix.translate(-origin.x, -origin.y);						_matrix.scale(scaleX, scaleY);						_matrix.rotate(rotation);						_matrix.translate(offset.x, offset.y);						graphics.beginBitmapFill(bitmapData, _matrix, repeat, smooth);		}		/**		 * @inheritDoc		 */		public function end(graphics:Graphics):void		{			graphics.endFill();		}	}}