//
//  BeerListViewModel.swift
//  SocialBeer
//
//  Created by Lorfeo, Jan-Erik on 12.09.20.
//  Copyright © 2020 Lorfeo, Jan-Erik. All rights reserved.
//

import Combine
import Foundation

class BeerListViewModel: ObservableObject {
    @Published var beers: [Beer] = []

    private var subscriptions: Set<AnyCancellable> = []
    private var beerInteractor: BeerInteractor

    init(beerInteractor: BeerInteractor) {
        self.beerInteractor = beerInteractor
        beerInteractor.beerPublisher()
            .sink(receiveValue: { beers in
                self.beers.append(contentsOf: beers)
            })
            .store(in: &subscriptions)
    }

    func fetchBeers() {
        beerInteractor.fetchBeers()
    }
}
