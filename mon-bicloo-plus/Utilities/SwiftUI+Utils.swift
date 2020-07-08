//
//  SwiftUI+Utils.swift
//  mon-bicloo-plus
//
//  Created by Cédric Derache on 09/07/2020.
//  Copyright © 2020 Cédric Derache. All rights reserved.
//

import Foundation
import SwiftUI

extension View {
    func eraseToAnyView() -> AnyView {
        return AnyView(self)
    }
}
