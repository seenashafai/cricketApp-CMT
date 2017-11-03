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
import os.log

class newTableViewController: UITableViewController {
    
    var players = [PlayerItem]()
    var databasePlayers = [String]()
    var ref: DatabaseReference!
    var handle: DatabaseHandle!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Initialise Firebase Database
        ref = Database.database().reference()
        
        // Load existing database data
        handle = ref?.child("players").observe(.childAdded, with: { (snapshot) in
            
            var newItems: [PlayerItem] = []
            
            for item in snapshot.children
            {
                let playerItem = PlayerItem(snapshot: item as! DataSnapshot)
                newItems.append(playerItem)
            }
            
            self.players = newItems
            self.tableView.reloadData()
        })
        
        // Use the edit button item provided by the table view controller.
        navigationItem.leftBarButtonItem = editButtonItem
        
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return databasePlayers.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cellIdentifier = "PlayerTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? PlayerTableViewCell  else
        {
            fatalError("The dequeued cell is not an instance of PlayerTableViewCell.")
        }
        
        let player = databasePlayers[indexPath.row]
        cell.nameLabel?.text = databasePlayers[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
    {
        return true
    }
    
    
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            players.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    
    //MARK: - Navigation
    
    // Preparing ShowDetail and AddItem segues
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        super.prepare(for: segue, sender: sender)
        
        switch(segue.identifier ?? "") {
            
        case "AddItem":
            if #available(iOS 10.0, *) {
                os_log("Adding a new meal.", log: OSLog.default, type: .debug)
            } else {
                // Fallback on earlier versions
            }
            
        case "ShowDetail":
            guard let playerDetailViewController = segue.destination as? MasterTableViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            
            guard let selectedPlayerCell = sender as? PlayerTableViewCell else {
                fatalError("Unexpected sender: \(String(describing: sender))")
            }
            
            guard let indexPath = tableView.indexPath(for: selectedPlayerCell) else {
                fatalError("The selected cell is not being displayed by the table")
            }
            
            let selectedPlayer = players[indexPath.row]
            playerDetailViewController.players = selectedPlayer
            
        default:
            fatalError("Unexpected Segue Identifier; \(String(describing: segue.identifier))")
        }
    }
    
    
    //MARK: Actions
    
    // Reverse Segue
    @IBAction func unwindToMealList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? MasterTableViewController, let player = sourceViewController.players {
            
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                // Update an existing player.
                players[selectedIndexPath.row] = player
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            }
            else {
                // Add a new player.
                let newIndexPath = IndexPath(row: players.count, section: 0)
                
                players.append(player)
                ref?.child("players").childByAutoId().setValue(player)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
        }
    }
}
