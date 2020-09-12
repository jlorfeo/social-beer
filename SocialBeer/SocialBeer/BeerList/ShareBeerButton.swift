//
//  ShareBeerButton.swift
//  SocialBeer
//
//  Created by Lorfeo, Jan-Erik on 12.09.20.
//  Copyright © 2020 Lorfeo, Jan-Erik. All rights reserved.
//

import SwiftUI

struct ShareBeerButton: View {
    var action: () -> Void
    var body: some View {
        Button(action: {
            action()
        }, label: {
            HStack {
                Text("Lets beer together!")
                    .fontWeight(.semibold)
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(40)
        })
    }
}
