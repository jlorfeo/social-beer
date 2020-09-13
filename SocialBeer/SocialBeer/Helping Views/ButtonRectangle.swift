//
//  ButtonRectangle.swift
//  SocialBeer
//
//  Created by Lorfeo, Jan-Erik on 13.09.20.
//  Copyright © 2020 Lorfeo, Jan-Erik. All rights reserved.
//

import SwiftUI

struct ButtonRectangle: View {
    var action: () -> Void
    var body: some View {
        Button(action: {
            self.action()
        }, label: {
            HStack {
                Text("Where to find me!")
                    .fontWeight(.semibold)
            }
            .padding()
            .frame(width: UIScreen.main.bounds.width / 1.5)
            .foregroundColor(.white)
            .background(Color.green)
        })
    }
}

struct ButtonRectangle_Previews: PreviewProvider {
    static var previews: some View {
        ButtonRectangle(action: {})
    }
}
