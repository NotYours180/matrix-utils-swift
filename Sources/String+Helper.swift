//
//  String+Helper.swift
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

extension String {

    /// Convert and return a dictionary for `self`.
    func getDictionary() -> [String:AnyObject]? {
        if let data = self.data(using: String.Encoding.utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String:AnyObject]
            } catch let error as NSError {
                print(error)
            }
        }
        return nil
    }

    /// Convert and return an array for `self`.
    func getArray() -> [AnyObject]? {
        if let data = self.data(using: String.Encoding.utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [AnyObject]
            } catch let error as NSError {
                print(error)
            }
        }
        return nil
    }

    /// Remove white spaces for `self`.
    func trim() -> String {
        return self.trimmingCharacters(in: NSCharacterSet.whitespaces)
    }

    /// Validate if is alphanumeric for `self`.
    var isAlphanumeric: Bool {
        return range(of: "^[a-zA-Z0-9]+$", options: .regularExpression) != nil
    }

    /// Get first character for each word for `self`
    func initials() -> String {
        let initialsArray = self.characters.split {$0 == " "}.map(String.init).flatMap({ $0.characters.first })
        return String(initialsArray).uppercased()
    }
}
