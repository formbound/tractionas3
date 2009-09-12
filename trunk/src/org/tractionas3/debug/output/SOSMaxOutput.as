/** * @version 1.0 * @author David Dahlstroem | daviddahlstroem.com *  *  * Copyright (c) 2009 David Dahlstroem | daviddahlstroem.com *  * Permission is hereby granted, free of charge, to any person obtaining a copy * of this software and associated documentation files (the "Software"), to deal * in the Software without restriction, including without limitation the rights * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell * copies of the Software, and to permit persons to whom the Software is * furnished to do so, subject to the following conditions: *  * The above copyright notice and this permission notice shall be included in * all copies or substantial portions of the Software. *  * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN * THE SOFTWARE. * */package org.tractionas3.debug.output {	import org.tractionas3.core.CoreObject;	import org.tractionas3.core.interfaces.IConnectable;	import org.tractionas3.debug.LogLevel;	import org.tractionas3.debug.LogMessage;	import org.tractionas3.debug.Logger;	import org.tractionas3.debug.StackTraceEntry;	import org.tractionas3.debug.log;	import org.tractionas3.debug.output.ILoggerOutput;	import flash.events.Event;	import flash.events.IOErrorEvent;	import flash.events.SecurityErrorEvent;	import flash.net.XMLSocket;	import flash.utils.setTimeout;	/**	 * SOSMaxOutput allows you to relay debug messages to SOSMax.	 * <p />	 * <a href="http://solutions.powerflasher.com/products/sosmax/" target="_blank">SOSMax website</a>	 * 	 * @see org.tractionas3.debug.Logger	 * @see org.tractionas3.debug.Logger#addOutput()	 */	public class SOSMaxOutput extends CoreObject implements ILoggerOutput, IConnectable	{		public static var HOST:String = "localhost";		public static var PORT:uint = 4444;		private var _socket:XMLSocket;		private var _buffer:Array;		private var _connected:Boolean;				/**		 * Creates a new SOSMaxOutput object.		 * SOSMaxOutput attempts to connect to SOSMax directly.		 */		public function SOSMaxOutput()		{			_socket = new XMLSocket();						_connected = false;						_buffer = [];									_socket.addEventListener(Event.CONNECT, handleSocketEvents);			_socket.addEventListener(IOErrorEvent.IO_ERROR, handleSocketEvents);			_socket.addEventListener(SecurityErrorEvent.SECURITY_ERROR, handleSocketEvents);						connect();		}		/**		 * Attempts to connect to SOSMax		 */		public function connect():void		{			try			{				_socket.connect(SOSMaxOutput.HOST, SOSMaxOutput.PORT);			}			catch (error:SecurityError)			{				if(Logger.hasOutput(this)) Logger.removeOutput(this);								log("SecurityError: " + error, LogLevel.TRACTIONAS3);			} 		}		/**		 * Disconnects from SOSMax.		 */		public function disconnect():void		{			_socket.close();		}		/**		 * Indicates whether SOSMaxOutput is connected to SOSMax.		 */		public function get connected():Boolean		{			return _connected;		}		/**		 * @inheritDoc		 */		public function send(message:LogMessage):void		{			if(!_connected)			{				_buffer.push(message);								return;			}						var			output:String = "!SOS<showFoldMessage key='" + resolveLogMessageType(message.level) + "'>";						output += "<title>" + message.text + "</title>";						output += "<message>";						var stackTrace:StackTraceEntry = message.stackTrace.entries[message.stackTrace.entries.length - 1] as StackTraceEntry;						output += "at " + stackTrace.className + "." + stackTrace.methodName + ", line " + stackTrace.line + "\n";						output += "</message>";  			output += "</showFoldMessage>";  						_socket.send(output);		}		/**		 * @inheritDoc		 */		override public function destruct(deepDestruct:Boolean = false):void		{			Logger.removeOutput(this);						if(_connected) _socket.close();						_socket = null;						_connected = false;						super.destruct(deepDestruct);		}		private function handleSocketEvents(e:Event):void		{			switch(e.type)			{				case Event.CONNECT:					_connected = true;										log("SOSMAXOutput successfully connected!", LogLevel.TRACTIONAS3);										if(_buffer.length > 0)					{						for(var i:int = 0;i < _buffer.length; ++i)						{							send(_buffer[i] as LogMessage);							}												_buffer = [];					}									_socket.removeEventListener(Event.CONNECT, handleSocketEvents);										break;								case IOErrorEvent.IO_ERROR:									_socket.removeEventListener(IOErrorEvent.IO_ERROR, handleSocketEvents);										log("SOSMaxOutput was unable to connect. Retrying in 5 seconds.", LogLevel.TRACTIONAS3);										setTimeout(connect, 5000);												break;								case SecurityErrorEvent.SECURITY_ERROR:									Logger.removeOutput(this);									log("SOSMax Security error: " + e, LogLevel.TRACTIONAS3);										_socket.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, handleSocketEvents);					break;			}		}		private function resolveLogMessageType(messageType:uint):String		{				switch(messageType)			{				case LogLevel.TRACE:					return "trace";					break;								case LogLevel.INFO:					return "info";					break;								case LogLevel.STATUS:					return "info";					break;								case LogLevel.NOTICE:					return "info";					break;								case LogLevel.DEBUG:					return "debug";					break;								case LogLevel.WARNING:					return "warning";					break;								case LogLevel.ERROR:					return "error";					break;								case LogLevel.FATAL:					return "fatal";					break;				case LogLevel.TRACTIONAS3:					return "info";					break;			}						return "trace";		}	}}