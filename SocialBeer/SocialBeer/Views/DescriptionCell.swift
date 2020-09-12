//
//  DescriptionCell.swift
//  SocialBeer
//
//  Created by Lorfeo, Jan-Erik on 12.09.20.
//  Copyright © 2020 Lorfeo, Jan-Erik. All rights reserved.
//

import SwiftUI

struct DescriptionCell: View {
    var header: String
    var value: String

    var body: some View {
        HStack {
            Text("\(header):")
                .bold()
            Spacer()
            Text(value)
        }
        .padding()
    }
}
