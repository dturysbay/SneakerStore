//
//  WelcomeView.swift
//  SneakerStore
//
//  Created by Dinmukhambet Turysbay on 27.06.2023.
//

import SwiftUI

struct WelcomeView: View{
//    @EnvironmentObject var authData: AuthenticationController
    var body: some View{
        NavigationView{
            VStack{
                Image("onboarding4")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .frame(height: UIScreen.main.bounds.height * 0.7)
                    .padding(.top,-150)
                VStack{
                    Text("Welcome to the biggest sneakers store app")
                        .font(.system(size: 28,weight: .semibold))
                        .multilineTextAlignment(.center)
                        .padding(.bottom,24)
                    NavigationLink(destination:
                                    SignUpView()
//                        .environmentObject(authData)
                    ) {
                               Text("Sign Up")
                                   .frame(maxWidth: .infinity)
                                   .padding()
                                   .background(Color.black)
                                   .foregroundColor(Color.white)
                                   .clipShape(RoundedRectangle(cornerRadius: 25))
                                   .padding(.horizontal,16)
                                   .padding(.bottom,24)
                           }
                    .navigationBarBackButtonHidden(true)
                           
                    NavigationLink(destination:
                                    SignInView()
//                        .environmentObject(authData)
                    ) {
                        Text("I have already an account")
                            .foregroundColor(.black)
                            .font(.system(size: 17,weight: .semibold))
                            .multilineTextAlignment(.center)
                    }
                }
            }
        }
        .tint(Color.black)
        
    }
}
