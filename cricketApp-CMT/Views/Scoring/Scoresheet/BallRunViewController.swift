//
//  BallRunViewController.swift
//  cricketApp-CMT
//
//  Created by Seena Shafai on 12/11/2017.
//  Copyright © 2017 Seena Shafai. All rights reserved.
//

import UIKit

class BallRunViewController: UIViewController {

    @IBOutlet weak var runTextField: UITextField!
    
    @IBAction func runStepper(_ sender: UIStepper)
    {
        let counter = Int(sender.value).description
        runTextField.text = counter
    }
    
    @IBAction func fourButton(_ sender: Any)
    {
        runTextField.text = String(4)
    }
    
    @IBAction func sixButton(_ sender: Any)
    {
        runTextField.text = String(6)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}
