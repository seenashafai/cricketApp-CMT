//
//  DetailsViewController.swift
//  cricketApp-CMT
//
//  Created by Seena Shafai on 08/11/2017.
//  Copyright © 2017 Seena Shafai. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class DetailsViewController: UIViewController {
    
    //MARK: - Properties
    var indexPath: Int? = 0
    
    var playerName: String? = ""

    
    //Firebase
    var ref: DatabaseReference?
    

    //MARK: - IBOutlets
    @IBOutlet weak var playerNameLabel: UILabel!
    
    @IBOutlet weak var playerBlockLabel: UILabel!
    
    @IBOutlet weak var playerRunsLabel: UILabel!
    
    @IBOutlet weak var playerFacedLabel: UILabel!
    
    @IBOutlet weak var playerStatus: UILabel!
    
    @IBOutlet weak var playerOutsMethod: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        //Firebase Initialization
        ref = Database.database().reference()
        
        print(indexPath)
        print(playerName)
        
        
    }


}
