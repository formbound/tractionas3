/** * @version 1.0 * @author David A *  *  * Copyright (c) 2009 David A *  * Permission is hereby granted, free of charge, to any person obtaining a copy * of this software and associated documentation files (the "Software"), to deal * in the Software without restriction, including without limitation the rights * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell * copies of the Software, and to permit persons to whom the Software is * furnished to do so, subject to the following conditions: *  * The above copyright notice and this permission notice shall be included in * all copies or substantial portions of the Software. *  * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN * THE SOFTWARE. * */package org.tractionas3.geom {	import org.tractionas3.core.Destructor;	import org.tractionas3.core.interfaces.ICoreInterface;	import flash.display.Graphics;	import flash.geom.Rectangle;	/**	 * Grid represents an abstract grid containing rows and coumns.	 */	public class Grid extends Rectangle implements ICoreInterface	{			/**		 * Specifies the margin of each column.		 */		public var colMargin:Number;		/**		 * Specifies the margin of each row.		 */		public var rowMargin:Number;		private var _numRows:uint;		private var _numCols:uint;		/**		 * Creates a new Grid object.		 */		public function Grid(x:Number, y:Number, width:Number, height:Number, rows:uint, cols:uint)		{			super(x, y, width, height);						numRows = rows;						numCols = cols;						colMargin = 0;						rowMargin = 0;		}		/**		 * Returns a new Rectangle object with properties matching the grid.		 */		public function getRect():Rectangle		{			return new Rectangle(x, y, width, height);		}		/**		 * Specifies the number of rows in the grid.		 */		public function get numRows():uint		{			return _numRows;		}		public function set numRows(value:uint):void		{			_numRows = value;		}		/**		 * Indicates the number of columns in the grid.		 */		public function get numCols():uint		{			return _numCols;		}		public function set numCols(value:uint):void		{			_numCols = value;		}		/**		 * Indicates the number of cells in the grid.		 */		public function get numCells():uint		{			return numCols * numRows;		}		/**		 * Specifies the width of each cell in the grid.		 */		public function get cellWidth():Number		{			return (width - colMargin * numCols) / numCols;		}		public function set cellWidth(value:Number):void		{			width = (value + colMargin) * numCols;		}		/**		 * Specifies the height of each cell in the grid.		 */		public function get cellHeight():Number		{			return (height - rowMargin * numRows) / numRows;		}		public function set cellHeight(value:Number):void		{			height = (value + rowMargin) * numRows;		}		/**		 * Returns a cell coordinate based on specified row and column index.		 * 		 * @param colIndex Column index		 * @param rowIndex Row index		 */		public function getCellCoordinate(colIndex:uint, rowIndex:uint):Coordinate		{			if(colIndex > numCols || rowIndex > numRows) return null;						return new Coordinate(colIndex * (cellWidth + colMargin), rowIndex * (cellHeight + rowMargin));		}		/**		 * Returns a new rectangle representing the x and y location and dimension of a cell based on specified row and column index.		 * 		 * @param colIndex Column index		 * @param rowIndex Row index		 */		public function getCellRect(colIndex:uint, rowIndex:uint):Rectangle		{			if(colIndex > numCols || rowIndex > numRows) return null;						return new Rectangle(colIndex * (cellWidth + colMargin), rowIndex * (cellHeight + rowMargin), cellWidth, cellHeight);		}		/**		 * Returns an array containing coordinates of each cell in the grid.		 */		public function getCellCoordinates():Array		{			var a:Array = [];						var cx:Number;						var cy:Number;						for(var i:int = 0;i < numCols;++i)			{				cx = (cellWidth + colMargin) * i;								for(var ii:int = 0;ii < numRows;++ii)				{					cy = (cellHeight + rowMargin) * ii;										a.push(new Coordinate(cx, cy));				}			}						return a;		}		/**		 * Returns an array containing Rectangle objects representing the x and y location and dimension of each cell in the grid.		 */		public function getCellRects():Array		{			var a:Array = [];						var cx:Number;						var cy:Number;						for(var i:int = 0;i < numCols;++i)			{				cx = (cellWidth + colMargin) * i;								for(var ii:int = 0;ii < numRows;++ii)				{					cy = (cellHeight + rowMargin) * ii;										a.push(new Rectangle(cx, cy, cellWidth, cellHeight));				}			}						return a;		}		/**		 * Visualizes the grid to graphics object of a shape.		 * 		 * @param graphics target Graphics object		 * @param color Grid visualization color		 */		public function visualize(graphics:Graphics, color:uint = 0xFF0000):void		{			graphics.lineStyle(1, color);						var rects:Array = getCellRects();						for(var i:int = 0;i < rects.length;++i)			{				var rect:Rectangle = rects[i] as Rectangle;								graphics.drawRect(x + rect.x, y + rect.y, rect.width, rect.height);			}						rects = null;		}		/**		 * @inheritDoc		 */		public function destruct(deepDestruct:Boolean = false):void		{			Destructor.destruct(this, deepDestruct);		}		/**		 * @inheritDoc		 */		public function listDestructableProperties():Array		{			return ["colMargin", "rowMargin", "width", "height", "x", "y"];		}		/**		 * @inheritDoc		 */		override public function toString():String		{			return stringify(this);		}	}}