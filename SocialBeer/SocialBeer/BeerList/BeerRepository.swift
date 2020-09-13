//
//  BeerRepository.swift
//  SocialBeer
//
//  Created by Lorfeo, Jan-Erik on 12.09.20.
//  Copyright © 2020 Lorfeo, Jan-Erik. All rights reserved.
//

import Combine
import Foundation

class BeerRepository {
    @Published var currentBeer: [Beer] = []
    private var page = 0
    private var subscriptions: Set<AnyCancellable> = []
    private var description: APIDescription

    init(description: APIDescription) {
        self.description = description
    }

    func read() {
        fetch(url: description.url)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }, receiveValue: { beers in
                self.currentBeer = beers
            })
            .store(in: &subscriptions)
    }

    func currentDataPublisher() -> AnyPublisher<[Beer], Never> {
        $currentBeer
            .receive(on: RunLoop.main)
            .map { $0 }
            .eraseToAnyPublisher()
    }

    private func fetch(url: String) -> AnyPublisher<[Beer], Error> {
        page += 1
        let tmpURL = url.appending("?page=\(page)")
        return URLSession.shared
            .dataTaskPublisher(for: URL(string: tmpURL)!)
            .tryMap { element -> Data in
                guard let httpResponse = element.response as? HTTPURLResponse,
                    httpResponse.statusCode == 200 else {
                        throw URLError(.badServerResponse)
                    }
                    return element.data
            }
            .decode(type: Array<Beer>.self, decoder: JSONDecoder())
            .mapError { error in
                guard let decodingError = error as? DecodingError else {
                    return error
                }
                switch decodingError {
                case .dataCorrupted(let context):
                    print(context.debugDescription)
                case .keyNotFound(_, let context):
                    print(context.debugDescription)
                case .typeMismatch(_ , let context):
                    print(context.debugDescription)
                case .valueNotFound(_, let context):
                    print(context.debugDescription)

                default:
                    return error
                }
                return error
            }
            .eraseToAnyPublisher()
    }
}
