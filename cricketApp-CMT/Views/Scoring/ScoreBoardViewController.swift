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
    var homeTeam: String? = ""
    var homeTeamScore: Int? = 0
    var awayTeam: String? = ""
    var awayTeamScore: Int? = 0
    
    //Firebase
    var ref: DatabaseReference?
    var handle: DatabaseHandle?
    
    //MARK: - IBOutlets
    @IBOutlet weak var homeTeamName: UILabel!
    @IBOutlet weak var homeTeamRuns: UILabel!
    @IBOutlet weak var homeTeamIndicator: UIButton!
    
    @IBOutlet weak var awayTeamName: UILabel!
    @IBOutlet weak var awayTeamRuns: UILabel!
    @IBOutlet weak var awayTeamIndicator: UIButton!
    
    @IBOutlet weak var currentBatsmanLabel: UILabel!
    @IBOutlet weak var currentBowlerLabel: UILabel!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        homeTeamIndicator.isHidden = true
        awayTeamIndicator.isHidden = true
        
        //Firebase
        ref = Database.database().reference()
        
        let sessionRef = ref?.child("currentSession")
        
        // Setup Firebase Game ID Listener
        handle = sessionRef?.observe(DataEventType.value, with: { (snapshot) in
            
            //Retrieve Game ID
            let setupDict = snapshot.value as? [String : AnyObject] ?? [:]
            self.gameID = (setupDict["gameID"] as! String)
            self.retrieveGameStats()
        })
        
        //Hide back button on Navigation Bar
        self.navigationItem.setHidesBackButton(true, animated:true);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func retrieveGameStats()
    {
        print("retrieving stats...")
        let gameIDRef = ref?.child("games").child(gameID!)
        
        // Setup Firebase Game ID Listener
        handle = gameIDRef?.observe(DataEventType.value, with: { (snapshot) in
            
            //Retrieve Game ID
            let gameStatsDict = snapshot.value as? [String : AnyObject] ?? [:]
            self.awayTeam = (gameStatsDict["awayTeam"] as! String)
            self.homeTeam = (gameStatsDict["homeTeam"] as! String)
            self.homeTeam = (gameStatsDict["homeTeam"] as! String)

        })
    }

}
