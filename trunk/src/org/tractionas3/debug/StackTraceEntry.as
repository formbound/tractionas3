/** * @version 1.0 * @author David Dahlstroem | daviddahlstroem.com *  *  * Copyright (c) 2009 David Dahlstroem | daviddahlstroem.com *  * Permission is hereby granted, free of charge, to any person obtaining a copy * of this software and associated documentation files (the "Software"), to deal * in the Software without restriction, including without limitation the rights * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell * copies of the Software, and to permit persons to whom the Software is * furnished to do so, subject to the following conditions: *  * The above copyright notice and this permission notice shall be included in * all copies or substantial portions of the Software. *  * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN * THE SOFTWARE. * */ package org.tractionas3.debug {	import org.tractionas3.core.CoreObject;	import org.tractionas3.core.interfaces.CoreInterface;	/**	 * StackTraceEntry represents a stacktrace entry of a stacktrace.	 */	public class StackTraceEntry extends CoreObject implements CoreInterface 	{		/**		 * Name of class		 */				public var className:String;				/**		 * Name of method		 */				public var methodName:String;				/**		 * Line number		 */				public var line:int;			/**		 * File name		 */				public var file:String;		/**		 * Parses a stacktrace entry and applies the values to the StackTraceEntry instance.		 */		public function parseTrace(traceString:String):void		{			traceString = traceString.replace("\t", "");						traceString = traceString.replace("at ", "");						var lt:Array = traceString.split("[");						traceString = lt[0] as String;						var rt:Array = String(lt[1]).split(":");						line = parseInt(rt[1]);						file = rt[0] as String;						var divTrace:Array = traceString.split("/");						className = divTrace[0] as String;						if(className.charAt(className.length - 1) == ")")			{				className = className.split("(")[0] as String;								methodName = "constructor()";			}			else			{				methodName = divTrace[1] as String;			}			className = className.replace("::", ".");		}	}}