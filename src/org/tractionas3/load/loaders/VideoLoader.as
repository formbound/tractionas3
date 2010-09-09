/** * @version 1.0 * @author David A *  *  * Copyright (c) 2009 David A *  * Permission is hereby granted, free of charge, to any person obtaining a copy * of this software and associated documentation files (the "Software"), to deal * in the Software without restriction, including without limitation the rights * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell * copies of the Software, and to permit persons to whom the Software is * furnished to do so, subject to the following conditions: *  * The above copyright notice and this permission notice shall be included in * all copies or substantial portions of the Software. *  * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN * THE SOFTWARE. * */ package org.tractionas3.load.loaders {	import org.tractionas3.core.interfaces.ICancelable;	import org.tractionas3.core.interfaces.ICloneable;	import org.tractionas3.events.EnterFrame;	import org.tractionas3.load.ILoadable;	import org.tractionas3.net.VideoStream;	/**	 * VideoLoader provides a simple API for loading video files.	 */	public class VideoLoader extends LoaderCore implements ILoadable, ICancelable	{		private var _videoStream:VideoStream;		private var _lastBytesLoaded:uint;		/**		 * Creates a new VideoLoader object.		 * 		 * @param url The URL from wich the data should be loaded.		 * @param loaderName Assigned name to the loader.		 */		public function VideoLoader(url:String = null, loaderName:String = null)		{			super(url, loaderName);						reset();		}		/**		 * @inheritDoc		 */		override public function load(newURL:String = null):void		{			if(newURL) url = newURL;						_videoStream.load(url);		}		public function get videoStream():VideoStream		{			return data as VideoStream;		}		/**		 * Returns the loaded data as a NetStream object.		 * @inheritDoc		 */		override public function get data():*		{			return _videoStream;		}		/**		 * @inheritDoc		 */		override public function clone():ICloneable		{			return new VideoLoader(url, name);		}		/**		 * @inheritDoc		 */		override public function reset():void		{			super.reset();						cancel();						if(_videoStream) setEventListeners(false);						_videoStream = new VideoStream();						_byteReference = new ByteReference(_videoStream);						if(_videoStream) setEventListeners(true);						_lastBytesLoaded = 0;		}		/**		 * @inheritDoc		 */		public function cancel():void		{			var success:Boolean = true;						try			{				_videoStream.close();			}			catch(e:Error)			{				success = false;			}						if(success) dispatchLoadCancelEvent();		}		/**		 * @inheritDoc		 */		override public function destruct(deepDestruct:Boolean = false):void		{			cancel();						setEventListeners(false);						super.destruct(deepDestruct);						if(_videoStream)			{				_videoStream.destruct(deepDestruct);			}						_videoStream = null;						_lastBytesLoaded = 0;		}		private function setEventListeners(add:Boolean):void		{				if(add)			{				EnterFrame.addEnterFrameHandler(resolveProgress);			}			else			{				EnterFrame.removeEnterFrameHandler(resolveProgress);			}		}		private function resolveProgress():void		{			if(_lastBytesLoaded == 0 && bytesLoaded > 0) dispatchLoadStartEvent();						if(bytesLoaded >= bytesTotal && bytesTotal != 0)			{				EnterFrame.removeEnterFrameHandler(resolveProgress);								dispatchLoadCompleteEvent();			}			else if(bytesLoaded > 0 && bytesTotal > 0 && bytesLoaded < bytesTotal)			{				dispatchLoadProgressEvent();			}						_lastBytesLoaded = bytesLoaded;		}	}}