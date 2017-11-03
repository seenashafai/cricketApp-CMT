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
import os.log

class MasterTableViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //MARK: - Properties
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var players: PlayerItem?
    var ref: DatabaseReference!
    var handle: DatabaseHandle!
    var playerEditArray = [String]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Handle the text field’s user input through delegate callbacks.
        nameTextField.delegate = self
        
        // Initialise Firebase Database
        ref = Database.database().reference()
        
        // Load existing database data
        handle = ref?.child("players").observe(.childAdded, with: { (snapshot) in
            
            if let item = snapshot.value as? String
            {
                self.playerEditArray.append(item)
            }
        })
        
        // Set up views if editing an existing player.
        if let players = players
        {
            // navigationItem.title =
            // nameTextField.text = 
        }
        
        // Enables save button only if the player name is valid
        updateSaveButtonState()
    }
    
    //MARK: - UITextFieldDelegate
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // Disable the Save button while editing.
        saveButton.isEnabled = false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateSaveButtonState()
        navigationItem.title = textField.text
    }
    
    // Decide direction of segue
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        
        let isPresentingInAddPlayerMode = presentingViewController is UINavigationController
        
        if isPresentingInAddPlayerMode {
            dismiss(animated: true, completion: nil)
        }
        else if let owningNavigationController = navigationController{
            owningNavigationController.popViewController(animated: true)
        }
        else {
            fatalError("The MasterTableViewController is not inside a navigation controller.")
        }
    }
    
    // Preparing for view change
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        super.prepare(for: segue, sender: sender)
        
        // Configure the destination view controller only when the save button is pressed.
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            if #available(iOS 10.0, *) {
                os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            } else {
                print("Error")
            }
            return
        }
        
        let name = nameTextField.text ?? ""

        
        // Set the meal to be passed to MealTableViewController after the unwind segue.
       //players = PlayerItem(snapshot: name)
    }
    

    
   

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    //MARK: Private Methods
    
    private func updateSaveButtonState() {
        // Disable the Save button if the text field is empty.
        let text = nameTextField.text ?? ""
        saveButton.isEnabled = !text.isEmpty
    }

}
