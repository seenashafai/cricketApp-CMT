//
//  GameHubViewController.swift
//  cricketApp-CMT
//
//  Created by Seena Shafai on 15/11/2017.
//  Copyright © 2017 Seena Shafai. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class GameHubViewController: UIViewController, UITabBarControllerDelegate {
    
    //MARK: - Properties
    var alerts = alertClass()
    
    var gameID: String? = ""
    var homeTeam: String? = ""
    var awayTeam: String? = ""
    var battingTeam: String? = ""
    var bowlingTeam: String? = ""
    var teamArray = [String]()
    
    //Firebase
    var ref: DatabaseReference?
    var handle: DatabaseHandle?
    
    @IBAction func changeTab(_ sender: Any) {
        tabBarController?.selectedIndex = 4
        print("hello")
    }
    
    //MARK: I IBOutlets
    @IBOutlet weak var welcomeTextField: UILabel!
    
    override func viewDidLoad()
    {
        defineText()
        
        //Firebase
        ref = Database.database().reference()
        
        //Create reference to Database location
        let gameIDRef = ref?.child("currentSession")
        
        // Setup Firebase Game ID Listener
        gameIDRef?.observeSingleEvent(of: .value, with: { (snapshot) in
            
            print("poop")
            //Retrieve Game ID
            let setupDict = snapshot.value as? [String : AnyObject] ?? [:]
            self.gameID = (setupDict["gameID"] as! String)
            self.homeTeam = (setupDict["homeTeam"] as! String)
            self.awayTeam = (setupDict["awayTeam"] as! String)
        })

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func defineText() {
        
        welcomeTextField.lineBreakMode = .byWordWrapping
        welcomeTextField.numberOfLines = 0
        let text = "Welcome"
        welcomeTextField.text = text
        
    }


}
