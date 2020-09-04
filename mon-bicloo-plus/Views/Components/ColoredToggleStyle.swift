//
//  ColoredToggleStyle.swift
//  mon-bicloo-plus
//
//  Created by Cédric Derache on 04/09/2020.
//  Copyright © 2020 Cédric Derache. All rights reserved.
//

import SwiftUI

struct ColoredToggleStyle: ToggleStyle {
    var onColor = Color.green
    var offColor = Color.green
    var thumbColor = Color.white

    func makeBody(configuration: Self.Configuration) -> some View {
        RoundedRectangle(cornerRadius: 16, style: .circular)
            .fill(configuration.isOn ? onColor : offColor)
            .frame(width: 50, height: 29)
            .overlay(
                Circle()
                    .fill(thumbColor)
                    .shadow(radius: 1, x: 0, y: 1)
                    .padding(1.5)
                    .offset(x: configuration.isOn ? 10 : -10))
            .animation(Animation.easeInOut(duration: 0.2))
            .onTapGesture {
                withAnimation {
                    configuration.isOn.toggle()
                }
            }
            .font(.title)
    }
}
