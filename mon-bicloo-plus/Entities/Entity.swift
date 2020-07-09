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