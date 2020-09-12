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
                CircledWebImage(imageUrl: beer.image_url, frame: Frame(width: 250, height: 250))
                VStack {
                    Text(beer.name)
                        .font(.largeTitle)
                    Text("First Brewed: \(beer.first_brewed)")
                    ShareBeerButton(action: {
                        self.shareBeer = true
                    })
                    .sheet(isPresented: $shareBeer, content: {
                        ActivityView(activityItems: [beer.name] as [Any], applicationActivities: nil)
                    })
                    .padding()
                    Text(beer.description)
                        .fontWeight(.light)
                        .padding()
                        .fixedSize(horizontal: false, vertical: true)
                }
                DescriptionCell(header: "ABV", value: "\(beer.abv)")
                DescriptionCell(header: "PH", value: "\(beer.ph)")
                DescriptionCell(header: "Bitterness", value: "Highly Bitter")
            }
        }
    }
}

struct BeerDetails_Previews: PreviewProvider {
    static var previews: some View {
        BeerDetails(beer: Beer(id: 3,
                               name: "Punk IPA 2007 - 2010",
                                description: "Description: Our flagship beer that kick started the craft beer revolution. This is James and Martin's original take on an American IPA, subverted with punchy New Zealand hops.",
                                first_brewed: "04/2007",
                                image_url: "https://images.punkapi.com/v2/192.png",
                                abv: 6.0,
                                ph: 60.0,
                                ibu: 3.0))
    }
}
