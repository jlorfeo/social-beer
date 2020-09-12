//
//  CircledImage.swift
//  SocialBeer
//
//  Created by Lorfeo, Jan-Erik on 12.09.20.
//  Copyright © 2020 Lorfeo, Jan-Erik. All rights reserved.
//

import SDWebImageSwiftUI
import SwiftUI

typealias Frame = (width: CGFloat, height: CGFloat)

struct CircledWebImage: View {
    var imageUrl: String
    var frame: Frame

    var body: some View {
        WebImage(url: URL(string: "https://images.punkapi.com/v2/192.png"))
            .renderingMode(.original)
            .resizable()
            .scaledToFit()
            .frame(width: frame.width, height: frame.height)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.init(red: 211, green: 211, blue: 211), lineWidth: 4))
            .shadow(radius: 15)
    }
}

struct CircledImage_Previews: PreviewProvider {
    static var previews: some View {
        CircledWebImage(imageUrl: "", frame: Frame(width: 200, height: 200))
    }
}
