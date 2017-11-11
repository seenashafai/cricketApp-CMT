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
    
    @IBAction func logOut(_ sender: UIButton)
    {
        try! Auth.auth().signOut()
        performSegue(withIdentifier: "segue2", sender: self)
    }
    

    
    
    
    //MARK: - View cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(Auth.auth().currentUser?.email as Any)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
