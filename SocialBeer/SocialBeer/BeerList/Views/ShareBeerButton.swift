//
//  ShareBeerButton.swift
//  SocialBeer
//
//  Created by Lorfeo, Jan-Erik on 12.09.20.
//  Copyright © 2020 Lorfeo, Jan-Erik. All rights reserved.
//

import SwiftUI

struct ShareBeerButton: View {
    var label: String
    var action: () -> Void
    var body: some View {
        Button(action: {
            self.action()
        }, label: {
            HStack {
                Text(label)
                    .fontWeight(.semibold)
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(40)
        })
    }
}
