//
//  Date+Helper.swift
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

extension Date {

    public func toString(format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }

    public func add(years: Int = 0, months: Int = 0, days: Int = 0) -> Date {
        let timeIntervalNow =  Calendar.current.dateComponents([.year, .month, .day], from: self)
        let dateNow = Calendar.current.date(from: timeIntervalNow)!
        var timeInterval = DateComponents()
        timeInterval.year = years
        timeInterval.month = months
        timeInterval.day = days
        let futureDate = Calendar.current.date(byAdding: timeInterval, to: dateNow)!
        return futureDate
    }

    public func remove(years: Int = 0, months: Int = 0, days: Int = 0) -> Date {
        var timeInterval =  Calendar.current.dateComponents([.year, .month, .day], from: self)
        timeInterval.year = timeInterval.year! - years
        timeInterval.month = timeInterval.month! - months
        timeInterval.day = timeInterval.day! - days
        timeInterval.hour = 0
        timeInterval.minute = 0
        timeInterval.second = 0
        let futureDate = Calendar.current.date(from: timeInterval)!
        return futureDate
    }

    public func yearsFrom(_ date: Date) -> Int {
        return (Calendar.current as NSCalendar).components(.year, from: date, to: self, options: []).year!
    }
    public func monthsFrom(_ date: Date) -> Int {
        return (Calendar.current as NSCalendar).components(.month, from: date, to: self, options: []).month!
    }
    public func weeksFrom(_ date: Date) -> Int {
        return (Calendar.current as NSCalendar).components(.weekOfYear, from: date, to: self, options: []).weekOfYear!
    }
    public func daysFrom(_ date: Date) -> Int {
        return (Calendar.current as NSCalendar).components(.day, from: date, to: self, options: []).day!
    }
    public func hoursFrom(_ date: Date) -> Int {
        return (Calendar.current as NSCalendar).components(.hour, from: date, to: self, options: []).hour!
    }
    public func minutesFrom(_ date: Date) -> Int {
        return (Calendar.current as NSCalendar).components(.minute, from: date, to: self, options: []).minute!
    }
    public func secondsFrom(_ date: Date) -> Int {
        return (Calendar.current as NSCalendar).components(.second, from: date, to: self, options: []).second!
    }
    public func offsetFrom(_ date: Date) -> (Int, String) {
        if date < Date() {
            if yearsFrom(date)   > 0 { return (yearsFrom(date), yearsFrom(date) == 1 ? "year":"years")   }
            if monthsFrom(date)  > 0 { return (monthsFrom(date), monthsFrom(date) == 1 ? "month" : "months")   }
            if weeksFrom(date)   > 0 { return (weeksFrom(date), weeksFrom(date) == 1 ? "week" : "weeks")   }
            if daysFrom(date)    > 0 { return (daysFrom(date), daysFrom(date) == 1 ? "day" : "days")   }
            if hoursFrom(date)   > 0 { return (hoursFrom(date), hoursFrom(date) == 1 ? "hour" : "hours")   }
            if minutesFrom(date) > 0 { return (minutesFrom(date), minutesFrom(date) == 1 ? "minute" : "minutes")   }
            if secondsFrom(date) > 0 { return (secondsFrom(date), secondsFrom(date) == 1 ? "second" : "seconds")   }
            return (0, "")
        } else {
            return (0, "")
        }
    }
}
