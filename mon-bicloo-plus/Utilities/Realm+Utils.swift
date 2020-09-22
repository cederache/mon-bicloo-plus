//
//  Realm+Utils.swift
//  mon-bicloo-plus
//
//  Created by Cédric Derache on 05/07/2020.
//  Copyright © 2020 Cédric Derache. All rights reserved.
//

import Combine
import RealmSwift
import SwiftUI

extension Object {
    @objc func modifyIfNeeded(_ block: () -> Void) {
        if DatabaseManager.Instance.realm.isInWriteTransaction {
            block()
        } else {
            modify(block)
        }
    }

    @objc func modify(_ block: () -> Void) {
        do {
            try DatabaseManager.Instance.realm.write(block)
        } catch {
            logger.error("An error occured while modifying this object \(error)")
        }
    }

    @objc func save() {
        do {
            try DatabaseManager.Instance.realm.write {
                DatabaseManager.Instance.realm.add(self, update: .modified)
            }
        } catch {
            logger.error("An error occured while creating/updating this object \(error)")
        }
    }

    @objc func saveInWrite() {
        DatabaseManager.Instance.realm.add(self, update: .modified)
    }

    @objc func delete() {
        do {
            try DatabaseManager.Instance.realm.write {
                DatabaseManager.Instance.realm.delete(self)
            }
        } catch {
            logger.error("An error occured while deleting this object \(error)")
        }
    }

    @objc func deleteInWrite() {
        DatabaseManager.Instance.realm.delete(self)
    }
}

extension Results {
    func toArray<T>(ofType: T.Type) -> [T] {
        var array = [T]()
        for i in 0 ..< count {
            if let result = self[i] as? T {
                array.append(result)
            }
        }

        return array
    }

    func filterIn(fieldName: String, values: [String]) -> Results<Element> {
        if values.count == 0 {
            return filter(NSPredicate(value: false))
        }
        return filter(values.map({ (value) -> String in
            String(format: "\(fieldName) == '%@'", value)
        }).joined(separator: " OR "))
    }
    
    func filterIn(fieldName: String, values: [Int]) -> Results<Element> {
        if values.count == 0 {
            return filter(NSPredicate(value: false))
        }
        return filter(values.map({ (value) -> String in
            String(format: "\(fieldName) == %i", value)
        }).joined(separator: " OR "))
    }
}

extension RealmSwift.List {
    func toArray<T>(ofType: T.Type) -> [T] {
        var array = [T]()
        for i in 0 ..< count {
            if let result = self[i] as? T {
                array.append(result)
            }
        }

        return array
    }
}

func assertTypeIsEncodable<T>(_ type: T.Type, in wrappingType: Any.Type) {
    guard T.self is Encodable.Type else {
        if T.self == Encodable.self || T.self == Codable.self {
            preconditionFailure("\(wrappingType) does not conform to Encodable because Encodable does not conform to itself. You must use a concrete type to encode or decode.")
        } else {
            preconditionFailure("\(wrappingType) does not conform to Encodable because \(T.self) does not conform to Encodable.")
        }
    }
}

func assertTypeIsDecodable<T>(_ type: T.Type, in wrappingType: Any.Type) {
    guard T.self is Decodable.Type else {
        if T.self == Decodable.self || T.self == Codable.self {
            preconditionFailure("\(wrappingType) does not conform to Decodable because Decodable does not conform to itself. You must use a concrete type to encode or decode.")
        } else {
            preconditionFailure("\(wrappingType) does not conform to Decodable because \(T.self) does not conform to Decodable.")
        }
    }
}

extension RealmOptional where Value: Encodable {
    public func encode(to encoder: Encoder) throws {
        assertTypeIsEncodable(Value.self, in: type(of: self))

        var container = encoder.singleValueContainer()
        if let v = self.value {
            try (v as Encodable).encode(to: encoder) // swiftlint:disable:this force_cast
        } else {
            try container.encodeNil()
        }
    }
}

extension RealmOptional where Value: Decodable {
    public convenience init(from decoder: Decoder) throws {
        // Initialize self here so we can get type(of: self).
        self.init()
        assertTypeIsDecodable(Value.self, in: type(of: self))

        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            let metaType = (Value.self as Decodable.Type) // swiftlint:disable:this force_cast
            let element = try metaType.init(from: decoder)
            value = (element as! Value) // swiftlint:disable:this force_cast
        }
    }
}

class OptionalInt: Object, Codable {
    private var numeric = RealmOptional<Int>()

    public required convenience init(from decoder: Decoder) throws {
        self.init()

        let singleValueContainer = try decoder.singleValueContainer()
        if singleValueContainer.decodeNil() == false {
            let value = try singleValueContainer.decode(Int.self)
            numeric = RealmOptional<Int>(value)
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        if let v = self.numeric.value {
            try (v as Encodable).encode(to: encoder) // swiftlint:disable:this force_cast
        } else {
            try container.encodeNil()
        }
    }

    var value: Int? {
        return numeric.value
    }

    var zeroOrValue: Int {
        return numeric.value ?? 0
    }

    func setValue(_ value: Int?) {
        numeric.value = value
    }
}

class OptionalBool: Object, Codable {
    private var numeric = RealmOptional<Bool>()

    public required convenience init(from decoder: Decoder) throws {
        self.init()

        let singleValueContainer = try decoder.singleValueContainer()
        if singleValueContainer.decodeNil() == false {
            let value = try singleValueContainer.decode(Bool.self)
            numeric = RealmOptional<Bool>(value)
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        if let v = self.numeric.value {
            try (v as Encodable).encode(to: encoder) // swiftlint:disable:this force_cast
        } else {
            try container.encodeNil()
        }
    }

    var value: Bool? {
        return numeric.value
    }

    var falseOrValue: Bool {
        return numeric.value ?? false
    }

    func setValue(_ value: Bool?) {
        numeric.value = value
    }
}

class OptionalDouble: Object, Codable {
    private var numeric = RealmOptional<Double>()

    public required convenience init(from decoder: Decoder) throws {
        self.init()

        let singleValueContainer = try decoder.singleValueContainer()
        if singleValueContainer.decodeNil() == false {
            let value = try singleValueContainer.decode(Double.self)
            numeric = RealmOptional<Double>(value)
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        if let v = self.numeric.value {
            try (v as Encodable).encode(to: encoder) // swiftlint:disable:this force_cast
        } else {
            try container.encodeNil()
        }
    }

    var value: Double? {
        return numeric.value
    }

    var zeroOrValue: Double {
        return numeric.value ?? 0
    }

    func setValue(_ value: Double?) {
        numeric.value = value
    }
}
