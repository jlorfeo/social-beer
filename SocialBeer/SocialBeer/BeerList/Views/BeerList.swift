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

    var body: some View {
        NavigationView {
            VStack {
                if viewModel.beers.isEmpty {
                    Text("No beer for you :(")
                        .fontWeight(.semibold)
                        .font(.largeTitle)
                        .foregroundColor(.gray)
                        .shadow(radius: 5)
                } else {
                    SearchBar(text: $searchText, placeholder: "Find your beer!")
                    List {
                        ForEach(self.viewModel.beers.filter {
                            self.searchText.isEmpty
                                ? true
                                : $0.name.lowercased().contains(self.searchText.lowercased())
                        }, id: \.self) { beer in
                            NavigationLink(destination: BeerDetails(beer: beer)) {
                                BeerCell(beer: beer)
                            }
                            .onAppear {
                                if beer == self.viewModel.beers.last {
                                    self.viewModel.fetchBeers()
                                }

                            }
                        }
                    }
                }
            }
            .navigationBarTitle("Social Beer")
        }
        // Needed for correct presentation on iPads
        .phoneOnlyStackNavigationView()
        .onAppear(perform: {
            self.viewModel.fetchBeers()
        })
    }
}
