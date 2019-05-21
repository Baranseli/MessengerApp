//
//  LoginVC.swift
//  MessengerApp
//
//  Created by Kafkas Baranseli on 20/05/2019.
//  Copyright © 2019 Baranseli. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var emailTxtFld: InsetTextField!
    @IBOutlet weak var passwordTxtFld: InsetTextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        emailTxtFld.delegate = self
        passwordTxtFld.delegate = self
        
        
    }
    // 019 to check if the user registered to make available login
    @IBAction func signInBtnPressed(_ sender: Any) {
        if emailTxtFld.text != nil && passwordTxtFld.text != nil {
            AuthService.instance.loginUser(withEmail: emailTxtFld.text!, andPassword: passwordTxtFld.text!) { (success, loginError) in
                if success {
                    self.dismiss(animated: true, completion: nil)
                } else {
                    print(String(describing: loginError?.localizedDescription))
                }
                AuthService.instance.registerUser(withEmail: self.emailTxtFld.text!, andPassword: self.passwordTxtFld.text!, userCreationComplete: { (success, registrationError) in
                    if success {
                        AuthService.instance.loginUser(withEmail: self.emailTxtFld.text!, andPassword: self.passwordTxtFld.text!, loginComplete: { (success, nil) in
                            self.dismiss(animated: true, completion: nil)
                           print("Registered")
                        })
                    } else {
                         print(String(describing: loginError?.localizedDescription))
                    }
                })
            }
        }
    }
    
   
    
    // 018 to dismiss and close the window
    @IBAction func closeBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    

}

// 017 to use text filed delegate
extension LoginVC: UITextFieldDelegate {}
