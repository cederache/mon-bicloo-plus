//
//  StationsGroupsView.swift
//  mon-bicloo-plus
//
//  Created by Cédric Derache on 08/07/2020.
//  Copyright © 2020 Cédric Derache. All rights reserved.
//

import SwiftUI

struct StationsGroupsView: View {
    @State var editMode: EditMode = .inactive
    @EnvironmentObject var stationsGroupsStore: StationsGroupsStore
    @State var canEdit: Bool

    var onStationsGroupSelected: ((StationsGroup) -> Void)?

    private func stationsGroupBinding(stationsGroup: StationsGroup) -> Binding<StationsGroup> {
        $stationsGroupsStore.stationsGroups[stationsGroupsStore.stationsGroups.firstIndex(of: stationsGroup) ?? 0]
    }

    private func onDelete(offsets: IndexSet) {
        offsets.forEach { index in
            let stationsGroupToRemove = stationsGroupsStore.stationsGroups[index]
            stationsGroupToRemove.delete()
        }
        updateStationsGroupsIndexes()
    }

    private func updateStationsGroupsIndexes() {
        for (index, stationsGroup) in stationsGroupsStore.stationsGroups.enumerated() {
            if let stationIndex = stationsGroupsStore.stationsGroups.firstIndex(of: stationsGroup) {
                stationsGroupsStore.stationsGroups[stationIndex].index = index
                stationsGroupsStore.stationsGroups[stationIndex].save()
            }
        }
        stationsGroupsStore.fetch()
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
                                .disabled(!self.canEdit || self.editMode == .active)
                        }
                    }
                    .onDelete(perform: onDelete)
                }
            }
            .navigationBarTitle("Groupes")
            .navigationBarItems(leading: HStack {
                if self.canEdit {
                    EditButton()
                        .eraseToAnyView()
                } else {
                    EmptyView()
                        .eraseToAnyView()
                }
            }, trailing: Button(action: {
                let stationsGroup = StationsGroup(name: "Groupe")
                stationsGroup.save()
                self.stationsGroupsStore.fetch()
            }) {
                Image(systemName: "plus.circle")
            })
            .environment(\.editMode, self.$editMode)
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
