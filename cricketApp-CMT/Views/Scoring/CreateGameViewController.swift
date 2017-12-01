//
//  CreateGameViewController.swift
//  cricketApp-CMT
//
//  Created by Seena Shafai on 15/11/2017.
//  Copyright © 2017 Seena Shafai. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class CreateGameViewController: UIViewController {

    //MARK: - Properties
    
    //Firebase
    var ref: DatabaseReference?
    
    //MARK: - IBActions
   
    //New Game Button
    @IBAction func newGame(_ sender: Any)
    {
        //Clear DB
        ref?.setValue("null")
    }
    
    //Back Button
    @IBAction func backButton(_ sender: Any)
    {
        //Dismiss view controller
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //Create Firebase Reference
        ref = Database.database().reference()
    }
}
