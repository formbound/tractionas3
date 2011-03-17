/** * @version 1.0 * @author David A *  *  * Copyright (c) 2009 David A *  * Permission is hereby granted, free of charge, to any person obtaining a copy * of this software and associated documentation files (the "Software"), to deal * in the Software without restriction, including without limitation the rights * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell * copies of the Software, and to permit persons to whom the Software is * furnished to do so, subject to the following conditions: *  * The above copyright notice and this permission notice shall be included in * all copies or substantial portions of the Software. *  * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN * THE SOFTWARE. * */package org.tractionas3.profiler {	import org.tractionas3.core.Application;	import org.tractionas3.data.convertion.BitConverter;	import org.tractionas3.display.DraggableSprite;	import org.tractionas3.managers.ContextMenuManager;	import org.tractionas3.utils.MathUtil;	import flash.display.Graphics;	import flash.display.Stage;	import flash.events.ContextMenuEvent;	import flash.events.Event;	import flash.events.TimerEvent;	import flash.geom.Rectangle;	import flash.text.TextField;	import flash.text.TextFieldAutoSize;	import flash.text.TextFormat;	import flash.ui.ContextMenuItem;	import flash.utils.clearInterval;	import flash.utils.setInterval;	public class SimpleVisualProfiler extends DraggableSprite 	{		private static var _instance:SimpleVisualProfiler;		private var _stage:Stage;		private var fpsCurrentLabel:TextField;		private var fpsAverageLabel:TextField;		private var bandwidthTotalLabel:TextField;		private var bandwidthPerSecondLabel:TextField;		private var fpsProfiler:FPSProfiler;		private var memoryLabel:TextField;		private var memoryProfiler:MemoryProfiler;		private var contextMenuManager:ContextMenuManager;		private var contextMenuItem:ContextMenuItem;				private var _intervalId:uint;		public function SimpleVisualProfiler(singletonEnforcer:SingletonEnforcer)		{			super();						if(!singletonEnforcer)			{				throw new ArgumentError("SimpleVisualProfiler is a singleton class and may only be accessed via its accessor method getInstance().");				return;			}						fpsProfiler = new FPSProfiler(4);						memoryProfiler = new MemoryProfiler();						contextMenuManager = ContextMenuManager.getInstance();						contextMenuItem = contextMenuManager.addMenuItem(new ContextMenuItem("Show TractionAS3 Profiler"));						contextMenuItem.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT, onContextMenuItemSelect);						setLabels();						mouseChildren = false;						visible = false;		}		public static function getInstance():SimpleVisualProfiler 		{			if(_instance == null) _instance = new SimpleVisualProfiler(new SingletonEnforcer());			return _instance;		}		public static function initialize(stage:Stage):SimpleVisualProfiler		{			getInstance()._stage = stage;						return getInstance();		}		override protected function onAddedToStage():void		{			drawBackground();						updateDragBounds();						stage.addEventListener(Event.RESIZE, updateDragBounds);						fpsProfiler.start();						clearInterval(_intervalId);						_intervalId = setInterval(update, 50);		}		override protected function onRemovedFromStage():void		{			stage.removeEventListener(Event.RESIZE, updateDragBounds);						fpsProfiler.stop();						clearInterval(_intervalId);		}		private function drawBackground():void		{			var			gfx:Graphics = this.graphics;			gfx.clear();			gfx.beginFill(0x000000, 0.8);			gfx.drawRoundRect(0, 0, 100, 65, 10, 10);			gfx.endFill();		}		private function updateDragBounds(e:Event = null):void		{			dragAndDropBehavior.setMotionLimits(new Rectangle(0, 0, stage.stageWidth - width, stage.stageHeight - height), Application.stage);		}		private function setLabels():void		{			var			textFormat:TextFormat = new TextFormat();			textFormat.color = 0xFFFFFF;			textFormat.font = "Arial";			textFormat.size = 9;			textFormat.bold = true;						fpsCurrentLabel = new TextField();			fpsCurrentLabel.defaultTextFormat = textFormat;			fpsCurrentLabel.autoSize = TextFieldAutoSize.LEFT;						fpsCurrentLabel.y = 5;			fpsCurrentLabel.x = 5;						this.addChild(fpsCurrentLabel);						fpsAverageLabel = new TextField();			fpsAverageLabel.defaultTextFormat = textFormat;			fpsAverageLabel.autoSize = TextFieldAutoSize.LEFT;						fpsAverageLabel.x = 5;			fpsAverageLabel.y = 16;						this.addChild(fpsAverageLabel);							memoryLabel = new TextField();			memoryLabel.defaultTextFormat = textFormat;			memoryLabel.autoSize = TextFieldAutoSize.LEFT;						memoryLabel.x = 5;			memoryLabel.y = 27;						this.addChild(memoryLabel);						bandwidthTotalLabel = new TextField();			bandwidthTotalLabel.defaultTextFormat = textFormat;			bandwidthTotalLabel.autoSize = TextFieldAutoSize.LEFT;						bandwidthTotalLabel.x = 5;			bandwidthTotalLabel.y = 38;						this.addChild(bandwidthTotalLabel);						bandwidthPerSecondLabel = new TextField();			bandwidthPerSecondLabel.defaultTextFormat = textFormat;			bandwidthPerSecondLabel.autoSize = TextFieldAutoSize.LEFT;						bandwidthPerSecondLabel.x = 5;			bandwidthPerSecondLabel.y = 49;						this.addChild(bandwidthPerSecondLabel);		}		private function update(e:TimerEvent):void		{			fpsCurrentLabel.text = "FPS Current: " + fpsProfiler.currentFPS;						fpsAverageLabel.text = "FPS Average: " + fpsProfiler.averageFPS;						memoryLabel.text = "Memory: " + MathUtil.round(BitConverter.bytesToMegabytes(memoryProfiler.currentMemory), 2) + " mB";						bandwidthTotalLabel.text = "Loaded total: " + MathUtil.round(BitConverter.bytesToMegabytes(BandwidthProfiler.getInstance().totalBytesLoaded), 2) + " mB";						var bytesPerSecond:Number = BandwidthProfiler.getInstance().bytesPerSecond;						var bytesPerSecondOutput:String;						if(bytesPerSecond > 1024)			{				bytesPerSecond = BitConverter.bytesToMegabytes(bytesPerSecond);				bytesPerSecondOutput = " mB/s";			}			else			{				bytesPerSecond = BitConverter.bytesToKilobytes(bytesPerSecond);				bytesPerSecondOutput = " kB/s";			}						bytesPerSecond = MathUtil.floor(bytesPerSecond, 2);						bandwidthPerSecondLabel.text = "Load /s: " + bytesPerSecond + bytesPerSecondOutput;		}		private function onContextMenuItemSelect(e:ContextMenuEvent):void		{			if(visible)			{				contextMenuItem.caption = "Show TractionAS3 Profiler";								visible = false;								_stage.removeChild(getInstance()) as SimpleVisualProfiler;			}			else			{				contextMenuItem.caption = "Hide TractionAS3 Profiler";								visible = true;								_stage.addChild(getInstance()) as SimpleVisualProfiler;			}		}	}}internal class SingletonEnforcer {}