//
//  IntroductionDetailView.swift
//  mon-bicloo-plus
//
//  Created by Cédric Derache on 07/09/2020.
//  Copyright © 2020 Cédric Derache. All rights reserved.
//

import SwiftUI

struct IntroductionDetailView: View {
    var title: String = "title"
    var subTitle: String = "subTitle"
    var imageName: String = "car"

    var body: some View {
        HStack(alignment: .center) {
            Image(systemName: imageName)
                .font(.title)
                .foregroundColor(.accentColor)
                .frame(width: 80)

            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.accentColor)

                Text(subTitle)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .fixedSize(horizontal: false, vertical: true)
            }
            .padding(.trailing)
        }
        .padding(.top)
    }
}

struct IntroductionDetailView_Previews: PreviewProvider {
    static var previews: some View {
        IntroductionDetailView()
    }
}
