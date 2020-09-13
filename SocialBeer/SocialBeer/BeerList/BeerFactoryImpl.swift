//
//  BeerFactory.swift
//  SocialBeer
//
//  Created by Lorfeo, Jan-Erik on 12.09.20.
//  Copyright © 2020 Lorfeo, Jan-Erik. All rights reserved.
//

import Foundation

protocol BeerFactory {
    func viewModel() -> BeerListViewModel
}

class BeerFactoryImpl: BeerFactory {
    func viewModel() -> BeerListViewModel {
        BeerListViewModel(
            beerInteractor: interactor()
        )
    }

    private func interactor() -> BeerInteractor {
        BeerInteractorImpl(repository: repository())
    }

    private func repository() -> BeerRepository {
        BeerRepository(description: apiDescription())
    }

    private func apiDescription() -> APIDescription {
        APIDescription(url: "https://api.punkapi.com/v2/beers")
    }
}
