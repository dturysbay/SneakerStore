//
//  ContentView.swift
//  SneakerStore
//
//  Created by Dinmukhambet Turysbay on 27.06.2023.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("isOnboardingCompleted") var isOnboardingCompleted: Bool = false
    
    var body: some View{
        if !isOnboardingCompleted{
            OnboardingView(isOnboardingCompleted: $isOnboardingCompleted)
        }else{
            MainView()
        }
    }
}


