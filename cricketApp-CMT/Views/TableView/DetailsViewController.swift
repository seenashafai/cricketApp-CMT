//
//  DetailsViewController.swift
//  cricketApp-CMT
//
//  Created by Seena Shafai on 08/11/2017.
//  Copyright © 2017 Seena Shafai. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class DetailsViewController: UIViewController {
    
    //MARK: - Properties
    var playerName: String? = ""

    //Firebase
    var ref: DatabaseReference?
    var handle: DatabaseHandle?
    
    //MARK: - IBOutlets
    @IBOutlet weak var playerNameLabel: UILabel!
    @IBOutlet weak var playerBlockLabel: UILabel!
    @IBOutlet weak var playerRunsLabel: UILabel!
    @IBOutlet weak var playerFacedLabel: UILabel!
    @IBOutlet weak var playerStatus: UILabel!
    @IBOutlet weak var playerOutsMethod: UILabel!
    
    
    override func viewDidLoad()
    {
        print(playerName!)
        super.viewDidLoad()
  
        //Firebase Initialization
        ref = Database.database().reference()
        
        //Database References
        let metaRef = ref?.child("players").child(playerName!).child("meta")
        let statsRef = ref?.child("players").child(playerName!).child("stats")
        
        // Setup Firebase MetaData Listener
        handle = metaRef?.observe(DataEventType.value, with: { (snapshot) in
            
            //Load player metadata
            let metaDict = snapshot.value as? [String : AnyObject] ?? [:]
            
            print(metaDict)
            self.playerBlockLabel.text = (metaDict["block"] as! String)
            self.playerNameLabel.text = (metaDict["playername"] as! String)
        })
        
        //Setup Firebase StatsData Listener
        handle = statsRef?.observe(DataEventType.value, with: {(snapshot) in
            
            //Load player stats data
            let statsDict = snapshot.value as? [String: AnyObject] ?? [:]
            
            print(statsDict)
            self.playerFacedLabel.text = (statsDict["faced"] as! String)
            self.playerRunsLabel.text = (statsDict["runs"] as! String)
            self.playerOutsMethod.text = (statsDict["outmethod"] as! String)
            self.playerStatus.text = (statsDict["status"] as! String)
            
        })
    }

}

