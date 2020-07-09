//
//  StationsGroupsView.swift
//  mon-bicloo-plus
//
//  Created by Cédric Derache on 08/07/2020.
//  Copyright © 2020 Cédric Derache. All rights reserved.
//

import SwiftUI

struct StationsGroupsView: View {
    @State var isEditMode: EditMode = .inactive
    @EnvironmentObject var stationsGroupsStore: StationsGroupsStore

    var canEdit: Bool
    var onStationsGroupSelected: ((StationsGroup) -> Void)?

    func stationsGroupBinding(stationsGroup: StationsGroup) -> Binding<StationsGroup> {
        $stationsGroupsStore.stationsGroups[stationsGroupsStore.stationsGroups.firstIndex(of: stationsGroup) ?? 0]
    }

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(stationsGroupsStore.stationsGroups) { stationsGroup in
                        Button(action: {
                            self.onStationsGroupSelected?(stationsGroup)
                        }) {
                            TextField("", text: self.stationsGroupBinding(stationsGroup: stationsGroup).name)
                                .disabled(!self.canEdit || self.isEditMode == .inactive)
                        }
                    }
                }
            }
            .navigationBarTitle("Groupes")
            .navigationBarItems(trailing: HStack {
                if self.canEdit {
                    HStack {
                        EditButton()

                        Button(action: {
                            let stationsGroup = StationsGroup(name: "Groupe")
                            stationsGroup.save()
                            self.stationsGroupsStore.fetch()
                        }) {
                            Image(systemName: "plus.circle")
                        }
                    }
                    .eraseToAnyView()
                } else {
                    EmptyView()
                        .eraseToAnyView()
                }
            })
            .environment(\.editMode, self.$isEditMode)
            .onAppear {
                self.stationsGroupsStore.fetch()
            }
        }
    }
}

struct StationsGroupView_Previews: PreviewProvider {
    static var previews: some View {
        StationsGroupsView(canEdit: true)
    }
}
