//
//  ContentView.swift
//  SocialBeer
//
//  Created by Lorfeo, Jan-Erik on 10.09.20.
//  Copyright © 2020 Lorfeo, Jan-Erik. All rights reserved.
//

import SDWebImageSwiftUI
import SwiftUI

struct ContentView: View {
    var factory: BeerFactory
    var body: some View {
        BeerList(viewModel: factory.viewModel())
    }
}
