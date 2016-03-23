//: Playground - noun: a place where people can play

import UIKit

let gregorian = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)

let now = NSDate()

var date = "2015-06-26 8:15:10"
var formatter = NSDateFormatter()
formatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
var dateResult = formatter.dateFromString(date)

let component = gregorian!.components(NSCalendarUnit.Month, fromDate: dateResult!, toDate: now, options: NSCalendarOptions(rawValue: 0))

let age = component.month
