//
//  ScoreSheetViewController.swift
//  cricketApp-CMT
//
//  Created by Seena Shafai on 11/11/2017.
//  Copyright © 2017 Seena Shafai. All rights reserved.
//

import UIKit

class ScoreSheetViewController: UIViewController {
    
    var ballIndex = 0

    //MARK: - IBOutlets
    
    @IBOutlet weak var ball1Score: UILabel!
    @IBOutlet weak var ball2Score: UILabel!
    @IBOutlet weak var ball3Score: UILabel!
    @IBOutlet weak var ball4Score: UILabel!
    @IBOutlet weak var ball5Score: UILabel!
    @IBOutlet weak var ball6Score: UILabel!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }



    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
