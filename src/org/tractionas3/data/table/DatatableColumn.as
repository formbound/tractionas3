/** * @version 1.0 * @author David Dahlstroem | daviddahlstroem.com *  *  * Copyright (c) 2009 David Dahlstroem | daviddahlstroem.com *  * Permission is hereby granted, free of charge, to any person obtaining a copy * of this software and associated documentation files (the "Software"), to deal * in the Software without restriction, including without limitation the rights * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell * copies of the Software, and to permit persons to whom the Software is * furnished to do so, subject to the following conditions: *  * The above copyright notice and this permission notice shall be included in * all copies or substantial portions of the Software. *  * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN * THE SOFTWARE. * */package org.tractionas3.data.table {	import org.tractionas3.core.CoreObject;	import org.tractionas3.core.Destructor;	import org.tractionas3.core.interfaces.CoreInterface;	import org.tractionas3.reflection.stringify;	/**	 * DataTableColumn represents a column in a DataTable instance.	 * 	 * @see org.tractionas3.data.table.DataTable 	 */	public class DatatableColumn extends CoreObject implements CoreInterface 	{		private var _values:Array;		private var _field:DatatableField;		/**		 * Creates a new DataTableColumn object.		 */			public function DatatableColumn(field:DatatableField)		{			super();						_field = field;						_values = [];		}		/**		 * Adds a value to the data table column.		 */		public function addValue(value:*):*		{						if(value is _field.dataType)			{				return _values.push(value);			}			else			{				throw new TypeError("Data type missmatch at " + _field.name + ". Accepted data type is " + _field.dataType);			}		}		/**		 * Removes a value from the data table column at specified index.		 */		public function removeValueAt(index:uint):void		{			_values.splice(index, 1);		}		/**		 * Returns a data table column value at specified index.		 */		public function getValueAt(index:uint):*		{			return _values[index];		}		/**		 * Returns a new array containing all values in the data table column.		 */		public function get values():Array		{			var a:Array = [];						for(var i:int = 0;i < _values.length; ++i)			{				a.push(_values[i]);			}						return a;		}		/**		 * @inheritDoc		 */		override public function destruct(deepDestruct:Boolean = false):void		{			if(deepDestruct) Destructor.destructMultiple(_values);						_values = null;						_field = null;						super.destruct(deepDestruct);		}		/**		 * Returns a string represenation of the data table column.		 */		override public function toString():String		{			return stringify(this);		}	}}