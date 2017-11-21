//
//  ScoreSheetViewController.swift
//  cricketApp-CMT
//
//  Created by Seena Shafai on 11/11/2017.
//  Copyright © 2017 Seena Shafai. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class ScoreSheetViewController: UIViewController {
    
    //MARK: - Properties
    var gameID: String = ""
    var inningsCounter: Int = 0
    var oversCounter: Int = 0
    var ballIndex: Int? = 0
    var ballNumber: Int? = 0
    var maxInnings: Int? = 0
    var maxOvers: Int? = 0

    var alerts = alertClass()
    
    //Firebase
    var ref: DatabaseReference?
    var handle: DatabaseHandle?
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var completedView: UIView!
    
    @IBOutlet weak var inningsFallbackOutlet: UIButton!
    @IBAction func inningsFallback(_ sender: Any)
    {
        self.present(self.alerts.maxInningsAlert(), animated: true, completion: nil)

        print("produce alert")
    }
    
    
    @IBOutlet weak var oversFallBackOutlet: UIButton!
    @IBAction func oversFallBack(_ sender: Any)
    {
        self.present(self.alerts.maxOversAlert(), animated: true, completion: nil)
        print("produce alert")
    }
    @IBOutlet weak var endGameOutlet: UIButton!
    @IBAction func endGame(_ sender: Any)
    {
        ballView.isHidden = true
        completedView.isHidden = false
    }
    
    
    //Ball Score Labels
    @IBOutlet weak var ball1Score: UILabel!
    @IBOutlet weak var ball2Score: UILabel!
    @IBOutlet weak var ball3Score: UILabel!
    @IBOutlet weak var ball4Score: UILabel!
    @IBOutlet weak var ball5Score: UILabel!
    @IBOutlet weak var ball6Score: UILabel!
    
    //Ball buttons
    @IBOutlet weak var ball1Outlet: UIButton!
    @IBOutlet weak var ball2Outlet: UIButton!
    @IBOutlet weak var ball3Outlet: UIButton!
    @IBOutlet weak var ball4Outlet: UIButton!
    @IBOutlet weak var ball5Outlet: UIButton!
    @IBOutlet weak var ball6Outlet: UIButton!
    
    //Sub-View
    @IBOutlet weak var ballView: UIView!
    
    //Overs/Innings labels
    @IBOutlet weak var overNumberLabel: UILabel!
    @IBOutlet weak var inningsNumberLabel: UILabel!
    
    
    //MARK: - IBActions
    
    //Ball actions
    @IBAction func ball1Action(_ sender: Any) {
        ballIndex = ballIndex! + 1
        ballNumber = 1
        ref?.child("currentSession").child("currentBall").setValue(ballNumber)
    }
    

    @IBAction func ball2Action(_ sender: Any) {
        ballIndex = ballIndex! + 1
        ballNumber = 2
        ref?.child("currentSession").child("currentBall").setValue(ballNumber)
    }
    
    @IBAction func ball3Action(_ sender: Any) {
        ballIndex = ballIndex! + 1
        ballNumber = 3
        ref?.child("currentSession").child("currentBall").setValue(ballNumber)
    }
    
    @IBAction func ball4Action(_ sender: Any) {
        ballIndex = ballIndex! + 1
        ballNumber = 4
        ref?.child("currentSession").child("currentBall").setValue(ballNumber)
    }
    
    @IBAction func ball5Action(_ sender: Any) {
        ballIndex = ballIndex! + 1
        ballNumber = 5
        ref?.child("currentSession").child("currentBall").setValue(ballNumber)
    }
    
    @IBAction func ball6Action(_ sender: Any) {
        ballIndex = ballIndex! + 1
        ballNumber = 6
        ref?.child("currentSession").child("currentBall").setValue(ballNumber)
    }
    
    @IBOutlet weak var inningsOutlet: UIButton!
    @IBOutlet weak var newOverOutlet: UIButton!
    @IBAction func beginInningsButton(_ sender: Any) {
        
        inningsCounter = inningsCounter + 1
        oversCounter = 0
        inningsNumberLabel.text = ("Inning:" + String(inningsCounter) + "/" + String(describing: maxInnings!))
        inningsNumberLabel.isHidden = false
        newOverOutlet.isEnabled = true
        oversFallBackOutlet.isHidden = true
        
        if inningsCounter >= maxInnings!
        {
            inningsOutlet.isEnabled = false
            inningsFallbackOutlet.isHidden = false
        }
        

        
        //Unhide items
        newOverOutlet.isHidden = false
        ballView.isHidden = false
        
        //Hide items
        ball1Outlet.isHidden = true
        ball2Outlet.isHidden = true
        ball3Outlet.isHidden = true
        ball4Outlet.isHidden = true
        ball5Outlet.isHidden = true
        ball6Outlet.isHidden = true
        
        //Add items to database
        ref?.child("currentSession").child("currentInnings").setValue(inningsCounter)
        ref?.child("games").child(gameID).child("stats").child("innings"+(String(inningsCounter))).setValue("innings"+(String(inningsCounter)))
    }
    
    @IBAction func newOver(_ sender: Any) {
        
        oversCounter = oversCounter + 1
        overNumberLabel.text = ("Over:" + String(oversCounter) + "/" + String(describing: maxOvers!))
        overNumberLabel.isHidden = false
        
        if oversCounter >= maxOvers!
        {
            newOverOutlet.isEnabled = false
            oversFallBackOutlet.isHidden = false
        }
        
        if oversCounter == maxOvers! && inningsCounter == maxInnings
        {
            endGameOutlet.isHidden = false
        }
        
        newOverOutlet.setTitle("Next Over", for: .normal)
        
        ball1Outlet.isHidden = false
        ball2Outlet.isHidden = false
        ball3Outlet.isHidden = false
        ball4Outlet.isHidden = false
        ball5Outlet.isHidden = false
        ball6Outlet.isHidden = false
        
        ref?.child("currentSession").child("currentOver").setValue(oversCounter)
        ref?.child("games").child(gameID).child("stats").child("innings"+(String(inningsCounter))).child("over"+(String(oversCounter))).child("ball1").setValue(String(0))
        ref?.child("games").child(gameID).child("stats").child("innings"+(String(inningsCounter))).child("over"+(String(oversCounter))).child("ball2").setValue(String(0))
        ref?.child("games").child(gameID).child("stats").child("innings"+(String(inningsCounter))).child("over"+(String(oversCounter))).child("ball3").setValue(String(0))
        ref?.child("games").child(gameID).child("stats").child("innings"+(String(inningsCounter))).child("over"+(String(oversCounter))).child("ball4").setValue(String(0))
        ref?.child("games").child(gameID).child("stats").child("innings"+(String(inningsCounter))).child("over"+(String(oversCounter))).child("ball5").setValue(String(0))
        ref?.child("games").child(gameID).child("stats").child("innings"+(String(inningsCounter))).child("over"+(String(oversCounter))).child("ball6").setValue(String(0))

        let ballScoresRef = ref?.child("games").child(gameID).child("stats").child("innings"+(String(inningsCounter))).child("over"+(String(oversCounter)))

        // Setup Firebase Database Listener
        handle = ballScoresRef?.observe(DataEventType.value, with: { (snapshot) in
            
            //Retrieve Ball Scores
            let ballDict = snapshot.value as? [String : AnyObject] ?? [:]
            self.ball1Score.text = String(ballDict["ball1"] as! String)
            self.ball2Score.text = String(ballDict["ball2"] as! String)
            self.ball3Score.text = String(ballDict["ball3"] as! String)
            self.ball4Score.text = String(ballDict["ball4"] as! String)
            self.ball5Score.text = String(ballDict["ball5"] as! String)
            self.ball6Score.text = String(ballDict["ball6"] as! String)

            print(ballDict)
            
            
        })

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: - isHidden

        //Hide Navigation Bar back button
        self.navigationItem.setHidesBackButton(true, animated:true);
        
        endGameOutlet.isHidden = true
        inningsFallbackOutlet.isHidden = true
        oversFallBackOutlet.isHidden = true
        
        completedView.isHidden = true
        ballView.isHidden = true
        newOverOutlet.isHidden = true
        inningsNumberLabel.isHidden = true
        overNumberLabel.isHidden = true
        
        //Hide ball buttons
        ball1Outlet.isHidden = true
        ball2Outlet.isHidden = true
        ball3Outlet.isHidden = true
        ball4Outlet.isHidden = true
        ball5Outlet.isHidden = true
        ball6Outlet.isHidden = true


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

        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated

    }
}
