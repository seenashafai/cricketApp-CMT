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
    var outsCount: Int = 0
    
    
    @IBOutlet weak var playerNameLabel: UILabel!
    
    @IBOutlet weak var playerBlockLabel: UILabel!
    
    @IBOutlet weak var playerRunsLabel: UILabel!
    
    @IBOutlet weak var playerFacedLabel: UILabel!
    
    @IBOutlet weak var playerOutsCount: UILabel!
    
    @IBOutlet weak var playerOutsMethod: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.playerNameLabel.text = nameLabel
        self.playerBlockLabel.text = blockLabel
        self.playerRunsLabel.text = String(runsLabel)
        self.playerFacedLabel.text = String(facedLabel)
        self.playerOutsCount.text = String(outsCount)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
