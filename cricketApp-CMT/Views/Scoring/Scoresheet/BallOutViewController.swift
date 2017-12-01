//
//  BallOutViewController.swift
//  cricketApp-CMT
//
//  Created by Seena Shafai on 12/11/2017.
//  Copyright © 2017 Seena Shafai. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class BallOutViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    //MARK: - Properties
    var player: PlayerClass?
    var outMethod: Out?
    
    
    var gameID: String? = ""
    var inningsCounter: Int? = 0
    var oversCounter: Int? = 0
    var ballsCounter: Int? = 0
    var name: String? = "gareth"
    var battingTeam: String? = ""
    
    //Firebase
    var ref: DatabaseReference?
    var handle: DatabaseHandle?
    
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBAction func saveButton(_ sender: Any)
    {
        let runsRef = ref?.child("games").child(gameID!).child(battingTeam!).child("stats").child("innings"+(String(describing: inningsCounter!))).child("over"+(String(describing: oversCounter!))).child("ball" + String(describing: ballsCounter!))
        
        let outRef = ref?.child("games").child(gameID!).child(battingTeam!).child("stats").child("innings"+(String(describing: inningsCounter!))).child("over"+(String(describing: oversCounter!))).child("details" + String(describing: ballsCounter!))
        

        let outDict = ["playerOutName": name!, "outMethod": outMethod?.description as Any] as [String : AnyObject]

        
        runsRef?.setValue("out")
        outRef?.setValue(outDict)
        navigationController?.popViewController(animated: true)
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return Out(rawValue: row)?.description;
    }
        
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
            return Out.count.hashValue
    }
    
 
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        outMethod = Out(rawValue: row)!
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()

        let gameDetailsRef = ref?.child("currentSession")
        
        // Setup Firebase Database Listener
        handle = gameDetailsRef?.observe(DataEventType.value, with: { (snapshot) in
            
            //Retrieve Game Details
            let gameDetailsDict = snapshot.value as? [String : AnyObject] ?? [:]
            self.gameID = (gameDetailsDict["gameID"] as! String)
            self.battingTeam = (gameDetailsDict["battingTeam"] as! String)
            self.inningsCounter = (gameDetailsDict["currentInnings"] as! Int)
            self.oversCounter = (gameDetailsDict["currentOver"] as! Int)
            self.ballsCounter = (gameDetailsDict["currentBall"] as! Int)
            
            
        })
        
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    

}
