//
//  mon_bicloo_plusApp.swift
//  mon-bicloo-plus
//
//  Created by Cédric Derache on 17/09/2020.
//  Copyright © 2020 Cédric Derache. All rights reserved.
//

import SwiftUI

@main
struct mon_bicloo_plusApp: App {
    let userInformations: UserInformations = UserInformations.getFirst() as? UserInformations ?? UserInformations()
    
    var body: some Scene {
        WindowGroup {
            HomeView(userInformations: userInformations)
                .accentColor(Constants.accentColor)
                .onAppear {
                    LoggingConfiguration.configure()
                }
        }
    }
}
