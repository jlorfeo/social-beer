//
//  Beer.swift
//  SocialBeer
//
//  Created by Lorfeo, Jan-Erik on 13.09.20.
//  Copyright © 2020 Lorfeo, Jan-Erik. All rights reserved.
//

import Foundation

struct Beer: Codable, Hashable {
    let id: Int
    let name: String
    let first_brewed: String
    let description: String
    let image_url: String
    let abv: Double?
    let ibu: Double?
    let ph: Double?
    var bitterness: Bitterness? {
        guard let ibu = ibu else {
            return nil
        }
        return Bitterness(ibu: ibu)
    }
}

enum Bitterness: String, Codable {
    case low
    case medium
    case high
    case notCalculated
}

extension Bitterness {
    init?(ibu: Double) {
        switch ibu {
        case 0...31:
            self = .low
        case 32...60:
            self = .medium
        case _ where ibu >= 61:
            self = .high
        default:
            self = .notCalculated
        }
    }
}
