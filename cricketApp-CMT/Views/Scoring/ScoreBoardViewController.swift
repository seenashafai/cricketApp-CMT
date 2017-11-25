//
//  ScoreBoardViewController.swift
//  cricketApp-CMT
//
//  Created by Seena Shafai on 11/11/2017.
//  Copyright © 2017 Seena Shafai. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class ScoreBoardViewController: UIViewController {

    //MARK: - Properties
    var gameID: String? = ""
    var maxInnings: Int? = 0
    var maxOvers: Int? = 0
    
    //Firebase
    var ref: DatabaseReference?
    var handle: DatabaseHandle?
    
    //MARK: - IBOutlets
    @IBOutlet weak var homeTeamLabel: UILabel!
    @IBOutlet weak var homeTeamName: UILabel!
    @IBOutlet weak var homeTeamRuns: UILabel!
    
    @IBOutlet weak var awayTeamLabel: UILabel!
    @IBOutlet weak var awayTeamName: UILabel!
    @IBOutlet weak var awayTeamRuns: UILabel!
    
    @IBOutlet weak var currentBatsmanLabel: UILabel!
    @IBOutlet weak var currentBowlerLabel: UILabel!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        //Firebase
        ref = Database.database().reference()
        
        let gameIDRef = ref?.child("currentSession")
        
        // Setup Firebase Game ID Listener
        handle = gameIDRef?.observe(DataEventType.value, with: { (snapshot) in
            
            //Retrieve Game ID
            let setupDict = snapshot.value as? [String : AnyObject] ?? [:]
            self.gameID = (setupDict["gameID"] as! String)
            self.maxInnings = (setupDict["innings"] as! Int)
            self.maxOvers = (setupDict["overs"] as! Int)
            print(self.gameID)
        })
        
        //Hide back button on Navigation Bar
        self.navigationItem.setHidesBackButton(true, animated:true);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
