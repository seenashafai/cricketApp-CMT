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

class GameHubViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    
    var ref: DatabaseReference?
    var handle: DatabaseHandle?
    
    var gameID: String? = ""
    var homeTeam: String? = ""
    var awayTeam: String? = ""
    var battingTeam: String? = ""
    var bowlingTeam: String? = ""
    var teamArray = [String]()
    
    @IBOutlet weak var welcomeTextField: UILabel!
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return teamArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        battingTeam = teamArray[row]
        
        let battingRef = ref?.child("currentSession").child("battingTeam")
        
        print(teamArray)
        
        
        battingRef?.setValue(battingTeam)
        
        if battingTeam == teamArray[0]{
            battingTeam = homeTeam
            bowlingTeam = awayTeam
            print("willy")
        }
        else {
            battingTeam = awayTeam
            bowlingTeam = homeTeam
            print("bum")
        }
        
        let bowlingRef = ref?.child("currentSession").child("bowlingTeam")
        
        bowlingRef?.setValue(bowlingTeam)

        print(battingTeam)
        print(bowlingTeam)
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return teamArray[row]
    }
    
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //Hide back button on Navigation bar
        self.tabBarController?.navigationItem.hidesBackButton = true


    }
    
    override func viewDidLoad()
    
    {
        
        print("poo")
        defineText()
        
        //Firebase
        ref = Database.database().reference()
        
        let gameIDRef = ref?.child("currentSession")
        
        // Setup Firebase Game ID Listener
        gameIDRef?.observeSingleEvent(of: .value, with: { (snapshot) in
            
            print("poop")
            //Retrieve Game ID
            let setupDict = snapshot.value as? [String : AnyObject] ?? [:]
            self.gameID = (setupDict["gameID"] as! String)
            self.homeTeam = (setupDict["homeTeam"] as! String)
            self.awayTeam = (setupDict["awayTeam"] as! String)
            self.preparePickerView()
        })

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func defineText() {
        
        welcomeTextField.lineBreakMode = .byWordWrapping
        welcomeTextField.numberOfLines = 0
        
        let text = "Who will bat first?"
        
        welcomeTextField.text = text
        
    }
    
    private func preparePickerView() {
        
        self.teamArray.append(self.homeTeam!)
        self.teamArray.append(self.awayTeam!)
        self.pickerView.reloadAllComponents()
        
    }

}
