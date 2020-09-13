//
//  BeerDetails.swift
//  SocialBeer
//
//  Created by Lorfeo, Jan-Erik on 12.09.20.
//  Copyright © 2020 Lorfeo, Jan-Erik. All rights reserved.
//

import Combine
import SDWebImageSwiftUI
import SwiftUI

struct BeerDetails: View {
    @State private var shareBeer = false
    @State private var wasShaken = false
    @State private var isMapPresented = false
    var beer: Beer

    var body: some View {
        ZStack {
            // Overlay that enables the shake gesture to be recognized
            ShakableViewRepresentable()
                .allowsHitTesting(/*@START_MENU_TOKEN@*/false/*@END_MENU_TOKEN@*/)
            ScrollView(.vertical) {
                VStack {
                    // MARK: - BeerImage
                    CircledWebImage(imageUrl: beer.image_url , frame: Frame(width: 250, height: 250))
                    // MARK: - Name and Description
                    VStack {
                        Text(beer.name)
                            .font(.largeTitle)
                            .padding()
                        Text("First Brewed: \(beer.first_brewed )")
                        ShareBeerButton(label : "Lets beer together!", action: {
                            self.shareBeer = true
                        })
                        .sheet(isPresented: $shareBeer, content: {
                            ActivityView(
                                activityItems: ["Lets drink \(self.beer.name) together!"] as [Any],
                                applicationActivities: nil)
                        })
                        .padding()
                        Text(beer.description)
                            .fontWeight(.light)
                            .padding()
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    // MARK: - Attributes
                    DescriptionCell(header: "ABV", value: "\(beer.abv ?? 0)")
                    DescriptionCell(header: "PH", value: "\(beer.ph ?? 0)")
                    DescriptionCell(header: "Bitterness", value: "\(beer.bitterness?.rawValue ?? "Not calculated")")
                    if wasShaken {
                        ButtonRectangle(action: {
                            self.isMapPresented = true
                        })
                        .padding()
                        .sheet(isPresented: $isMapPresented, content: {
                            BeerLocationView(isMapPresented: self.$isMapPresented)
                        })
                    }
                }
                .padding(.top)
            }
            .onReceive(messagePublisher) { _ in
                self.wasShaken = true
            }
        }
        // Workaround for NavigationBar Bug in SwiftUI that displays the navigation wrong
        // Described on: https://bit.ly/2Ro0kde
        .navigationBarTitle(Text(beer.name), displayMode: .inline)
    }
}
