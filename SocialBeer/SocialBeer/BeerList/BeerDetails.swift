//
//  BeerDetails.swift
//  SocialBeer
//
//  Created by Lorfeo, Jan-Erik on 12.09.20.
//  Copyright © 2020 Lorfeo, Jan-Erik. All rights reserved.
//

import SDWebImageSwiftUI
import SwiftUI

struct BeerDetails: View {
    static let description = "Description: Our flagship beer that kick started the craft beer revolution. This is James and Martin's original take on an American IPA, subverted with punchy New Zealand hops. Layered with new world hops to create an all-out riot of grapefruit, pineapple and lychee before a spiky, mouth-puckering bitter finish."

    @State private var shareBeer = false
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                CircledWebImage(imageUrl: "", frame: Frame(width: 250, height: 250))
                VStack {
                    Text("Punk IPA 2007 - 2010")
                        .font(.largeTitle)
                    Text("First Brewed: 04/2007")
                    ShareBeerButton(action: {
                        self.shareBeer = true
                    })
                        .sheet(isPresented: $shareBeer, content: {
                            ActivityView(activityItems: ["Punk IPA 2007 - 2010"] as [Any], applicationActivities: nil)
                        })
                    Text(BeerDetails.description)
                        .fontWeight(.light)
                        .padding()
                        .fixedSize(horizontal: false, vertical: true)
                }
                DescriptionCell(header: "ABV", value: "6.0")
                DescriptionCell(header: "PH", value: "4.4")
                DescriptionCell(header: "Bitterness", value: "Highly Bitter")
            }
        }
    }
}

struct BeerDetails_Previews: PreviewProvider {
    static var previews: some View {
        BeerDetails()
    }
}

