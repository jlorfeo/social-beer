//
//  BeerService.swift
//  SocialBeer
//
//  Created by Lorfeo, Jan-Erik on 12.09.20.
//  Copyright © 2020 Lorfeo, Jan-Erik. All rights reserved.
//

import Combine
import Foundation

protocol BeerInteractor {
    var repository: BeerRepository { get }
    func beerPublisher() -> AnyPublisher<[Beer], Never>
    func fetchBeers()
}

class BeerInteractorImpl: BeerInteractor {
    var repository: BeerRepository

    init(repository: BeerRepository) {
        self.repository = repository
    }

    func beerPublisher() -> AnyPublisher<[Beer], Never> {
        repository.currentDataPublisher()
    }

    func fetchBeers() {
        repository.read()
    }
}
