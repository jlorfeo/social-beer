//
//  BeerLocationView.swift
//  SocialBeer
//
//  Created by Lorfeo, Jan-Erik on 13.09.20.
//  Copyright © 2020 Lorfeo, Jan-Erik. All rights reserved.
//

import SwiftUI

struct BeerLocationView: View {
    @Binding var isMapPresented: Bool
    var body: some View {
        NavigationView {
            MapView()
                .navigationBarTitle("Where to find me")
                .navigationBarItems(trailing: Button("Close", action: {
                    self.isMapPresented.toggle()
                }))
        }
    }
}
