//
//  Entity.swift
//  mon-bicloo-plus
//
//  Created by Cédric Derache on 05/07/2020.
//  Copyright © 2020 Cédric Derache. All rights reserved.
//

import Foundation
import RealmSwift

@objc protocol EntitySafe {
    @objc dynamic var _id: String { get set }
    
    var id: String { get }
    var isInvalidated: Bool { get }
}

extension EntitySafe {
    static func randomString(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0 ..< length).map { _ in letters.randomElement()! })
    }
    
    static func newId() -> String {
        return randomString(length: 42)
    }
}

extension Object {
    static func getFirst(sortedBy sortKeyPath: String? = nil) -> Object? {
        var res = DatabaseManager.Instance.realm.objects(Self.self)
        
        if sortKeyPath != nil {
            res = res.sorted(byKeyPath: sortKeyPath!)
        }
        
        return res.first
    }
    
    static func getById(id: String) -> Object? {
        DatabaseManager.Instance.realm.object(ofType: Self.self, forPrimaryKey: id)
    }
    
    static func getAll(filterIn fieldName: String, values: [String]) -> [Object] {
        DatabaseManager.Instance.realm.objects(Self.self)
            .filterIn(fieldName: fieldName, values: values)
            .toArray(ofType: Self.self)
    }
    
    static func getAll(filterIn fieldName: String, values: [Int]) -> [Object] {
        DatabaseManager.Instance.realm.objects(Self.self)
            .filterIn(fieldName: fieldName, values: values)
            .toArray(ofType: Self.self)
    }
    
    static func getAll(sortedBy sortKeyPath: String? = nil) -> [Object] {
        var res = DatabaseManager.Instance.realm.objects(Self.self)
        
        if sortKeyPath != nil {
            res = res.sorted(byKeyPath: sortKeyPath!)
        }
        
        return res.toArray(ofType: Self.self)
    }
}
