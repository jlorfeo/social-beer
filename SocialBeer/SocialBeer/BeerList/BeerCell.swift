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
    var body: some View {
        HStack {
            CircledWebImage(imageUrl: "", frame: Frame(width: 75, height: 75))
            VStack {
                Text("Punk IPA 2007 - 2010")
                Text("First Brewed: 04/2007")
                    .fontWeight(.light)
            }
        }
    }
}

struct BeerCell_Previews: PreviewProvider {
    static var previews: some View {
        BeerCell()
            .previewLayout(.fixed(width: 320, height: 100))
    }
}
