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

class SignupViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: - IBOutlets
    @IBOutlet weak var inputEmail: UITextField!
    @IBOutlet weak var inputPassword: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    
    //MARK: - Class definitions
    var alerts = alertClass()
    
    //MARK: - Signup function
    @IBAction func signupNow(_ sender: UIButton)
    {
        let isEqual: Bool = (inputPassword.text == confirmPassword.text)
        if inputEmail.text != "" || inputPassword.text != ""
        {
            if isEqual == true
            {
                //Firebase Authentication
                Auth.auth().createUser(withEmail: inputEmail.text!, password: inputPassword.text!) { (user, error) in
                if user != nil
                {
                    // Sign up Successful
                    self.present(self.alerts.signupAlert(), animated: true, completion: nil)
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
    
    //Back Button
    @IBAction func backButton(_ sender: Any)
    {
        //Dismiss view controller
        dismiss(animated: true, completion: nil)
    }
    
    
    //MARK: - UITextFieldDelegate
    //Keyboard Dismissals
    
    //Dismiss keyboard on 'done'
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        inputEmail.resignFirstResponder()
        inputPassword.resignFirstResponder()
        confirmPassword.resignFirstResponder()
        return true
    }
    
    //Dismiss keyboard on touch away
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        inputEmail.resignFirstResponder()
        inputPassword.resignFirstResponder()
        confirmPassword.resignFirstResponder()
    }

    //MARK: - View cycle
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }

}
