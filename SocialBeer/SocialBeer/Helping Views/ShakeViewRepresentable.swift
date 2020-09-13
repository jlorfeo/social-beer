//
//  ShakeViewRepresentable.swift
//  SocialBeer
//
//  Created by Lorfeo, Jan-Erik on 12.09.20.
//  Copyright © 2020 Lorfeo, Jan-Erik. All rights reserved.
//

import Combine
import SwiftUI

let messagePublisher = PassthroughSubject<Void, Never>()

class ShakableViewController: UIViewController {
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        guard motion == .motionShake else { return }
        messagePublisher.send()
    }
}

struct ShakableViewRepresentable: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> ShakableViewController {
        ShakableViewController()
    }
    func updateUIViewController(_ uiViewController: ShakableViewController, context: Context) {

    }
}
