//
//  BeerCell.swift
//  SocialBeer
//
//  Created by Lorfeo, Jan-Erik on 12.09.20.
//  Copyright © 2020 Lorfeo, Jan-Erik. All rights reserved.
//

import SDWebImageSwiftUI
import SwiftUI

struct BeerCell: View {
    var beer: Beer
    var body: some View {
        HStack {
            WebImage(url: URL(string: beer.image_url ))
                .resizable()
                .scaledToFit()
                .frame(width: 75, height: 75, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            VStack(alignment: .leading) {
                Text(beer.name)
                Text("First Brewed: \(beer.first_brewed )")
                    .fontWeight(.light)
            }
        }
    }
}
