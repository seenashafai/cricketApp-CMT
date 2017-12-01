//
//  SelectBatterViewController.swift
//  cricketApp-CMT
//
//  Created by Seena Shafai on 25/11/2017.
//  Copyright © 2017 Seena Shafai. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class SelectBatterViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

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
    
    //MARK: - IBOutlets
    @IBOutlet weak var welcomeTextField: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    
    //UIPickerViewDelegate
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return teamArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        battingTeam = teamArray[row]

        if battingTeam == teamArray[0]
        {
            self.present(self.alerts.battingTeamAlert(), animated: true, completion: nil)
            battingTeam = ""
            bowlingTeam = ""
        }
        
        if battingTeam == teamArray[1]
        {
            battingTeam = homeTeam
            bowlingTeam = awayTeam
        }
        
        if battingTeam == teamArray[2]
        {
            battingTeam = awayTeam
            bowlingTeam = homeTeam
        }
        
        let bowlingRef = ref?.child("currentSession").child("bowlingTeam")
        bowlingRef?.setValue(bowlingTeam)
        
        let battingRef = ref?.child("currentSession").child("battingTeam")
        battingRef?.setValue(battingTeam)
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return teamArray[row]
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        defineText()
        
        //Firebase
        ref = Database.database().reference()
        
        //Create reference to Database Location
        let gameIDRef = ref?.child("currentSession")
        
        // Setup Firebase Game ID Listener
        gameIDRef?.observeSingleEvent(of: .value, with: {(snapshot) in
            
            //Retrieve Game ID
            let setupDict = snapshot.value as? [String : AnyObject] ?? [:]
            self.gameID = (setupDict["gameID"] as! String)
            self.homeTeam = (setupDict["homeTeam"] as! String)
            self.awayTeam = (setupDict["awayTeam"] as! String)
            self.preparePickerView()
        })
    }
    
    private func defineText()
    {
        
        welcomeTextField.lineBreakMode = .byWordWrapping
        welcomeTextField.numberOfLines = 0
        let text = "Who will bat first?"
        welcomeTextField.text = text
    }
    
    private func preparePickerView()
    {
        self.teamArray.append("Select Batting Team...")
        self.teamArray.append(self.homeTeam!)
        self.teamArray.append(self.awayTeam!)
        self.pickerView.reloadAllComponents()
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool
    {
        if identifier == "pickerSegue"
        {
            if battingTeam != homeTeam
            {
                print("poo2")
                if battingTeam != awayTeam
                {
                    print("poo3")
                    self.present(self.alerts.battingTeamAlert(), animated: true, completion: nil)
                    return false
                }
            }
        }
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
