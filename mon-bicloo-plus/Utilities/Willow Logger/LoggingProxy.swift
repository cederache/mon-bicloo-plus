//
//  LoggingProxy.swift
//  PursCreate
//
//  Created by Joshua Brunhuber on 21.07.18.
//  Copyright © 2018 Joshua Brunhuber. All rights reserved.
//

import Willow

var logger = LoggingProxy(logger: willowLogger)

// swiftformat:disable redundantSelf
struct LoggingProxy {
    var proxLogger: Logger?

    init(logger: Logger?) {
        self.proxLogger = logger
    }

    public func debug(_ message: String?, file: String = #file, function: String = #function, line: Int = #line) {
        proxLogger?.debugMessage(self.format(level: "Debug", message: message, file: file, function: function, line: line))
    }

    public func info(_ message: String?, file: String = #file, function: String = #function, line: Int = #line) {
        proxLogger?.infoMessage(self.format(level: "Info", message: message, file: file, function: function, line: line))
    }

    public func event(_ message: String?, file: String = #file, function: String = #function, line: Int = #line) {
        proxLogger?.eventMessage(self.format(level: "Event", message: message, file: file, function: function, line: line))
    }

    public func warn(_ message: String?, file: String = #file, function: String = #function, line: Int = #line) {
        proxLogger?.warnMessage(self.format(level: "Warn", message: message, file: file, function: function, line: line))
    }

    public func error(_ message: String?, file: String = #file, function: String = #function, line: Int = #line) {
        proxLogger?.errorMessage(self.format(level: "Error", message: message, file: file, function: function, line: line))
    }

    private func format(level: String, message: String?, file: String, function: String, line: Int) -> String {
        #if DEBUG /* I use os_log in production where line numbers and functions are discouraged */
            return "[\(level)] [\(sourceFileName(filePath: file)) \(function):\(line)] \(message ?? "")"
        #else
            return message ?? ""
        #endif
    }

    private func sourceFileName(filePath: String) -> String {
        let components = filePath.components(separatedBy: "/")
        return (components.isEmpty ? "" : components.last) ?? ""
    }
}
