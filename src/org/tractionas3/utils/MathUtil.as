/** * @version 1.0 * @author David Dahlstroem | daviddahlstroem.com *  *  * Copyright (c) 2009 David Dahlstroem | daviddahlstroem.com *  * Permission is hereby granted, free of charge, to any person obtaining a copy * of this software and associated documentation files (the "Software"), to deal * in the Software without restriction, including without limitation the rights * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell * copies of the Software, and to permit persons to whom the Software is * furnished to do so, subject to the following conditions: *  * The above copyright notice and this permission notice shall be included in * all copies or substantial portions of the Software. *  * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN * THE SOFTWARE. * */package org.tractionas3.utils {	import flash.geom.Point;	public class MathUtil 	{		public static function distance(v1:Point, v2:Point):Number		{			var dx:Number = v1.x - v2.x;						var dy:Number = v1.y - v2.y;						return Math.sqrt(dx * dx + dy * dy);		}		public static function angleTowards(v1:Point, v2:Point):Number		{			var dx:Number = v1.x - v2.x;						var dy:Number = v1.y - v2.y;						return Math.atan2(dx, dy);		}		public static function clamp(value:Number, low:Number, high:Number):Number		{			if(value < low) return low;						if(value > high) return high;						return value;		}		public static function round(value:Number, length:uint):Number		{			var l:uint = 1;						while(length--)			{				l *= 10;			}						return Math.round(value * l) / l;		}		public static function floor(value:Number, length:uint):Number		{			var l:uint = 1;						while(length--)			{				l *= 10;			}						return Math.floor(value * l) / l;		}		public static function ceil(value:Number, length:uint):Number		{			var m:uint = 1;						while(length--)			{				m *= 10;			}						return Math.round(value * m) / m;		}		public static function sum(...values:Array):Number		{			var i:uint = values.length;						var v:Number = 0;						while(i--)			{				v += values[i] as Number;			}						return v;		}		public static function average(...values:Array):Number		{			return sum.apply(null, values) / values.length;		}		public static function square(value:Number):Number		{			return value * value;		}	}}