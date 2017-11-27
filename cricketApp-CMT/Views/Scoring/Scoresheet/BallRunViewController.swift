//
//  BallRunViewController.swift
//  cricketApp-CMT
//
//  Created by Seena Shafai on 12/11/2017.
//  Copyright © 2017 Seena Shafai. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class BallRunViewController: UIViewController {
    
    //MARK: - Properties
    var runs: Int? = 0
    var gameID: String? = ""
    var inningsCounter: Int? = 0
    var oversCounter: Int? = 0
    var ballsCounter: Int? = 0
    var battingTeam: String = ""
    
    var player: PlayerClass?
    
    //Firebase
    var ref: DatabaseReference?
    var handle: DatabaseHandle?
    
    @IBAction func saveButton(_ sender: Any) {
        
        
        let runsRef = ref?.child("games").child(gameID!).child(battingTeam).child("stats").child("innings"+(String(describing: inningsCounter!))).child("over"+(String(describing: oversCounter!))).child("ball" + String(describing: ballsCounter!))
        
        
        
        runsRef?.setValue(String(runTextField.text!))


        navigationController?.popViewController(animated: true)
        
        

    }
    
    @IBOutlet weak var runTextField: UITextField!
    
    @IBAction func runStepper(_ sender: UIStepper)
    {
        let counter = Int(sender.value).description
        runTextField.text = counter
        runs = Int(runTextField.text!)
        print(runs!)
    }
    
    @IBAction func fourButton(_ sender: Any)
    {
        runTextField.text = String(4)
        runs = 4
    }
    
    @IBAction func sixButton(_ sender: Any)
    {
        runTextField.text = String(6)
        runs = 6
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(runs!)
        
        ref = Database.database().reference()
        
        let gameDetailsRef = ref?.child("currentSession")
        
        // Setup Firebase Database Listener
        handle = gameDetailsRef?.observe(DataEventType.value, with: { (snapshot) in
            
            //Retrieve Game Details
            let gameDetailsDict = snapshot.value as? [String : AnyObject] ?? [:]
            print(gameDetailsDict)
            self.gameID = (gameDetailsDict["gameID"] as! String)
            self.battingTeam = (gameDetailsDict["battingTeam"] as! String)
            self.inningsCounter = (gameDetailsDict["currentInnings"] as! Int)
            self.oversCounter = (gameDetailsDict["currentOver"] as! Int)
            self.ballsCounter = (gameDetailsDict["currentBall"] as! Int)
            print("poo")

        
        })
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
