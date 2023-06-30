//
//  MainView.swift
//  SneakerStore
//
//  Created by Dinmukhambet Turysbay on 28.06.2023.
//

import SwiftUI

struct MainView: View{
    @ObservedObject var authData: AuthenticationController = AuthenticationController()
    var body: some View {
        Group{
            switch authData.screenState{
            case .authView:
                WelcomeView()
                    .environmentObject(authData)
            case .userAutorized:
                StoreView()
            }
        }
    }
}
