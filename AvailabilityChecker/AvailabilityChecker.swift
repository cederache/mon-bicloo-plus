//
//  AvailabilityChecker.swift
//  AvailabilityChecker
//
//  Created by Cédric Derache on 22/09/2020.
//  Copyright © 2020 Cédric Derache. All rights reserved.
//

import Combine
import SwiftUI
import WidgetKit

public class DataFetcher: ObservableObject {
    var cancellable: Set<AnyCancellable> = Set()
    static let Instance = DataFetcher()

    func getStations(completion: @escaping ([StationStruct]) -> Void) {
        let urlComponents = URLComponents(string: Constants.stationDataSetURL)!

        URLSession.shared.dataTaskPublisher(for: urlComponents.url!)
            .map { $0.data }
            .catch({ (error) -> Just<Data> in
                return Just("{\"records\": []}".data(using: .utf8) ?? Data())
            })
            .decode(type: StationsRecords.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }) { response in
                completion(response.records.map({ $0.fields }))
            }
            .store(in: &cancellable)
    }
}

struct Provider: TimelineProvider {
    var snapshotEntry = SimpleEntry(date: Date(), stations: [StationStruct(id: 1, name: "École d'Architecture", capacity: 25, nbDocksAvailable: 10, nbBikesAvailable: 13), StationStruct(id: 2, name: "Gare De Pont Rousseau", capacity: 15, nbDocksAvailable: 10, nbBikesAvailable: 5), StationStruct(id: 3, name: "Gare Maritime", capacity: 30, nbDocksAvailable: 20, nbBikesAvailable: 13)])

    func placeholder(in context: Context) -> SimpleEntry {
        return snapshotEntry
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> Void) {
        completion(snapshotEntry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> Void) {
        DataFetcher.Instance.getStations { stations in
            let filteredStations = stations.filter({ $0.id == 77 || $0.id == 98 || $0.id == 102 || $0.id == 42 })
            
            let date = Date()
            
            // Need to add a second TimeLineEntry to trigger the refresh, may be fixed in futur iOS version
            let timeLine = Timeline(entries: [SimpleEntry(date: date, stations: filteredStations), SimpleEntry(date: Calendar.current.date(byAdding: .second, value: 20, to: date)!, stations: filteredStations)], policy: .atEnd)
            completion(timeLine)
        }
    }
}

struct SimpleEntry: TimelineEntry {
    var date = Date()
    let stations: [StationStruct]
}

struct AvailabilityCheckerEntryView: View {
    @Environment(\.widgetFamily) private var widgetFamily
    var entry: SimpleEntry
    
    var maxDisplayableStations: Int {
        widgetFamily == .systemSmall ? 3 : (widgetFamily == .systemMedium ? 6 : 12)
    }
    
    var displayableStations: [StationStruct] {
        Array(entry.stations.prefix(maxDisplayableStations))
    }
    
    var nbRows: Int {
        maxDisplayableStations / nbColumns + (maxDisplayableStations % nbColumns == 0 ? 0 : 1)
    }
    
    var nbColumns: Int {
        widgetFamily == .systemSmall ? 1 : 2
    }
    
    func stationAtRowCol(row: Int, col: Int) -> StationStruct? {
        if displayableStations.count > row * nbColumns + col {
            return displayableStations[row * nbColumns + col]
        }
        return nil
    }

    var body: some View {
        VStack(alignment: .center) {
            if displayableStations.count == 0 {
                Spacer()
                Text("Problème de récupération des données")
                    .italic()
                    .foregroundColor(.red)
                    .multilineTextAlignment(.center)
            } else {
                ForEach(0...(nbRows-1), id: \.self) { row in
                    HStack(spacing: 10) {
                        ForEach(0...(nbColumns-1), id: \.self) { col in
                            VStack(alignment: .center) {
                                if self.displayableStations.count > row * self.nbColumns + col {
                                    VStack(alignment: .center) {
                                        StationStatusView(station: self.stationAtRowCol(row: row, col: col) ?? StationStruct())
                                        Text(self.stationAtRowCol(row: row, col: col)?.displayName ?? "")
                                            .font(.footnote)
                                    }
                                } else {
                                    EmptyView()
                                }
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                        }
                    }
                }
            }
            Spacer()
            Text("Il y a \(entry.date, style: .relative)")
                .font(.footnote)
                .multilineTextAlignment(.center)
        }
        .padding([.leading, .trailing, .top, .bottom], 5)
    }
}

@main
struct AvailabilityChecker: Widget {
    let kind: String = "AvailabilityChecker"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            AvailabilityCheckerEntryView(entry: entry)
        }
        .configurationDisplayName("Mon Bicloo Plus")
        .description("Affichage rapide de l'occupation des stations")
    }
}

struct AvailabilityChecker_Previews: PreviewProvider {
    static var previews: some View {
        AvailabilityCheckerEntryView(entry: SimpleEntry(date: Date(), stations: []))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
