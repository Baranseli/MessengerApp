//
//  AuthVC.swift
//  MessengerApp
//
//  Created by Kafkas Baranseli on 20/05/2019.
//  Copyright © 2019 Baranseli. All rights reserved.
//

import UIKit



class AuthVC: UIViewController {

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
// 016 to change the window by present
    @IBAction func signInWithEmailBtnPressed(_ sender: Any) {
        let loginVC = storyboard?.instantiateViewController(withIdentifier: "LoginVC")
        present(loginVC!, animated: true, completion: nil)
    }
    
    @IBAction func googleSignInBtnPressed(_ sender: Any) {
    }
    
    @IBAction func faceBookSignInBtnPressed(_ sender: Any) {
    }
    
    

}
