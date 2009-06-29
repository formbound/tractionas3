/** * @version 1.0 * @author David Dahlstroem | daviddahlstroem.com *  *  * Copyright (c) 2009 David Dahlstroem | daviddahlstroem.com *  * Permission is hereby granted, free of charge, to any person obtaining a copy * of this software and associated documentation files (the "Software"), to deal * in the Software without restriction, including without limitation the rights * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell * copies of the Software, and to permit persons to whom the Software is * furnished to do so, subject to the following conditions: *  * The above copyright notice and this permission notice shall be included in * all copies or substantial portions of the Software. *  * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN * THE SOFTWARE. * */package org.tractionas3.load{	import org.tractionas3.core.Destructor;	import org.tractionas3.core.interfaces.CoreInterface;	import org.tractionas3.core.interfaces.Resetable;	import org.tractionas3.events.LoadObjectiveEvent;	import org.tractionas3.events.WeakEventDispatcher;	import flash.events.TimerEvent;	import flash.utils.Timer;	/**	 * Allows you to set marks defining a point in a loading process.	 * <p>	 * A LoadObjective instance defines a custom loading progress allowing your application to react to	 * when a certain amount of data has loaded - complete files or partially.	 * </p>	 * Unlike the LoaderSequence the LoadObjective does not interfere with loaders, it is simply an indicator. Use	 * LoadObjective when you e.g. want your applicaiton to respond to when one or several file streams have reached a	 * a certain progress. 	 */	 	/*	 * TODO Thourough testing of LoadObjective class required!	 */	public class LoadObjective extends WeakEventDispatcher implements CoreInterface, Resetable	{		private var _loaderMap:Array;		private var _progressMap:Array;		private var _timer:Timer;		/**		 * LoadObjective Constructor		 */		public function LoadObjective()		{			super(this);						reset();		}		/**		 * Indicates the average progress of all the loaders referenced by a LoadObjective instance		 * with regard to each loaders progress goal.		 */		public function get progress():Number		{			var p:Number = 0;						var loader:CoreLoader;						var progressGoal:Number;							for(var i:int = 0;i < numLoaders; ++i)			{								loader = _loaderMap[i] as CoreLoader;								progressGoal = _progressMap[i] as Number;								p += Math.min(loader.progress / progressGoal, 1);			}						return p / numLoaders;		}		/**		 * Indicates the number of loaders referenced by a LoadObjective instance.		 */		public function get numLoaders():uint		{			return _loaderMap.length;		}		/**		 * Adds a loader reference to the LoadObjective instance.		 * 		 * @param loader Loader reference.		 * @param progressGoal The progress goal of the loader reference. A loader only needs to reach this progress to be concidered fully loaded by a LoadObjective instance.		 */		public function addLoader(loader:CoreLoader, progressGoal:Number = 1):CoreLoader		{			_timer.start();						_loaderMap.push(loader);						_progressMap.push(Math.min(progressGoal, 1));						return loader;		}		/**		 * Removes a loader reference from a LoadObjective instance.		 */		public function removeLoader(loader:CoreLoader):void		{			var index:uint = _loaderMap.indexOf(loader);						_loaderMap.splice(index, 1);						_progressMap.splice(index, 1);		}		/**		 * @inheritDoc		 */		override public function destruct(deepDestruct:Boolean = false):void		{			_timer.stop();						_timer.removeEventListener(TimerEvent.TIMER, update);						if(deepDestruct) Destructor.destructMultiple(_loaderMap);						_loaderMap = null;						_progressMap = null;						_timer = null;					super.destruct(deepDestruct);		}		/**		 * @inheritDoc		 */		public function reset():void		{			if(_loaderMap) destruct();						_timer = new Timer(50);						_timer.addEventListener(TimerEvent.TIMER, update);						_loaderMap = [];						_progressMap = [];		}		private function update(e:TimerEvent):void		{			if(progress >= 1)			{				var validGoal:Boolean = true;								/*				 * Only dispatch LoadObjectiveEvent.OBJECTIVE_MET if all loaders with a progress goal of 1				 * are acctually loaded.				 */				var loader:CoreLoader;								var progressGoal:Number;								for(var i:int = 0;i < _loaderMap.length; ++i)				{					loader = _loaderMap[i] as CoreLoader;										progressGoal = _progressMap[i] as Number;										if(progressGoal >= 1 && !loader.loaded) validGoal = false;										break;					}								if(validGoal) dispatchEvent(new LoadObjectiveEvent(LoadObjectiveEvent.OBJECTIVE_MET));								_timer.stop();			}			else			{				if(hasEventListener(LoadObjectiveEvent.PROGRESS)) dispatchEvent(new LoadObjectiveEvent(LoadObjectiveEvent.PROGRESS));			}		}	}}