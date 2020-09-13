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
    /// Repository that calls the API described in the API description
    var repository: BeerRepository { get }
    /// Returns the retrieved beers as a publisher
    func beerPublisher() -> AnyPublisher<[Beer], Never>
    /// Triggers loading of beers
    func fetchBeers()
}

class BeerInteractorImpl: BeerInteractor {
    var repository: BeerRepository

    init(repository: BeerRepository) {
        self.repository = repository
    }

    func beerPublisher() -> AnyPublisher<[Beer], Never> {
        repository.currentBeersPublisher()
    }

    func fetchBeers() {
        repository.read()
    }
}
