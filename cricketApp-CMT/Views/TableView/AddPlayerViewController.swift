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

class MasterTableViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate {
    
    //MARK: - Properties
    
    var players: PlayerClass?
    
    var nameLabel: String = ""
    var blockLabel: String = ""
    var runsLabel: Int = 0
    var facedLabel: Int = 0
    var statusLabel: Status = .notOut
    var outMethod: Out = .notOut
    var newPlayer = PlayerClass()
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var blockTextField: UITextField!
    
    @IBOutlet weak var facedTextField: UITextField!
    
    @IBOutlet weak var runsTextField: UITextField!
    
    @IBOutlet weak var statusTextField: UITextField!
    
    @IBOutlet weak var playerOutMethod: UITextField!
    
    
    
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    

    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Handle the text field’s user input through delegate callbacks.
        nameTextField.delegate = self

        // Enable save button only when text field is validated
        updateSaveButtonState()
        
        self.nameTextField.text = nameLabel
        self.blockTextField.text = blockLabel
        self.runsTextField.text = String(runsLabel)
        self.facedTextField.text = String(facedLabel)
        self.statusTextField.text = statusLabel.description
        self.playerOutMethod.text = outMethod.description
        
        let newPlayer = PlayerClass()
        newPlayer.meta.playerName = nameLabel
        newPlayer.meta.block = blockLabel
        newPlayer.stats.faced = facedLabel
        newPlayer.stats.runs = runsLabel
        newPlayer.stats.status = statusLabel
        newPlayer.stats.outMethod = outMethod
        
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
        

        newPlayer.meta.playerName = nameLabel
        newPlayer.meta.block = blockLabel
        newPlayer.stats.faced = facedLabel
        newPlayer.stats.runs = runsLabel
        newPlayer.stats.status = statusLabel
        newPlayer.stats.outMethod = outMethod
        
        
        guard let button = sender as? UIBarButtonItem, button == saveButton else
        {
            print("Save button was not pressed")
            return
        }
    }

    

    //MARK: Private Methods
    
    private func updateSaveButtonState()
    {
        // Disable the Save button if the text field is empty.
        let text = nameTextField.text ?? ""
        saveButton.isEnabled = !text.isEmpty
    }

}
