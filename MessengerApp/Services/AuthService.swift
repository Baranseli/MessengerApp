//
//  AuthService.swift
//  MessengerApp
//
//  Created by Kafkas Baranseli on 21/05/2019.
//  Copyright © 2019 Baranseli. All rights reserved.
//

import Foundation
import Firebase

// 012 create a class for AuthService
class AuthService {
    
    static let instance = AuthService()
    
    
    // 013 func for reg user
    func registerUser(withEmail email: String, andPassword password: String, userCreationComplete: @escaping(_ status: Bool, _ error: Error?) -> ()) {
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            guard let user = authResult?.user else {
                userCreationComplete(false, error)
                return
            }
            let userData = ["provider": user.providerID, "email": user.email]
            DataService.instance.createDBUser(uid: user.uid, userData: userData as Dictionary<String, Any>)
            userCreationComplete(true, nil)
        }
    }
    
    // 014 func for login user
    func loginUser(withEmail email: String, andPassword password: String, loginComplete: @escaping(_ status: Bool, _ error: Error?) -> ()) {
        Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
            guard let user = authResult?.user else {
                loginComplete(false, error)
                return
            }
            loginComplete(true, nil)
        }
    }
}
