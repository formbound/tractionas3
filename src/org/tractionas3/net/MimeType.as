/** * @version 1.0 * @author David A *  *  * Copyright (c) 2009 David A *  * Permission is hereby granted, free of charge, to any person obtaining a copy * of this software and associated documentation files (the "Software"), to deal * in the Software without restriction, including without limitation the rights * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell * copies of the Software, and to permit persons to whom the Software is * furnished to do so, subject to the following conditions: *  * The above copyright notice and this permission notice shall be included in * all copies or substantial portions of the Software. *  * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN * THE SOFTWARE. * */package org.tractionas3.net {	import org.tractionas3.load.loaders.BitmapLoader;	import org.tractionas3.load.loaders.SWFLoader;	import org.tractionas3.load.loaders.SoundLoader;	import org.tractionas3.load.loaders.StyleSheetLoader;	import org.tractionas3.load.loaders.VideoLoader;	public class MimeType 	{		public static const SWF:MimeType = addMimeType(new MimeType("application/x-shockwave-flash", ["swf"], SWFLoader));		public static const MP3:MimeType = addMimeType(new MimeType("audio/mpeg", ["mp3","mpga","mp2", "f4a", "f4b"], SoundLoader));		public static const JPEG:MimeType = addMimeType(new MimeType("image/jpeg", ["jpg","jpeg","jpe"], BitmapLoader));		public static const PNG:MimeType = addMimeType(new MimeType("image/png", ["png"], BitmapLoader));		public static const FLV:MimeType = addMimeType(new MimeType("video/x-flv", ["flv"], VideoLoader));		public static const F4V:MimeType = addMimeType(new MimeType("video/mp4", ["f4v"], VideoLoader));		public static const QUICKTIME:MimeType = addMimeType(new MimeType("video/quicktime", ["mov, qt", "mp4"], VideoLoader));		public static const CSS:MimeType = addMimeType(new MimeType("text/css", ["css"], StyleSheetLoader));		private static var _mimeTypes:Array;		public static function addMimeType(mimeType:MimeType):MimeType		{			if(!_mimeTypes) _mimeTypes = [];						_mimeTypes.push(mimeType);						return mimeType;		}		public static function getLoadableMimeTypes():Array		{			var a:Array = [];						var mimeType:MimeType;						for(var i:int = 0;i < _mimeTypes.length;++i)			{				mimeType = _mimeTypes[i] as MimeType;								if(mimeType.hasLoadSupport) a.push(mimeType);			}						return a;		}				public static function getMimeTypeByExtension(extension:String):MimeType		{			var mimeType:MimeType;						for(var i:int = 0;i < _mimeTypes.length;++i)			{				mimeType = _mimeTypes[i] as MimeType;								if(mimeType.extensions.indexOf(extension) >= 0)				{					return mimeType;				}			}						return null;		}		private var _type:String;		private var _extensions:Array;		private var _loaderClass:Class;		public function MimeType(type:String, extensions:Array, loaderClass:Class = null)		{			_type = type;						_extensions = extensions;						_loaderClass = loaderClass;		}		public function get type():String		{			return _type;		}		public function get loaderClass():Class		{			return _loaderClass;		}		public function get extensions():Array		{			return _extensions;		}		public function get hasLoadSupport():Boolean		{			return loaderClass != null;		}	}}