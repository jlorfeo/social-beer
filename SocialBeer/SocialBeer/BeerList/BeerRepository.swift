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
    @Published var currentData: Data = Data()
    private var page = 1

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
            }, receiveValue: { data in
                self.currentData = data
            })
            .store(in: &subscriptions)
    }

    private func fetch(url: String) -> AnyPublisher<Data, Error> {
        page += 1
        let finishedUrl = url.appending("?page=\(page)")
        let request = URLRequest(url: URL(string: finishedUrl)!)

        return URLSession.DataTaskPublisher(request: request, session: .shared)
            .tryMap { data, response in
                guard let response = response as? HTTPURLResponse, 200..<300 ~= response.statusCode else {
                    #warning("ToDo: Error Handling")
                    return data
                }
                return data
            }
            .eraseToAnyPublisher()
    }
}
