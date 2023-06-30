//
//  SignInView.swift
//  SneakerStore
//
//  Created by Dinmukhambet Turysbay on 27.06.2023.
//

import SwiftUI

struct SignInView: View{
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var authData: AuthenticationController
    
    var body: some View{
        VStack{
            TextField("Username", text: $authData.email)
                .padding()
                .background(Color.customGrayBackground)
                .cornerRadius(5.0)
                .padding(.bottom, 20)
                .autocapitalization(.none)
            
            SecureField("Password", text: $authData.password)
                .padding()
                .background(Color.customGrayBackground)
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            
            Spacer()
            
            Button(action: {
                withAnimation {
                    authData.login()
                }
            }) {
                Text("Sign In")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.black)
                    .foregroundColor(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 25))
            }
        }
        .padding()
        .navigationBarTitle("Welcome back!")
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: CustomBackButton(label:"") {
            self.buttonAction()
        })
    }
    func buttonAction() {
        self.presentationMode.wrappedValue.dismiss()
    }
}
