//
//  ViewController.swift
//  socialmedia
//
//  Created by Royce Reynolds on 10/11/17.
//  Copyright © 2017 Royce Reynolds. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Firebase

class SignInVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func facebookBtntapped(_ sender: Any) {
       
        let facebookLogin = FBSDKLoginManager()
        
        facebookLogin.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if error != nil {
                print("JESS: Unable to authenticate with Facebook")
            }else if result?.isCancelled == true {
                print("JESS: User cancelled Facebook authentication")
            }else {
                print("JESS: Successfully with Facebook")
                let credential = FacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firebaseAuth(credential)
            }
        }
        
    }
    
    func firebaseAuth(_ credential: AuthCredential){
        Auth.auth().signIn(with: credential) { (user, error) in
            if error != nil {
                print("JESS: Unable to authenticate with Firebase - \(String(describing: error))")
            }else{
                print("JESS: Successfully authenticated with Firebase")
            }
        }
        
    }
}

