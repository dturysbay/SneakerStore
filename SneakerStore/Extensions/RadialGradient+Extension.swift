//
//  RadialGradient+Extension.swift
//  SneakerStore
//
//  Created by Dinmukhambet Turysbay on 27.06.2023.
//

import SwiftUI

extension RadialGradient{
    static let greenGradient = RadialGradient(gradient: Gradient(colors: [Color.green.opacity(0.7), Color.gray]),
                          center: .center,
                          startRadius: 5,
                          endRadius: 500)
    static let purpleGradient = RadialGradient(gradient: Gradient(colors: [Color.purple.opacity(0.7), Color.gray]),
                          center: .center,
                          startRadius: 5,
                          endRadius: 500)
    static let brownGradient = RadialGradient(gradient: Gradient(colors: [Color.brown.opacity(0.7), Color.gray]),
                          center: .center,
                          startRadius: 5,
                          endRadius: 500)
}
