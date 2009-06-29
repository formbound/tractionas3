/** * @version 1.0 * @author David Dahlstroem | daviddahlstroem.com *  *  * Copyright (c) 2009 David Dahlstroem | daviddahlstroem.com *  * Permission is hereby granted, free of charge, to any person obtaining a copy * of this software and associated documentation files (the "Software"), to deal * in the Software without restriction, including without limitation the rights * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell * copies of the Software, and to permit persons to whom the Software is * furnished to do so, subject to the following conditions: *  * The above copyright notice and this permission notice shall be included in * all copies or substantial portions of the Software. *  * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN * THE SOFTWARE. * */package org.tractionas3.profiler {	import flash.system.System;		/**	 * MemoryProfiler is used to monitor the memory usage of a Flash application.	 */		public class MemoryProfiler 	{		private var _peakMemory:uint;				/**		 * Creates a new MemoryProfiler object.		 */				public function MemoryProfiler()		{			super();		}				/**		 * Indicates, in bytes, the current usage of memory. 		 */				public function get currentMemory():uint		{						var m:uint = System.totalMemory;						_peakMemory = Math.max(_peakMemory, m);						return m;		}				/**		 * Indicates, in bytes, the highest recorded usage of memory. 		 */				public function get peakMemory():uint		{			return _peakMemory;		}	}}