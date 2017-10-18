//
//  SignupViewController.swift
//  cricketApp-CMT
//
//  Created by Seena Shafai on 18/10/2017.
//  Copyright © 2017 Seena Shafai. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth




class SignupViewController: UIViewController {
    
    @IBOutlet weak var inputEmail: UITextField!
    @IBOutlet weak var inputPassword: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    
    @IBAction func signupNow(_ sender: UIButton)
    {
        var passMatch = true
        if self.inputPassword != self.confirmPassword
        {
            // Passwords do not match
            print("Passwords do not match")
            passMatch = false
            
        }
        if inputEmail.text != "" || inputPassword.text != ""
        {
            if passMatch == true
            {
            Auth.auth().createUser(withEmail: inputEmail.text!, password: inputPassword.text!) { (user, error) in
                if user != nil
                {
                    // Sign up Successful
                    self.performSegue(withIdentifier: "segue", sender: self)
                    print("Register successful")
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
}

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
