//
//  BeerService.swift
//  SocialBeer
//
//  Created by Lorfeo, Jan-Erik on 12.09.20.
//  Copyright © 2020 Lorfeo, Jan-Erik. All rights reserved.
//

import Combine
import Foundation

struct BeerInteractor {
    var repository: BeerRepository

    var beerPublisher: AnyPublisher<[Beer], Never> {
        repository.currentDataPublisher()
    }

    func fetchBeers() {
        repository.read()
    }
}
