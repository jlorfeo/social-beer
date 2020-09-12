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
    var beerInteractor: BeerService

    init(beerInteractor: BeerService) {
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
                        print(error.debugDescription)
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

struct Beer: Codable, Hashable {
    let id: Int
    let name: String
    let first_brewed: String
    let description: String
    let image_url: String
    let abv: Double?
    let ibu: Double?
    let ph: Double?
}
