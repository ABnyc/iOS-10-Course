//
//  ViewController.swift
//  DevSlopesSocial
//
//  Created by Arpita Bhatia on 2/23/17.
//  Copyright © 2017 Arpita Bhatia. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Firebase


class SignInVC: UIViewController {
    
    @IBOutlet weak var emailTextField: FancyField!
    @IBOutlet weak var pwdTextField: FancyField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func facebookBtnPressed(_ sender: Any) {
        
        let facebookLogin = FBSDKLoginManager()
        facebookLogin.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if error != nil {
                print("AB :Unable to authenticate with Facebook \(error)")
            } else if result?.isCancelled == true {
                print("AB :User cancelled Facebook authentication")
            }else {
                print("AB Successfully authenticated with Facebook")
                let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firebaseAuth(credential)
                
            }
        }
    }
    
    func firebaseAuth(_ credential: FIRAuthCredential){
        FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in
            if error != nil {
                print("AB Unable to authenticate with Firebase \(error)")
            } else {
                print("AB: Successfully authenticated with Firebase")
            }})
    }
    
    @IBAction func signInBtnPressed(_ sender: Any) {
        if let email = emailTextField.text, let pwd = pwdTextField.text {
            FIRAuth.auth()?.signIn(withEmail: email, password: pwd, completion: { (user, error) in
                if error == nil {
                    print("AB: Email user authenticated with Firebase")
                } else {
                    FIRAuth.auth()?.createUser(withEmail: email, password: pwd, completion: { (user, error) in
                        
                        if error != nil {
                            print("AB: Email user created/authenticated with Firebase")
                        } else {
                            print("AB: Unable to create/authenticate user with firebase using email")
                        }

                    })
                }
            })
        }
        
    }

}

