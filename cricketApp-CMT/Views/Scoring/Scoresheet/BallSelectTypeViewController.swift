//
//  BallSelectTypeViewController.swift
//  cricketApp-CMT
//
//  Created by Seena Shafai on 12/11/2017.
//  Copyright © 2017 Seena Shafai. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class BallSelectTypeViewController: UIViewController {
    
    var game: Game?
    
    //MARK: - Properties
    var gameID: String? = ""
    var currentInnings: Int? = 0
    var currentOver: Int? = 0
    var currentBall: Int? = 0
    var runs: String? = ""
    var inningsCounter: Int? = 0
    var oversCounter: Int? = 0
    var ballsCounter: Int? = 0
    var battingTeam: String? = ""
    
    //Firebase
    var ref: DatabaseReference?
    var ballScoresRef: DatabaseReference?
    var handle: DatabaseHandle?
    var runsHandle: DatabaseHandle?
    
    
    
    @IBAction func confirmButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    //MARK: - IBOutlets
    @IBOutlet weak var runsButton: UIButton!
    @IBOutlet weak var dotButton: UIButton!
    @IBOutlet weak var outButton: UIButton!
    
    @IBOutlet weak var runsLabel: UILabel!
    @IBOutlet weak var dotRunsLabel: UILabel!
    
    @IBOutlet weak var playerOutLabel: UILabel!
    @IBOutlet weak var outMethodLabel: UILabel!
    
    
    @IBAction func outButton(_ sender: Any)
    {
        playerOutLabel.isHidden = false
        outMethodLabel.isHidden = false
    }
    
    @IBAction func runsButton(_ sender: Any)
    {
        runsLabel.isHidden = true
        
        let runsRef = ref?.child("games").child(gameID!).child("stats").child("innings"+(String(describing: currentInnings!))).child("over"+(String(describing: currentOver!))).child("ball" + String(describing: currentBall!))
        
        runsHandle = runsRef?.observe(DataEventType.value, with: { (snapshot) in
            
            //Retrieve Details
            let runsItem = String(describing: snapshot.value as? Int)
            print(self.runs!)
            
            self.runs = runsItem

            print(self.runs!)
            
        })
    }
    
    @IBAction func dotClicked(_ sender: Any) {
        
        let runsRef = ref?.child("games").child(gameID!).child(battingTeam!).child("stats").child("innings"+(String(describing: currentInnings!))).child("over"+(String(describing: currentOver!))).child("ball" + String(describing: currentBall!))
        
        runsRef?.setValue(String(0))
    
        dotRunsLabel.text = String(0)
        dotRunsLabel.isHidden = false
        

        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        runsLabel.text = String(describing: runs!)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        runsLabel.isHidden = true
        dotRunsLabel.isHidden = true
        playerOutLabel.isHidden = true
        outMethodLabel.isHidden = true
        


        //Firebase
        ref = Database.database().reference()
        
        let gameIDRef = ref?.child("currentSession")
        
        // Setup Firebase Game ID Listener
        handle = gameIDRef?.observe(DataEventType.value, with: { (snapshot) in
            
            //Retrieve Details
            let gameIDDict = snapshot.value as? [String : AnyObject] ?? [:]
            print(gameIDDict)
            
            self.gameID = (gameIDDict["gameID"] as! String)
            self.battingTeam = (gameIDDict["battingTeam"] as! String)
            self.currentInnings = (gameIDDict["currentInnings"] as! Int)
            self.currentOver = (gameIDDict["currentOver"] as! Int)
            self.currentBall = (gameIDDict["currentBall"] as! Int)
            print(self.gameID!)
            print(self.currentInnings!)
            print(self.currentOver!)
            print(self.currentBall!)
            
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
