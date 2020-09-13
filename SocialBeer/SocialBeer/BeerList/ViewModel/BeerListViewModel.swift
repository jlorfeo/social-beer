//
//  BeerListViewModel.swift
//  SocialBeer
//
//  Created by Lorfeo, Jan-Erik on 12.09.20.
//  Copyright © 2020 Lorfeo, Jan-Erik. All rights reserved.
//

import Foundation

class BeerListViewModel: ObservableObject {
    @Published var beers: [Beer] = []

    private var subscriptions: Set<AnyCancellable> = []
    var beerInteractor: BeerInteractor

    init(beerInteractor: BeerInteractor) {
        self.beerInteractor = beerInteractor
        beerInteractor.beerPublisher
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    guard let error = error as? DecodingError else {
                        return
                    }
                    switch error {
                    case .dataCorrupted(let error):
                        print(error.underlyingError)
                    case .keyNotFound(_, let context):
                        print(context.debugDescription)
                    case .typeMismatch(_ , let context):
                        print(context.debugDescription)
                    case .valueNotFound(_, let context):
                        print(context.debugDescription)

                    default:
                        return
                    }
                }
            }, receiveValue: { beers in
                self.beers.append(contentsOf: beers)
            })
            .store(in: &subscriptions)
    }

    func fetchBeers() {
        beerInteractor.fetchBeers()
    }
}
