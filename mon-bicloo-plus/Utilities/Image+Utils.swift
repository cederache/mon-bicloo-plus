//
//  Image+Utils.swift
//  mon-bicloo-plus
//
//  Created by Cédric Derache on 17/09/2020.
//  Copyright © 2020 Cédric Derache. All rights reserved.
//

import SwiftUI

extension Image {
    init(systemName: String, iOS14SystemName: String) {
        if #available(iOS 14, *) {
            self.init(systemName: iOS14SystemName)
        } else {
            self.init(systemName: systemName)
        }
    }
}
