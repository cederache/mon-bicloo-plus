//
//  HomeView.swift
//  mon-bicloo-plus
//
//  Created by Cédric Derache on 07/09/2020.
//  Copyright © 2020 Cédric Derache. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @State var userInformations: UserInformations

    var body: some View {
        Group {
            if !userInformations.introductionShown {
                IntroductionView(onIntroductionShown: {
                    self.userInformations.introductionShown = true
                    self.userInformations.save()
                    
                    // Update state var to update display
                    self.userInformations = DatabaseManager.Instance.realm.objects(UserInformations.self).first ?? self.userInformations
                })
            } else {
                FavoritesStationsView()
                    .environmentObject(StationsStore.Instance)
                    .environmentObject(StationsGroupsStore.Instance)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(userInformations: UserInformations())
    }
}
