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
    @State private var shareBeer = false
    var beer: Beer

    var body: some View {
        ScrollView(.vertical) {
            VStack {
                CircledWebImage(imageUrl: beer.image_url , frame: Frame(width: 250, height: 250))
                VStack {
                    Text(beer.name)
                        .font(.largeTitle)
                        .padding()
                    Text("First Brewed: \(beer.first_brewed )")
                    ShareBeerButton(action: {
                        self.shareBeer = true
                    })
                    .sheet(isPresented: $shareBeer, content: {
                        ActivityView(activityItems: [self.beer.name] as [Any], applicationActivities: nil)
                    })
                    .padding()
                    Text(beer.description)
                        .fontWeight(.light)
                        .padding()
                        .fixedSize(horizontal: false, vertical: true)
                }
                DescriptionCell(header: "ABV", value: "\(String(describing: beer.abv))")
                DescriptionCell(header: "PH", value: "\(String(describing: beer.ph))")
                DescriptionCell(header: "Bitterness", value: "Highly Bitter")
            }
        }
    }
}
