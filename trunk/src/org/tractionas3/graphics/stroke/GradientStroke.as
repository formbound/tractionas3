/** * @version 1.0 * @author David Dahlstroem | daviddahlstroem.com *  *  * Copyright (c) 2009 David Dahlstroem | daviddahlstroem.com *  * Permission is hereby granted, free of charge, to any person obtaining a copy * of this software and associated documentation files (the "Software"), to deal * in the Software without restriction, including without limitation the rights * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell * copies of the Software, and to permit persons to whom the Software is * furnished to do so, subject to the following conditions: *  * The above copyright notice and this permission notice shall be included in * all copies or substantial portions of the Software. *  * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN * THE SOFTWARE. * */package org.tractionas3.graphics.stroke{	import org.tractionas3.core.interfaces.CoreInterface;	import org.tractionas3.data.convertion.degreesToRadians;	import org.tractionas3.geom.Dimension;	import org.tractionas3.graphics.Gradient;	import flash.display.Graphics;	import flash.geom.Matrix;	/**	 * GradientStroke applies a gradient stroke to a Graphics object.	 */		public class GradientStroke extends Gradient implements CoreInterface, Stroke	{			/**		 * Specifies the type of the gradient stroke.		 */				public var type:String;				/**		 * Specifies the gradient angle of the gradient stroke.		 */				public var angle:int;				/**		 * Specifies the focal point ratio of the gradient stroke.		 */				public var focalPointRatio:Number;				/**		 * Specifies the spread method of the gradient stroke.		 */				public var spreadMethod:String;				/**		 * Specifies the interpolation metod of the gradient stroke.		 */				public var interPolationMethod:String;				/**		 * Specifies whether pixel hinting is to be applied to the gradient stroke.		 */				public var pixelHinting:Boolean;				/**		 * Specifies the scale mode of the gradient stroke.		 */				public var scaleMode:String;				/**		 * Specifies the caps style of the gradient stroke.		 */				public var caps:String;				/**		 * Specifies the joints style of the gradient stroke.		 */				public var joints:String;				/**		 * Specifies the meter limit of the gradient stroke.		 */				public var miterLimit:Number;		private var _matrix:Matrix;		private var _weight:Number;				/**		 * Creates a new GradientStroke object,		 * 		 * @param lineWeight The weight of the stroke.		 * @param gradientType The gradient type of the stroke.		 */				public function GradientStroke(lineWeight:Number, gradientType:String = "linear")		{			weight = lineWeight;						type = gradientType;						focalPointRatio = 0;						angle = 0;						spreadMethod = "pad";						interPolationMethod = "rgb";		}				/**		 * @inheritDoc		 */				public function get weight():Number		{			return _weight;		}		public function set weight(value:Number):void		{			_weight = value;		}				/**		 * @inheritDoc		 */				public function apply(graphics:Graphics, gradientDimension:Dimension = null):void		{			_matrix = new Matrix();						_matrix.createGradientBox(gradientDimension.width, gradientDimension.height, degreesToRadians(angle));						graphics.lineStyle(weight, 0, 1, pixelHinting, scaleMode, caps, joints, miterLimit);						graphics.lineGradientStyle(type, colors, alphas, ratios, _matrix, spreadMethod, interPolationMethod, focalPointRatio);		}	}}