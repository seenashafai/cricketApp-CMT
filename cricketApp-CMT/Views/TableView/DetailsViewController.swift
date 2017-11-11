//
//  DetailsViewController.swift
//  cricketApp-CMT
//
//  Created by Seena Shafai on 08/11/2017.
//  Copyright © 2017 Seena Shafai. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    var player = PlayerClass()
    
    var nameLabel: String = ""
    var blockLabel: String = ""
    var runsLabel: Int = 0
    var facedLabel: Int = 0
    var status: Status = .notOut
    var outMethod: Out = .notOut
    
    
    @IBOutlet weak var playerNameLabel: UILabel!
    
    @IBOutlet weak var playerBlockLabel: UILabel!
    
    @IBOutlet weak var playerRunsLabel: UILabel!
    
    @IBOutlet weak var playerFacedLabel: UILabel!
    
    @IBOutlet weak var playerStatus: UILabel!
    
    @IBOutlet weak var playerOutsMethod: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.playerNameLabel.text = nameLabel
        self.playerBlockLabel.text = blockLabel
        self.playerRunsLabel.text = String(runsLabel)
        self.playerFacedLabel.text = String(facedLabel)
        self.playerStatus.text = status.description
        self.playerOutsMethod.text = outMethod.description
        
        
    }


}
