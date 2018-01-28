//
// SignInViewController.swift
//  Snapchat
//
//  Created by Dan Waseen on 1/22/18.
//  Copyright © 2018 RevWon. All rights reserved........
//

import UIKit
import FirebaseCore
import FirebaseAuth
import FirebaseDatabase


class SignInViewController: UIViewController {
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
   //     FIRDatabase.database().reference().child("Hello").setValue("I am Cool")
        
    }
    
    
    @IBAction func turnupTapped(_ sender: Any) {
        FIRAuth.auth()?.signIn(withEmail: emailTextField.text!, password: passwordTextField.text!, completion: { (user, error) in
            print("We tried to sign in")
            
            if error != nil{
                
                 print("We have error:\(error!)")
                
                 FIRAuth.auth()?.createUser(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!, completion: { (user, error) in
                    
                    print("Tried to create user")
                    if error != nil {
                       print("We have error:\(error!)")
                        
                    }else{
                        
                      print("Created New User!")

                        
                        self.performSegue(withIdentifier: "signinsegue", sender: nil)
                    }
                })
                
            } else{
                print("Signed in succesfully")
                let users = FIRDatabase.database().reference().child("users").child(user!.uid).child("email").setValue(user!.email!)
                self.performSegue(withIdentifier: "signinsegue", sender: nil)
            }
        })
        
    }
}

