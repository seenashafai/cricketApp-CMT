//
//  ScoreHubViewController.swift
//  cricketApp-CMT
//
//  Created by Seena Shafai on 11/11/2017.
//  Copyright © 2017 Seena Shafai. All rights reserved.
//

import UIKit

class ScoreHubViewController: UIViewController {
    
    var games: Array = [Game]()

    @IBOutlet weak var gameInfoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindToGameHub(sender: UIStoryboardSegue)
    {
        if let sourceViewController = sender.source as? GameSetupViewController, let newGame: [Game] = sourceViewController.gameDataArray
        {
            print(newGame[0].GameMeta.gameID)
        }
    }

}
