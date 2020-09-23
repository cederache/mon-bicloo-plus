//
//  Date+Utils.swift
//  mon-bicloo-plus
//
//  Created by Cédric Derache on 22/09/2020.
//  Copyright © 2020 Cédric Derache. All rights reserved.
//

import Foundation

extension String {
    func toDate() -> Date? {
        let dateFormatter = DateFormatter.iso8601Full
        let fallbackDateFormatter = DateFormatter.iso8601FullMissingMillis
        return dateFormatter.date(from: self) ?? fallbackDateFormatter.date(from: self)
    }
}

extension Date {
    enum ReadableFormat {
        case DDMMYYYY
        case DDMMYYYYHHMMSS
        case EDMMM
        case EEEEDMMMM
        case EDMMMHHMM
        case Server
        case DDMMHHMMSS
    }

    func toReadableString(format: ReadableFormat) -> String {
        switch format {
        case .DDMMYYYY:
            return DateFormatter.humanReadableWithoutHoursMinutes.string(from: self)
        case .DDMMYYYYHHMMSS:
            return DateFormatter.humanReadable.string(from: self)
        case .EDMMM:
            return DateFormatter.humanReadableDayShortWithoutHoursMinutes.string(from: self)
        case .EEEEDMMMM:
            return DateFormatter.humanReadableDayWithoutHoursMinutes.string(from: self)
        case .EDMMMHHMM:
            return DateFormatter.humanReadableDayShort.string(from: self)
        case .Server:
            return DateFormatter.iso8601Full.string(from: self)
        case .DDMMHHMMSS:
            return DateFormatter.humanReadableDayMonthWithHoursMinutesSeconds.string(from: self)
        }
    }

    func toReadableString(withHourMinute: Bool = true) -> String {
        return toReadableString(format: withHourMinute ? .DDMMYYYYHHMMSS : .DDMMYYYY)
    }

    func toShortReadableString() -> String {
        return toReadableString(format: .EDMMMHHMM)
    }

    func toServerString() -> String {
        return toReadableString(format: .Server)
    }
}
