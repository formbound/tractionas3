/** * @version 1.0 * @author David A *  *  * Copyright (c) 2009 David A *  * Permission is hereby granted, free of charge, to any person obtaining a copy * of this software and associated documentation files (the "Software"), to deal * in the Software without restriction, including without limitation the rights * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell * copies of the Software, and to permit persons to whom the Software is * furnished to do so, subject to the following conditions: *  * The above copyright notice and this permission notice shall be included in * all copies or substantial portions of the Software. *  * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN * THE SOFTWARE. * */ package org.tractionas3.debug {	import org.tractionas3.core.CoreObject;	/**	 * Stacktrace is used to store a stacktrace in separate stacktrace entries.	 */	public class StackTrace extends CoreObject	{		private var _traces:Array;		/**		 * Creates a new StackTrace object.		 */		public function StackTrace()		{			_traces = [];		}		/**		 * Adds a stack trace entry to the StackTrace object		 */		public function addTrace(t:StackTraceEntry):StackTraceEntry		{			_traces.push(t);						return t;		}		/**		 * An array containing the different entries of the stacktrace.		 */		public function get entries():Array		{			return _traces;		}		/**		 * @inheritDoc		 */		override public function destruct(deepDestruct:Boolean = false):void		{			_traces = null;						super.destruct(deepDestruct);		}	}}