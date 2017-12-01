//
//  secondViewController.swift
//  cricketApp-CMT
//
//  Created by Seena Shafai on 17/10/2017.
//  Copyright © 2017 Seena Shafai. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class secondViewController: UIViewController {
    
    //MARK: - IBActions
    
    
    //Logout Function
    @IBAction func logOut(_ sender: UIButton)
    {
        try! Auth.auth().signOut()
        //Perform Segue back to Sign-in view
        performSegue(withIdentifier: "segue2", sender: self)
    }
    

    //MARK: - View cycle
    override func viewDidLoad()
    {
        super.viewDidLoad()
        //Print current user to console
        print(Auth.auth().currentUser?.email as Any)
    }

}
