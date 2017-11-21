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
    
    //Firebase
    var ref: DatabaseReference?

    
    //MARK: - IBOutlets
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var blockTextField: UITextField!
    @IBOutlet weak var facedTextField: UITextField!
    @IBOutlet weak var runsTextField: UITextField!
    @IBOutlet weak var statusTextField: UITextField!
    @IBOutlet weak var playerOutMethod: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    
    //MARK: UIBarButton Items
    
    @IBAction func cancel(_ sender: UIBarButtonItem)
    {
        dismiss(animated: true, completion: nil)
    }
    

    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //Firebase
        ref = Database.database().reference()
        
        // Handle the text field’s user input through delegate callbacks.
        nameTextField.delegate = self

        // Enable save button only when text field is validated
        updateSaveButtonState()
    }
    
    //MARK: - UITextFieldDelegate
    
    func textFieldDidBeginEditing(_ textField: UITextField)
    {
        // Disable the Save button while editing.
        saveButton.isEnabled = false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        // Hide the keyboard.
        nameTextField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField)
    {
        updateSaveButtonState()
        navigationItem.title = nameTextField.text
    }
    
    
    //MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        super.prepare(for: segue, sender: sender)
        
        let playerMetaDict = ["block": blockTextField.text, "playername": nameTextField.text]
        let playerStatsDict = ["faced": facedTextField.text, "outmethod": playerOutMethod.text, "runs": runsTextField.text, "status": statusTextField.text]
        
        ref?.child("players").child(nameTextField.text!).child("meta").setValue(playerMetaDict)
        ref?.child("players").child(nameTextField.text!).child("stats").setValue(playerStatsDict)

        ref?.child("playernames").childByAutoId().setValue(nameTextField.text)
        
        guard let button = sender as? UIBarButtonItem, button == saveButton else
        {
            print("Save button was not pressed")
            return
        }
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
