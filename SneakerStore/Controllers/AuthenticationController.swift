//
//  AuthenticationController.swift
//  SneakerStore
//
//  Created by Dinmukhambet Turysbay on 28.06.2023.
//

import Foundation
import Firebase
import FirebaseFirestore

enum ScreenState {
    case authView
    case userAutorized
}


class AuthenticationController: ObservableObject{
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    @Published var alertmessage: String = ""
    @Published var isShowingAlert: Bool = false
    @Published var isLoading: Bool = false
    @Published var screenState: ScreenState = .authView
    
    func register() {
        if password == confirmPassword {
            isLoading = true
                let userData = UserData(email: email,
                                        password: password)
                
                Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                    
                    guard let userAuthorized = authResult?.user, error == nil else {
                        self.alertmessage = "Registration failed: " + (error?.localizedDescription ?? "Unknown Error")
                        self.isShowingAlert = true
                        
                        return
                    }
                    
                    
                    if let user = Auth.auth().currentUser {
                        let db = Firestore.firestore()
                        let userDocRef = db.collection("users").document(user.uid)
                        
                        let userFirestoreData: [String: Any] = [
                            "email": userData.email,
                            "password": userData.password
                        ]
                        
                        userDocRef.setData(userFirestoreData) { error in
                            guard error == nil else{
                                self.alertmessage = "Failed to save user data: \(error?.localizedDescription ?? "Unknown Error")"
                                self.isShowingAlert = true
                                
                                return
                            }
                            
                            userAuthorized.sendEmailVerification{ error in
                                guard error == nil else{
                                    self.alertmessage = error?.localizedDescription ?? "Unknown Error"
                                    self.isShowingAlert = true
                                    
                                    return
                                }
                            }
                                
                            self.alertmessage = "User registered successfully! Please check your email"
                            self.isShowingAlert = true
                            
                            self.email = ""
                            self.password = ""
                            self.confirmPassword = ""
                        }
                    }
                }
            isLoading = false
        }else{
            self.alertmessage = "Passwords do not match"
            self.isShowingAlert = true
        }
    }
    
    func login() {
        isLoading = true
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            
            guard let user = authResult?.user, error == nil else{
                self.alertmessage = error?.localizedDescription ?? "Unknown Error"
                self.isShowingAlert = true
                
                return
            }
           
            self.screenState = .userAutorized
        }
    }
    
}
