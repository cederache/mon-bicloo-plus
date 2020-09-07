//
//  String+Utils.swift
//  mon-bicloo-plus
//
//  Created by Cédric Derache on 07/09/2020.
//  Copyright © 2020 Cédric Derache. All rights reserved.
//

import Foundation

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
