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
    
    //MARK: - IBOutlets
    @IBOutlet weak var inputEmail: UITextField!
    @IBOutlet weak var inputPassword: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    //MARK: - IBOutlets
    
    //Login Function
    @IBAction func loginNow(_ sender: Any)
    {
        //Presence check for text fields
        if inputEmail.text != "" || inputPassword.text != ""
        {
            //Firebase Authentication
            Auth.auth().signIn(withEmail: inputEmail.text!, password: inputPassword.text!) { (user, error) in
                if user != nil
                {
                    // Sign in Successful
                    //Perform Segue to next view
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
   
    //MARK: - UITextFieldDelegate
    
    //Dismiss keyboard on 'Done'
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        inputEmail.resignFirstResponder()
        inputPassword.resignFirstResponder()
        return true
    }
    
    //Dismiss keyboard on touch away
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        inputEmail.resignFirstResponder()
        inputPassword.resignFirstResponder()
    }
    
    //MARK: View cycle
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
    }

}

