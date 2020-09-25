//
//  CumulativeCircularProgress.swift
//  mon-bicloo-plus
//
//  Created by Cédric Derache on 25/09/2020.
//  Copyright © 2020 Cédric Derache. All rights reserved.
//

import SwiftUI

struct ProgressValue {
    var value: Int
    var color: Color
}

struct CumulativeCircularProgress<Content: View>: View {
    var values: [ProgressValue]
    var lineWidth = CGFloat(20.0)
    let content: Content?

    init(values: [ProgressValue], lineWidth: CGFloat = CGFloat(20.0), @ViewBuilder content: () -> Content?) {
        self.values = values
        self.lineWidth = lineWidth
        self.content = content()
    }
    
    var count: CGFloat {
        CGFloat(values.map({ $0.value }).reduce(0, +))
    }
    
    func prefixCount(toIndex: Int) -> Int {
        values.prefix(toIndex).map({ $0.value }).reduce(0, +)
    }
    
    func percentValue(_ value: Int) -> CGFloat {
        CGFloat(value) / self.count
    }
    
    var body: some View {
        ZStack {
            ForEach(0...(values.count - 1), id: \.self) { index in
                Circle()
                    .trim(from: index == 0 ? 0.0 : self.percentValue(self.prefixCount(toIndex: index)), to: self.percentValue(values[index].value) + self.percentValue(self.prefixCount(toIndex: index)))
                    .rotation(Angle(degrees: -90))
                    .stroke(style: StrokeStyle(lineWidth: self.lineWidth, lineCap: .round, lineJoin: .round))
                    .foregroundColor(values[index].color)
            }
            
            content?
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(5)
                .clipShape(Circle())
                .clipped()
        }
    }
}

struct CumulativeCircularProgress_Previews: PreviewProvider {
    static var previews: some View {
        CumulativeCircularProgress(values: [ProgressValue(value: 10, color: .green), ProgressValue(value: 20, color: .yellow), ProgressValue(value: 10, color: .blue)]) {
            Text("10")
        }
    }
}
