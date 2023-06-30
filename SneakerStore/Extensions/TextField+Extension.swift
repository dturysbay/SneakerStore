//
//  TextField+Extension.swift
//  SneakerStore
//
//  Created by Dinmukhambet Turysbay on 27.06.2023.
//

import SwiftUI

extension Binding where Value == String {
    static func activeText(_ value: Binding<String>, isActive: Binding<Bool>) -> Binding<String> {
        Binding(
            get: { value.wrappedValue },
            set: {
                value.wrappedValue = $0
                isActive.wrappedValue = !$0.isEmpty
            }
        )
    }
}
