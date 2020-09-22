//
//  Array+Utils.swift
//  mon-bicloo-plus
//
//  Created by Cédric Derache on 17/09/2020.
//  Copyright © 2020 Cédric Derache. All rights reserved.
//

import Foundation

extension Array where Element : Equatable {
    var unique: [Element] {
        var uniqueValues: [Element] = []
        forEach { item in
            if !uniqueValues.contains(item) {
                uniqueValues += [item]
            }
        }
        return uniqueValues
    }
}
