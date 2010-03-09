/** * @version 1.0 * @author David Dahlstroem | daviddahlstroem.com *  *  * Copyright (c) 2009 David Dahlstroem | daviddahlstroem.com *  * Permission is hereby granted, free of charge, to any person obtaining a copy * of this software and associated documentation files (the "Software"), to deal * in the Software without restriction, including without limitation the rights * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell * copies of the Software, and to permit persons to whom the Software is * furnished to do so, subject to the following conditions: *  * The above copyright notice and this permission notice shall be included in * all copies or substantial portions of the Software. *  * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN * THE SOFTWARE. * */package org.tractionas3.load{	import org.tractionas3.core.interfaces.ICloneable;	import org.tractionas3.core.interfaces.ICoreInterface;	import org.tractionas3.core.interfaces.IResetable;	import org.tractionas3.load.loaders.BytesTotalPrefetcher;	import flash.net.URLRequest;	/**	 * ILoadable interface is the core interface for all loader classes defining the core loading functionality.	 */	public interface ILoadable extends ICoreInterface, ICloneable, IResetable	{		/**		 * Initiates the loading process of the loader. A new URLRequest cannot be defined through this method. 		 */		function load(newURL:String = null):void;		/**		 * Returns a value between zero and one indicating the current loading progress of the loader.		 */		function get progress():Number;		/**		 * @return The data of the loader. May return <code>null</code> until the loader has finished loading.		 * @see #loaded		 * @see #loading 		 */		function get data():*;		/**		 * Instructs the loader to prefech the total file size of target file without having to start the actual loading progress.		 * 		 * @see org.tractionas3.events.LoaderEvent#BYTESTOTAL_PREFETCHED		 */		function prefetchBytesTotal():void;		/**		 * Returns the bytesTotal prefetcher instance.		 */		function get bytesTotalPrefetcher():BytesTotalPrefetcher;		/**		 * Returns the <code>URLRequest</code> of the loader. The <code>URLRequest</code> cannot be changed.		 */		function getURLRequest():URLRequest;		/**		 * Returns the url of the loader. The url property cannot be changed.		 */		function get url():String;		function set url(newURL:String):void;		/**		 * Indicates whether the loader is cancelable. Cancelable loaders may be interrupted while loading.		 * Note that if you wish to cancel a loading process to resume it later you need to use the <code>reset()</code> method before calling		 * the <code>load()</code> method again.		 * 		 * @see org.tractionas3.core.interfaces.Cancelable;		 * @see reset()		 * @see load()		 */		function get cancelable():Boolean;		/**		 * Indicates the number of total bytes of the loaders target file.		 * @return Total bytes from started loading process or prefetched file size via <code>prefetchBytesTotal()</code>, otherwise zero.		 */		function get bytesTotal():int;		/**		 * Indicates the number of loaded bytes from the loaders target file.		 * @return Zero if loading process has not begun.		 */		function get bytesLoaded():uint;		/**		 * Indicates, in milliseconds, the time elapsed from loading start to loading completion.		 */		function get loadTime():uint;		/**		 * Indicates whether the loading process has finished.		 */		function get loaded():Boolean;		/**		 * Indicates whether the loading process is running.		 */		function get loading():Boolean;		/**		 * Defines the priority of the loader.		 * Loaders with a high priority value will be loaded before loaders with a higher priority value		 * in a loader queue.		 * 		 * @see org.tractionas3.load.LoaderQueue		 * @see org.tractionas3.load.LoadManager		 */		function get priority():uint;		function set priority(value:uint):void;		/**		 * Specifies the name of the loader.		 * A loader name must be unique.		 */		function get name():String;		function set name(value:String):void;	}}