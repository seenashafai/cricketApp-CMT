//
//  Alerts.swift
//  cricketApp-CMT
//
//  Created by Seena Shafai on 18/10/2017.
//  Copyright © 2017 Seena Shafai. All rights reserved.
//

import Foundation
import UIKit


class alertClass: UIAlertController {
    
    var VC: ScoreBoardViewController?
    
    func signupAlert() -> UIAlertController {
        let successAlert = UIAlertController(title: "Registration Successful", message: "Please now login using your new credentials", preferredStyle: .alert)
        let action1 = UIAlertAction(title: "Continue", style: .default) {(action) in
        }
        successAlert.addAction(action1)
        present(successAlert, animated: true, completion: nil)
        return successAlert
    }
    
    func maxInningsAlert() -> UIAlertController {
        let warningAlert = UIAlertController(title: "Error", message: "Game is complete, You cannot add any more innings", preferredStyle: .alert)
        let action1 = UIAlertAction(title: "Continue", style: .default) {(action) in
            
        }
        warningAlert.addAction(action1)
        present(warningAlert, animated: true, completion: nil)
        return warningAlert
        
    }
    
    func maxOversAlert() -> UIAlertController {
        let warningAlert = UIAlertController(title: "Error", message: "There are no more overs in this innings", preferredStyle: .alert)
        let action1 = UIAlertAction(title: "Continue", style: .default) {(action) in
            
        }
        warningAlert.addAction(action1)
        present(warningAlert, animated: true, completion: nil)
        return warningAlert
        
    }
    
    func battingTeamAlert() -> UIAlertController {
        let warningAlert = UIAlertController(title: "Error", message: "Please select the team which will bat first", preferredStyle: .alert)
        let action1 = UIAlertAction(title: "Continue", style: .default) {(action) in
            
        }
        warningAlert.addAction(action1)
        present(warningAlert, animated: true, completion: nil)
        return warningAlert
        
    }
    
    func playerCount() -> UIAlertController {
        let warningAlert = UIAlertController(title: "Error", message: "You have not added any players to the team sheet. Press continue to proceed without keeping record of player statistics", preferredStyle: .alert)
        let action1 = UIAlertAction(title: "Continue", style: .destructive) {(action) in
        }
        let action2 = UIAlertAction(title: "Team sheet", style: .default) {(action) in
            self.toTeamSheet()
        }
        warningAlert.addAction(action1)
        warningAlert.addAction(action2)
        present(warningAlert, animated: true, completion: nil)
        return warningAlert
        
    }
    
    func toTeamSheet() {
        VC?.tabBarController?.selectedIndex = 3
        print("toTeamSheet")
    }
    
}
