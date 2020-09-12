//
//  BeerList.swift
//  SocialBeer
//
//  Created by Lorfeo, Jan-Erik on 12.09.20.
//  Copyright © 2020 Lorfeo, Jan-Erik. All rights reserved.
//

import Combine
import SwiftUI

struct BeerList: View {
    @ObservedObject var viewModel: BeerListViewModel
    @State private var searchText = ""
    @State private var loaded = false

    var body: some View {
        NavigationView {
            Group {
                VStack {
                    SearchBar(text: $searchText, placeholder: "Find your beer")
                    List {
                        ForEach(self.viewModel.beers.filter {
                            self.searchText.isEmpty
                                ? true
                                : $0.name.lowercased().contains(self.searchText.lowercased())
                        }, id: \.self) { beer in
                            NavigationLink(destination: BeerDetails(beer: beer)) {
                                BeerCell(beer: beer)
                            }
                        }
                    }
                    .onTapGesture(perform: {
                        self.hideKeyboard()
                    })
                }
                .navigationBarTitle("Beer")
            }
        }
        .onAppear(perform: {
            self.viewModel.fetchBeers()
        })
    }
}

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
