/**
 * @version 1.0
 * @author David Dahlstroem | daviddahlstroem.com
 * 
 * 
 * Copyright (c) 2009 David Dahlstroem | daviddahlstroem.com
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 *
 */

package org.tractionas3.graphics 
{	import org.tractionas3.core.CoreObject;
	import org.tractionas3.core.interfaces.CoreInterface;
	
	/**
	 * GradientColor represents a single color used in a gradient.
	 */
	
	public class GradientColor extends CoreObject implements CoreInterface 
	{
		/**
		 * Specifies the color of the gradient color.
		 */
		
		public var color:uint;
		
		/**
		 * Specifies the alpha of the gradient color.
		 */
		
		public var alpha:Number;
		
		/**
		 * Specifies the ratio of the gradient color.
		 */
		
		public var ratio:Number;
		
		/**
		 * Creates a new GradientColor object.
		 * 
		 * @param gradientColor Color of the gradient.
		 * @param gradientAlpha Alpha of the gradient.
		 * @param gradientRatio Ratio of the gradient.
		 */
		
		public function GradientColor(gradientColor:uint, gradientAlpha:Number, gradientRatio:Number)
		{
			color = gradientColor;
			
			alpha = gradientAlpha;
			
			ratio = gradientRatio;
		}
	}}