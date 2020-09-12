//
//  BeerService.swift
//  SocialBeer
//
//  Created by Lorfeo, Jan-Erik on 12.09.20.
//  Copyright © 2020 Lorfeo, Jan-Erik. All rights reserved.
//

import Combine
import Foundation

struct BeerService {
    var repository: BeerRepository

    var beerPublisher: AnyPublisher<[Beer], Error> {
        repository.$currentData
            .receive(on: RunLoop.main)
            .map { $0 }
            .decode(type: Array<Beer>.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }

    func fetchBeers() {
        repository.read()
    }
}
