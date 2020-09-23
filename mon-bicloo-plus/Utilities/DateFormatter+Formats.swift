//
//  DateFormatter+Formats.swift
//  mon-bicloo-plus
//
//  Created by Cédric Derache on 22/09/2020.
//  Copyright © 2020 Cédric Derache. All rights reserved.
//

import Foundation

extension DateFormatter {
    static let iso8601Full: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter
    }()
    
    static let iso8601FullMissingMillis: DateFormatter = {
       let formatter = DateFormatter()
       formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
       formatter.calendar = Calendar(identifier: .iso8601)
       formatter.timeZone = TimeZone(secondsFromGMT: 0)
       formatter.locale = Locale(identifier: "en_US_POSIX")
       return formatter
   }()
    
    static let humanReadable: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy HH:mm:ss"
        return formatter
    }()
    
    static let humanReadableWithoutHoursMinutes: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter
    }()
    
    static let humanReadableDayShort: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "E d MMM HH:mm"
        return formatter
    }()
    
    static let humanReadableDayShortWithoutHoursMinutes: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "E d MMM"
        return formatter
    }()
    
    static let humanReadableDayWithoutHoursMinutes: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE d MMMM"
        return formatter
    }()
    
    static let humanReadableDayMonthWithHoursMinutesSeconds: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM HH:mm:ss"
        return formatter
    }()
}
