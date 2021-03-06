//
//  GameSetupViewController.swift
//  cricketApp-CMT
//
//  Created by Seena Shafai on 11/11/2017.
//  Copyright © 2017 Seena Shafai. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class GameSetupViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: - Properties
    var game: Game?
    
    //MARK: - Firebase
    var ref: DatabaseReference?
    
    //MARK: -  IBOutlets
    @IBOutlet weak var gameIDTextField: UITextField!
    @IBOutlet weak var inningsTextField: UITextField!
    @IBOutlet weak var oversTextField: UITextField!
    @IBOutlet weak var homeTeamTextField: UITextField!
    @IBOutlet weak var awayTeamTextField: UITextField!
    
    @IBAction func gay(_ sender: Any) {
        loadData()
    }
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //Firebase
        ref = Database.database().reference()

        // Handle the text field’s user input through delegate callbacks.
        gameIDTextField.delegate = self
        homeTeamTextField.delegate = self
        awayTeamTextField.delegate = self
        inningsTextField.delegate = self
        oversTextField.delegate = self

        // Enable save button only when text field is validated
        updateSaveButtonState()
 
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        super.prepare(for: segue, sender: sender)
        
        let gameDict = ["gameID": gameIDTextField.text, "innings": Int(inningsTextField.text!), "overs": Int(oversTextField.text!), "homeTeam": homeTeamTextField.text, "awayTeam": awayTeamTextField.text, "playerCount": 0] as [String : Any]
        
        ref?.child("games").child(gameIDTextField.text!).setValue(gameDict)
        ref?.child("currentSession").setValue(gameDict)
    }

    @IBOutlet weak var navBar: UINavigationBar!
    
    
    //MARK: - UITextFieldDelegate
    
    func textFieldDidBeginEditing(_ textField: UITextField)
    {
        gameIDTextField.autocorrectionType = .no
        homeTeamTextField.autocorrectionType = .no
        awayTeamTextField.autocorrectionType = .no

    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        // Hide the keyboard.
        homeTeamTextField.resignFirstResponder()
        awayTeamTextField.resignFirstResponder()
        gameIDTextField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField)
    {
        updateSaveButtonState()
        navBar.topItem?.title = gameIDTextField.text
    }

    //Dismiss keyboard on touch away
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        updateSaveButtonState()
        inningsTextField.resignFirstResponder()
        oversTextField.resignFirstResponder()
    }

    
    //MARK: Private Methods
    
    private func updateSaveButtonState()
    {
        // Disable the Save button if the text field is empty.
        let gameIDtext = gameIDTextField.text ?? ""
        let inningsText = inningsTextField.text ?? ""
        let oversText = oversTextField.text ?? ""

        if gameIDtext.isEmpty || inningsText.isEmpty || oversText.isEmpty
        {
                saveButton.isEnabled = false
        }
        else
        {
            saveButton.isEnabled = true
            
        }
    }
    
    private func loadData()
    {
        gameIDTextField.text = "TestMatch"
        homeTeamTextField.text = "Eton"
        awayTeamTextField.text = "Harrow"
        inningsTextField.text = "2"
        oversTextField.text = "20"
    }
}
