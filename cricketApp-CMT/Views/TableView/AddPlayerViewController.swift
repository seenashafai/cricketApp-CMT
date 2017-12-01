//
//  MasterTableViewController.swift
//  cricketApp-CMT
//
//  Created by Seena Shafai on 20/10/2017.
//  Copyright © 2017 Seena Shafai. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class MasterTableViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate {
    
    //MARK: - Properties
    var players: PlayerClass?
    var playerFaced: String? = "2"
    var playerRuns: String? = "20"
    var playerStatus: Status? = .notOut
    var playerOutMethod: Out? = .timeOut
    
    
    //Firebase
    var ref: DatabaseReference?

    //MARK: - IBOutlets
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var blockTextField: UITextField!
    
    
    //UIBarButton Items
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBAction func saveAction(_ sender: Any)
    {
        
        let playerMetaDict = ["block": blockTextField.text, "playername": nameTextField.text] as [String: AnyObject]
        let playerStatsDict = ["faced": playerFaced, "runs": playerRuns, "status": playerStatus?.description, "outmethod": playerOutMethod?.description] as [String : AnyObject]
        ref?.child("players").child(nameTextField.text!).child("meta").setValue(playerMetaDict)
        ref?.child("players").child(nameTextField.text!).child("stats").setValue(playerStatsDict)

        ref?.child("playernames").childByAutoId().setValue(nameTextField.text)
        navigationController?.popToRootViewController(animated: true)
    }
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //Firebase
        ref = Database.database().reference()
        
        // Handle the text field’s user input through delegate callbacks.
        nameTextField.delegate = self
        blockTextField.delegate = self

        // Enable save button only when text field is validated
        updateSaveButtonState()
    }
    
    //MARK: - UITextFieldDelegate
    
    func textFieldDidBeginEditing(_ textField: UITextField)
    {
        // Disable the Save button while editing.
        saveButton.isEnabled = false
        nameTextField.autocorrectionType = .no
        blockTextField.autocorrectionType = .no
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        // Hide the keyboard.
        nameTextField.resignFirstResponder()
        blockTextField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField)
    {
        updateSaveButtonState()
        navigationItem.title = nameTextField.text
    }
    
    //Dismiss keyboard on touch away
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        updateSaveButtonState()
        nameTextField.resignFirstResponder()
        blockTextField.resignFirstResponder()
    }
    
    //MARK: - Validation
    
    //Presence Check
    
    private func updateSaveButtonState()
    {
        // Disable the Save button if the text field is empty.
        let text = nameTextField.text ?? ""
        saveButton.isEnabled = !text.isEmpty
    }


}
