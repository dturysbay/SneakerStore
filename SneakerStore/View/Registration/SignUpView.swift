//
//  SignUpView.swift
//  SneakerStore
//
//  Created by Dinmukhambet Turysbay on 27.06.2023.
//

import SwiftUI

struct SignUpView: View{
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var authData: AuthenticationController
    
    var body: some View {
        
        let loadingView = ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .scaleEffect(1.5, anchor: .center)
                    .foregroundColor(.white)
                    .background(Color.white)
        
        VStack {
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
            
            SecureField("Confirm Password", text: $authData.confirmPassword)
                .padding()
                .background(Color.customGrayBackground)
                .cornerRadius(5.0)
            Spacer()
            
            Button(action: {
                withAnimation {
                    authData.register()
                }
            }) {
                Text("Sign Up")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.black)
                    .foregroundColor(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 25))
            }
        }
        .padding()
        .navigationBarTitle("New User")
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: CustomBackButton(label:"") {
            self.buttonAction()
        })
        .alert(isPresented: $authData.isShowingAlert) {
            Alert(title: Text("Notification"), message: Text(authData.alertmessage), dismissButton: .default(Text("OK")){
                authData.isLoading = false
            })
        }
        .overlay(authData.isLoading ? loadingView : nil)
    }
    
    func buttonAction() {
        self.presentationMode.wrappedValue.dismiss()
    }
}
