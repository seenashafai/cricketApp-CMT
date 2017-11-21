//
//  GameHubViewController.swift
//  cricketApp-CMT
//
//  Created by Seena Shafai on 15/11/2017.
//  Copyright © 2017 Seena Shafai. All rights reserved.
//

import UIKit

class GameHubViewController: UIViewController {

    @IBOutlet weak var welcomeTextField: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //Hide back button on Navigation bar
        self.tabBarController?.navigationItem.hidesBackButton = true
    }
    
    override func viewDidLoad()
    
    {
        super.viewDidLoad()
        
       
        welcomeTextField.lineBreakMode = .byWordWrapping
        welcomeTextField.numberOfLines = 0
        
        let text = "Welcome to the game hub, Use the tabs below to navigate through the different sections of this application"
        
        welcomeTextField.text = text

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   

}
