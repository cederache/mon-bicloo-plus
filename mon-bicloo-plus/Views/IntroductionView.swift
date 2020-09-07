//
//  IntroductionView.swift
//  mon-bicloo-plus
//
//  Created by Cédric Derache on 07/09/2020.
//  Copyright © 2020 Cédric Derache. All rights reserved.
//

import SwiftUI

struct IntroductionView: View {
    var onIntroductionShown: ()->Void
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center) {

                Spacer()

                Image("Logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 180, alignment: .center)
                    .foregroundColor(.accentColor)
                    .cornerRadius(15)
                
                Text("Bienvenue sur")
                    .font(.system(size: 36))
                    .fontWeight(.black)
                    .foregroundColor(.primary)
                
                Text("Mon Bicloo Plus")
                    .font(.system(size: 36))
                    .fontWeight(.black)
                    .foregroundColor(.accentColor)

                VStack(alignment: .leading) {
                    IntroductionDetailView(title: "Rapide", subTitle: "Voyez rapidement les vélos et les places disponibles dans les stations", imageName: "hare")
                    
                    IntroductionDetailView(title: "Clair", subTitle: "Un affichage pensé pour permettre une lecture facile", imageName: "eye")
                    
                    IntroductionDetailView(title: "Personalisable", subTitle: "Rangez vos stations favorites dans vos groupes pour les voir sur l'écran d'accueil en un coup d'oeil", imageName: "gear")
                }

                Spacer(minLength: 30)

                Button(action: {
                    self.onIntroductionShown()
                }) {
                    Text("Continuer")
                        .foregroundColor(.primary)
                        .font(.headline)
                        .padding()
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                        .background(RoundedRectangle(cornerRadius: 15, style: .continuous)
                            .fill(Color.accentColor))
                        .padding(.bottom)
                }
                .padding(.horizontal)
            }
        }
    }
}

struct IntroductionView_Previews: PreviewProvider {
    static var previews: some View {
        IntroductionView(onIntroductionShown: {})
    }
}
