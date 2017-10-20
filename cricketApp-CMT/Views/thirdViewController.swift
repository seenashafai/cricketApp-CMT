//
//  thirdViewController.swift
//  cricketApp-CMT
//
//  Created by Seena Shafai on 18/10/2017.
//  Copyright © 2017 Seena Shafai. All rights reserved.
//

import UIKit

class thirdViewController: UIViewController, UITabBarDelegate, UITableViewDataSource {
    
    //MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Declare variables
    var playerList = [String]()

    //MARK: - Conform to delegates
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return (playerList.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = playerList[indexPath.row]
        
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete
        {
            playerList.remove(at: indexPath.row)
            tableView.reloadData()
            
        }
    }
    
    
    //MARK: - View cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
