//
//  GameSetupViewController.swift
//  cricketApp-CMT
//
//  Created by Seena Shafai on 11/11/2017.
//  Copyright © 2017 Seena Shafai. All rights reserved.
//

import UIKit

class GameSetupViewController: UIViewController, UITextFieldDelegate {
    
    var gameDataArray = [Game]()
    var game: Game?
    
    var gameID: String = ""
    var innings: Int = 0
    var overs: Int = 0
    var newGame = Game()
    
    @IBOutlet weak var gameIDTextField: UITextField!
    
    @IBOutlet weak var inningsTextField: UITextField!
    
    @IBOutlet weak var oversTextField: UITextField!

    @IBOutlet weak var saveButton: UIBarButtonItem!
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Handle the text field’s user input through delegate callbacks.
        gameIDTextField.delegate = self
        
        self.gameIDTextField.text = gameID

        // Enable save button only when text field is validated
        updateSaveButtonState()
 

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        super.prepare(for: segue, sender: sender)
        
        let newGame = Game()
        newGame.GameMeta.gameID = gameID
        newGame.GameStats.innings = innings
        newGame.GameStats.overs = overs
        
        gameDataArray.append(newGame)
        
        guard let button = sender as? UIBarButtonItem, button == saveButton else
        {
            print("Save button was not pressed")
            return
        }
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
        gameIDTextField.resignFirstResponder()
        inningsTextField.resignFirstResponder()
        oversTextField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField)
    {
        updateSaveButtonState()
        navigationItem.title = gameIDTextField.text
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Private Methods
    
    private func updateSaveButtonState()
    {
        // Disable the Save button if the text field is empty.
        let gameIDText = gameIDTextField.text ?? ""
        
        saveButton.isEnabled = !gameIDText.isEmpty

    }

   
}
