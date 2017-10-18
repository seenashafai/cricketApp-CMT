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
    
    func createAlert() -> UIAlertController {
        let successAlert = UIAlertController(title: "Registration Successful", message: "Please now login using your new credentials", preferredStyle: .alert)
        let action1 = UIAlertAction(title: "Cancel", style: .cancel) {(action) in
            print("This is action 1")
        }
        successAlert.addAction(action1)
        present(successAlert, animated: true, completion: nil)
        return successAlert
    }
}
