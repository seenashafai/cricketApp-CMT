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
    
   
    @IBAction func newGame(_ sender: Any)
    {
        //Clear DB
        ref?.setValue("null")
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        ref = Database.database().reference()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
