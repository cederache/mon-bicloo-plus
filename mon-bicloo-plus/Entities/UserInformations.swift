//
//  UserInformations.swift
//  mon-bicloo-plus
//
//  Created by Cédric Derache on 07/09/2020.
//  Copyright © 2020 Cédric Derache. All rights reserved.
//

import Foundation
import RealmSwift

class UserInformations: Object {
    @objc internal dynamic var id: String = "UserInformations"
    @objc internal dynamic var _introductionShown: Bool = false
    
    override class func primaryKey() -> String? {
        "id"
    }
    
    var introductionShown: Bool {
        get {
            self.isInvalidated ? false : _introductionShown
        }
        set {
            if !self.isInvalidated {
                self.modifyIfNeeded {
                    _introductionShown = newValue
                }
            }
        }
    }
}
