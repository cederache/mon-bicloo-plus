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
    var snapshotEntry = SimpleEntry(date: Date(), stations: [StationStruct(id: 1, name: "École d'Architecture", capacity: 25, nbDocksAvailable: 10, nbBikesAvailable: 13)])

    func placeholder(in context: Context) -> SimpleEntry {
        return snapshotEntry
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> Void) {
        completion(snapshotEntry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> Void) {
        DataFetcher.Instance.getStations { stations in
            let filteredStations = stations.filter({ $0.id == 77 || $0.id == 98 })
            
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
    var entry: SimpleEntry

    var body: some View {
        VStack(alignment: .center) {
            if entry.stations.count == 0 {
                Spacer()
                Text("Problème de récupération des données")
                    .italic()
                    .foregroundColor(.red)
                    .multilineTextAlignment(.center)
            } else {
                ForEach(entry.stations) { (station: StationStruct) in
                    VStack(alignment: .center) {
                        StationStatusView(station: station)
                        Text(station.displayName)
                            .font(.footnote)
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
