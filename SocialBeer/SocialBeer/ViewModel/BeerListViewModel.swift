//
//  BeerListViewModel.swift
//  SocialBeer
//
//  Created by Lorfeo, Jan-Erik on 12.09.20.
//  Copyright © 2020 Lorfeo, Jan-Erik. All rights reserved.
//

import Foundation

struct BeerListViewModel {
    var beers: [Beer]
}

struct Beer: Codable, Hashable {
    let id: Int
    let name: String
    let description: String
    let first_brewed: String
    let image_url: String
    let abv: Double
    let ph: Double
    let ibu: Double
}
