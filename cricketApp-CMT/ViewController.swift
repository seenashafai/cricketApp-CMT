//
//  ViewController.swift
//  cricketApp-CMT
//
//  Created by Seena Shafai on 17/10/2017.
//  Copyright © 2017 Seena Shafai. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth

class ViewController: UIViewController, UITextFieldDelegate {
    
    var ref: DatabaseReference!
    
    @IBOutlet weak var inputEmail: UITextField!
    @IBOutlet weak var inputPassword: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    @IBAction func loginNow(_ sender: Any)
    {
        if inputEmail.text != "" || inputPassword.text != ""
        {
            Auth.auth().signIn(withEmail: inputEmail.text!, password: inputPassword.text!) { (user, error) in
                if user != nil
                {
                    // Sign in Successful
                    print("Sign in successful")
                    self.performSegue(withIdentifier: "segue", sender: self)
                }
                else
                {
                    if let myError = error?.localizedDescription
                    {
                        print(myError)
                    }
                    else
                    {
                        print("ERROR")
                    }
                }
            }
        }
    }
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        inputEmail.resignFirstResponder()
        inputPassword.resignFirstResponder()
        return true
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        inputEmail.resignFirstResponder()
        inputPassword.resignFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

