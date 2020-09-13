//
//  SocialBeerTests.swift
//  SocialBeerTests
//
//  Created by Lorfeo, Jan-Erik on 10.09.20.
//  Copyright © 2020 Lorfeo, Jan-Erik. All rights reserved.
//

import Combine
import XCTest
@testable import SocialBeer

class SocialBeerTests: XCTestCase {
    var beerRepository: BeerRepository!
    var subscriptions: Set<AnyCancellable> = []

    override func setUp() {
        // Test beer API
        let apiDescription = APIDescription(url: "https://api.punkapi.com/v2/beers")
        beerRepository = BeerRepository(description: apiDescription)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testIfBeerRepositoryEmitsCorrectCountAndValues() throws {
        // Describe expected values
        let beerCount = 25
        let beer = Beer(id: 1, name: "Buzz", first_brewed: "09/2007", description: "A light, crisp and bitter IPA brewed with English and American hops. A small batch brewed only once.", image_url: "https://images.punkapi.com/v2/keg.png", abv: 4.5, ibu: 60, ph: 4.4)

        let receivedAllValues = expectation(description: "Received all values")

        beerRepository.currentBeersPublisher()
            .sink(receiveValue: { beers in
                if beers.isEmpty {
                    // Subscription not ready
                    return
                } else {
                    if beers.count != beerCount {
                        XCTFail("Received other values than expected")
                        return
                    }

                    if beers.first != beer {
                        XCTFail("Received other beer than expected")
                    }
                    receivedAllValues.fulfill()
                }
            }).store(in: &subscriptions)

        // Trigger loading of beers
        beerRepository.read()

        // wait for receivedAllValues to be fulfilled
        waitForExpectations(timeout: 2, handler: nil)
    }

    func testPerformanceOfBeerAPI() throws {
        self.measure {
            try? testIfBeerRepositoryEmitsCorrectCountAndValues()
        }
    }

}
