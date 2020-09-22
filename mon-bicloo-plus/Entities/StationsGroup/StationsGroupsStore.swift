//
//  StationsGroupsStore.swift
//  mon-bicloo-plus
//
//  Created by Cédric Derache on 05/07/2020.
//  Copyright © 2020 Cédric Derache. All rights reserved.
//

import Foundation

class StationsGroupsStore: ObservableObject {
    static let Instance = StationsGroupsStore()

    @Published var stationsGroups: [StationsGroup] = []

    private init() {}

    func fetch() {
        stationsGroups = StationsGroup.getAll(sortedBy: "_name") as? [StationsGroup] ?? []
    }
}
