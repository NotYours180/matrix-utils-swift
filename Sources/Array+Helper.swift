//
//  Array+Helper.swift
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

extension Sequence where Iterator.Element: Hashable {
    public func unique() -> [Iterator.Element] {
        var seen: [Iterator.Element: Bool] = [:]
        return self.filter { seen.updateValue(true, forKey: $0) == nil }
    }
}

extension Array where Element: Integer {
    /// Returns the sum of all elements in the array
    public var total: Element {
        return reduce(0, +)
    }
}
extension Collection where Iterator.Element == Int, Index == Int {
    /// Returns the average of all elements in the array
    public var average: Double {
        return isEmpty ? 0 : Double(reduce(0, +)) / Double(endIndex-startIndex)
    }
}

extension Array where Element: FloatingPoint {
    /// Returns the sum of all elements in the array
    public var total: Element {
        return reduce(0, +)
    }
    /// Returns the average of all elements in the array
    public var average: Element {
        return isEmpty ? 0 : total / Element(count)
    }
}

extension Collection where Indices.Iterator.Element == Index {

    /// Returns the element at the specified index iff it is within bounds, otherwise nil.
    public subscript (safe index: Index) -> Generator.Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

extension Array {

    public func groupBy<G: Hashable>(groupClosure: (Element) -> G) -> [[Element]] {
        var groups = [[Element]]()

        for element in self {
            let key = groupClosure(element)
            var active = Int()
            var isNewGroup = true
            var array = [Element]()

            for (index, group) in groups.enumerated() {
                let firstKey = groupClosure(group[0])
                if firstKey == key {
                    array = group
                    active = index
                    isNewGroup = false
                    break
                }
            }

            array.append(element)

            if isNewGroup {
                groups.append(array)
            } else {
                groups.remove(at: active)
                groups.insert(array, at: active)
            }
        }

        return groups
    }

    public func groupBy<K, V>(keyFunc: @escaping (V) -> K?) -> ([AnyObject]) -> [K: [V]] {
        var grouped = [K: [V]]()
        func group(collection: [AnyObject]) -> [K: [V]] {
            for c in collection {
                if let o = c as? V {
                    if let k = keyFunc(o) {
                        if var group = grouped[k] {
                            group.append(o)
                            grouped[k] = group
                        } else {
                            grouped[k] = [o]
                        }
                    }
                }
            }
            return grouped
        }
        return group
    }

}
