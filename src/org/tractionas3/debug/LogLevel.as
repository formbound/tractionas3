/** * @version 1.0 * @author David A *  *  * Copyright (c) 2009 David A *  * Permission is hereby granted, free of charge, to any person obtaining a copy * of this software and associated documentation files (the "Software"), to deal * in the Software without restriction, including without limitation the rights * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell * copies of the Software, and to permit persons to whom the Software is * furnished to do so, subject to the following conditions: *  * The above copyright notice and this permission notice shall be included in * all copies or substantial portions of the Software. *  * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN * THE SOFTWARE. * */package org.tractionas3.debug {	/**	 * LogLevel contains definitions of different log message types.	 * 	 * @see org.tractionas3.debug.log	 * @see org.tractionas3.debug.Logger	 */	public class LogLevel 	{		/**		 * Log message type of trace.		 */		public static const TRACE:uint = 0;		/**		 * Log message type of info.		 */		public static const INFO:uint = 1;		/**		 * Log message type of status.		 */		public static const STATUS:uint = 2;		/**		 * Log message type of notice.		 */		public static const NOTICE:uint = 3;		/**		 * Log message type of debug.		 */		public static const DEBUG:uint = 4;		/**		 * Log message type of warning.		 */		public static const WARNING:uint = 5;		/**		 * Log message type of error.		 */		public static const ERROR:uint = 6;		/**		 * Log message type of fatal.		 */		public static const FATAL:uint = 7;		/**		 * Log message type of TractionAS3 message		 */		public static const TRACTIONAS3:uint = 8;	}}