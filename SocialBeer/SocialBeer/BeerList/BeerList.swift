//
//  BeerList.swift
//  SocialBeer
//
//  Created by Lorfeo, Jan-Erik on 12.09.20.
//  Copyright © 2020 Lorfeo, Jan-Erik. All rights reserved.
//

import SwiftUI

struct BeerList: View {
    var body: some View {
        NavigationView {
            List(0..<5) { _ in
                NavigationLink(destination: BeerDetails()) {
                    BeerCell()
                }
            }
            .navigationBarTitle("Beer")
        }
    }
}

struct BeerList_Previews: PreviewProvider {
    static var previews: some View {
        BeerList()
    }
}
