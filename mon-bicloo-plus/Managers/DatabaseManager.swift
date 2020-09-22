//
//  DatabseManager.swift
//  mon-bicloo-plus
//
//  Created by Cédric Derache on 05/07/2020.
//  Copyright © 2020 Cédric Derache. All rights reserved.
//

import Foundation
import RealmSwift

class DatabaseManager {
    static let Instance = DatabaseManager()

    var debug: Bool = false
    private var _realm: Realm?
    var realmQueue = DispatchQueue(label: "RealmQueue")

    static func InitForDebug() {
        DatabaseManager.Instance.debug = true
    }

    var realm: Realm {
        if _realm == nil {
            initRealm()
        }
        return _realm!
    }

    private init() {
        initRealm()
    }

    private init(debug: Bool = false) {
        self.debug = debug
        initRealm()
    }

    private func initRealm() {
        do {
            if debug {
                Realm.Configuration.defaultConfiguration.inMemoryIdentifier = "Mon-Bicloo-Plus"
            } else {
                // Use customConfiguration to handle schema migration : https://stackoverflow.com/a/33363554
                let configuration = Realm.Configuration(
                    schemaVersion: 3,
                    migrationBlock: { migration, oldSchemaVersion in
                    }
                )
                Realm.Configuration.defaultConfiguration = configuration
            }

            _realm = try Realm()
        } catch {
            logger.error("Error while initializing realm \(error)")
            _realm = nil
        }
    }
}
