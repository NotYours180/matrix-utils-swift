//
//  Color+Helper.swift
//  MATRIX Utils
//
//  MIT License
//
//  Copyright (c) 2017 MATRIX Labs
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

import Foundation
#if os(iOS)
import UIKit

extension UIColor {

    public func rgb(red: inout Int, green: inout Int, blue: inout Int, alpha: inout Int) {
        var fRed: CGFloat = 0
        var fGreen: CGFloat = 0
        var fBlue: CGFloat = 0
        var fAlpha: CGFloat = 0
        if self.getRed(&fRed, green: &fGreen, blue: &fBlue, alpha: &fAlpha) {
            red = Int(fRed * 255.0)
            green = Int(fGreen * 255.0)
            blue = Int(fBlue * 255.0)
            alpha = Int(fAlpha * 255.0)
        } else {
            red = 0
            green = 0
            blue = 0
            alpha = 0
        }
    }

    public func lighter(by percentage: CGFloat) -> UIColor? {
        var red: Int = 0, green: Int = 0, blue: Int = 0, alpha: Int = 0
        self.rgb(red: &red, green: &green, blue: &blue, alpha: &alpha)
        let redLighter = ((CGFloat(255) - CGFloat(red)) * percentage) / 100
        let greenLighter = ((CGFloat(255) - CGFloat(green)) * percentage) / 100
        let blueLighter = ((CGFloat(255) - CGFloat(blue)) * percentage) / 100
        return UIColor(red: CGFloat(255 - redLighter)/255, green: CGFloat(255 - greenLighter)/255, blue: CGFloat(255 - blueLighter)/255, alpha: 1.0)
    }
}
#endif
