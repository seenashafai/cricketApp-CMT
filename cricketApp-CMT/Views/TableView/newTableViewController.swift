//
//  newTableViewController.swift
//  cricketApp-CMT
//
//  Created by Seena Shafai on 20/10/2017.
//  Copyright © 2017 Seena Shafai. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class newTableViewController: UITableViewController {
    
    //MARK: - Properties
    var nameArray = [String]()
    var playerSelected: String = ""
    
    //MARK: - Firebase
    var ref: DatabaseReference?
    var refHandle: DatabaseHandle?


    //MARK: - UITableView
    
    override func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return nameArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
    {
        return true
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        playerSelected = nameArray[indexPath.row]
        self.performSegue(withIdentifier: "showDetail", sender: self)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell()
        let player = nameArray[indexPath.row]
        cell.textLabel?.text = player
        return cell
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        // Initialise Firebase Database
        ref = Database.database().reference()
        let playerRef = ref?.child("playernames")
        
        // Setup Firebase Database Listener
        refHandle = playerRef?.observe(.childAdded, with: {(snapshot) in
            
            if let item = snapshot.value as? String
            {
                self.nameArray.append(item)
                self.tableView.reloadData()
            }
        })
        
        // Use the edit button item provided by the table view controller.
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    
    override func viewDidAppear(_ animated: Bool)
    {
        //Save number of players to DB
        ref?.child("currentSession").child("playerCount").setValue(nameArray.count)
    }
    
    //MARK: - Navigation
    
    //Preparing segue to show details about player
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "showDetail"
        {
            print("playerselected")
            let destVC = segue.destination as! DetailsViewController
            destVC.playerName = playerSelected
        }
    }


}
