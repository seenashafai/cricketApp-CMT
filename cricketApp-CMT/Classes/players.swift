//
//  players.swift
//  cricketApp-CMT
//
//  Created by Seena Shafai on 18/10/2017.
//  Copyright © 2017 Seena Shafai. All rights reserved.
//

import Foundation
import UIKit

class playerClass {
    
    //var id: String?
    
    var name: String?
    //var block: String?
    //var photo: UIImage?
    
    /*
    var runs: Int?
    var faced: Int?
    var wickets: Int?
    var bowled: Int?
    var runRate: Int?
 */
    
    init?(name: String?)
    {
        guard !((name?.isEmpty)!) else
        {
            return nil
        }
        
        // Initialize stored properties.
        self.name = name
        //self.photo = photo
        //self.block = block
    }
    
}
