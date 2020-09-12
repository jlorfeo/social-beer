//
//  BeerList.swift
//  SocialBeer
//
//  Created by Lorfeo, Jan-Erik on 12.09.20.
//  Copyright © 2020 Lorfeo, Jan-Erik. All rights reserved.
//

import SwiftUI

struct BeerList: View {
    let beers = [Beer(id: 1,
                      name: "Punk IPA 2007 - 2010",
                      description: "Description: Our flagship beer that kick started the craft beer revolution. This is James and Martin's original take on an American IPA, subverted with punchy New Zealand hops. Layered with new world hops to create an all-out riot of grapefruit, pineapple and lychee before a spiky, mouth-puckering bitter finish.",
                      first_brewed: "04/2007",
                      image_url: "https://images.punkapi.com/v2/192.png",
                      abv: 6.0,
                      ph: 60.0,
                      ibu: 3.0),
                 Beer(id: 2,
                      name: "Punk IPA 2007 - 2010",
                       description: "Description: Our flagship beer that kick started the craft beer revolution. This is James and Martin's original take on an American IPA, subverted with punchy New Zealand hops. Layered with new world hops to create an all-out riot of grapefruit, pineapple and lychee before a spiky, mouth-puckering bitter finish.",
                       first_brewed: "04/2007",
                       image_url: "https://images.punkapi.com/v2/192.png",
                       abv: 6.0,
                       ph: 60.0,
                       ibu: 3.0),
                 Beer(id: 3,
                      name: "Punk IPA 2007 - 2010",
                       description: "Description: Our flagship beer that kick started the craft beer revolution. This is James and Martin's original take on an American IPA, subverted with punchy New Zealand hops. Layered with new world hops to create an all-out riot of grapefruit, pineapple and lychee before a spiky, mouth-puckering bitter finish.",
                       first_brewed: "04/2007",
                       image_url: "https://images.punkapi.com/v2/192.png",
                       abv: 6.0,
                       ph: 60.0,
                       ibu: 3.0),
                 Beer(id: 4,
                      name: "Punk IPA 2007 - 2010",
                       description: "Description: Our flagship beer that kick started the craft beer revolution. This is James and Martin's original take on an American IPA, subverted with punchy New Zealand hops. Layered with new world hops to create an all-out riot of grapefruit, pineapple and lychee before a spiky, mouth-puckering bitter finish.",
                       first_brewed: "04/2007",
                       image_url: "https://images.punkapi.com/v2/192.png",
                       abv: 6.0,
                       ph: 60.0,
                       ibu: 3.0)
                ]
    @State private var searchText = ""
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText, placeholder: "Find your beer")
                List {
                    ForEach(self.beers.filter {
                        self.searchText.isEmpty ? true : $0.name.lowercased().contains(self.searchText.lowercased())
                    }, id: \.self) { beer in
                        NavigationLink(destination: BeerDetails(beer: beer)) {
                            BeerCell(beer: beer)
                        }
                    }
                }
                .navigationBarTitle("Beer")
            }
        }
    }
}

struct BeerList_Previews: PreviewProvider {
    let beers = [Beer(id: 1,
                      name: "Punk IPA 2007 - 2010",
                      description: "Description: Our flagship beer that kick started the craft beer revolution. This is James and Martin's original take on an American IPA, subverted with punchy New Zealand hops. Layered with new world hops to create an all-out riot of grapefruit, pineapple and lychee before a spiky, mouth-puckering bitter finish.",
                      first_brewed: "04/2007",
                      image_url: "https://images.punkapi.com/v2/192.png",
                      abv: 6.0,
                      ph: 60.0,
                      ibu: 3.0),
                 Beer(id: 2,
                      name: "Punk IPA 2007 - 2010",
                       description: "Description: Our flagship beer that kick started the craft beer revolution. This is James and Martin's original take on an American IPA, subverted with punchy New Zealand hops. Layered with new world hops to create an all-out riot of grapefruit, pineapple and lychee before a spiky, mouth-puckering bitter finish.",
                       first_brewed: "04/2007",
                       image_url: "https://images.punkapi.com/v2/192.png",
                       abv: 6.0,
                       ph: 60.0,
                       ibu: 3.0),
                 Beer(id: 3,
                      name: "Punk IPA 2007 - 2010",
                       description: "Description: Our flagship beer that kick started the craft beer revolution. This is James and Martin's original take on an American IPA, subverted with punchy New Zealand hops. Layered with new world hops to create an all-out riot of grapefruit, pineapple and lychee before a spiky, mouth-puckering bitter finish.",
                       first_brewed: "04/2007",
                       image_url: "https://images.punkapi.com/v2/192.png",
                       abv: 6.0,
                       ph: 60.0,
                       ibu: 3.0),
                 Beer(id: 4,
                      name: "Punk IPA 2007 - 2010",
                       description: "Description: Our flagship beer that kick started the craft beer revolution. This is James and Martin's original take on an American IPA, subverted with punchy New Zealand hops. Layered with new world hops to create an all-out riot of grapefruit, pineapple and lychee before a spiky, mouth-puckering bitter finish.",
                       first_brewed: "04/2007",
                       image_url: "https://images.punkapi.com/v2/192.png",
                       abv: 6.0,
                       ph: 60.0,
                       ibu: 3.0)
                ]
    static var previews: some View {
        BeerList()
    }
}
