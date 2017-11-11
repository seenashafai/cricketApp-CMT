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

class newTableViewController: UITableViewController{
    
    var playerArray = [PlayerClass]()
    
    //Initialise dummy players
    var player1 = PlayerClass()
    var player2 = PlayerClass()
    var player3 = PlayerClass()
    var player4 = PlayerClass()
    var player5 = PlayerClass()
    
    //var ref: DatabaseReference!
    //var handle: DatabaseHandle!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Initialise Firebase Database
        //ref = Database.database().reference()
        
        // Load existing database data
        
        
        
        // Use the edit button item provided by the table view controller.
        navigationItem.leftBarButtonItem = editButtonItem
    
        
        player1.meta.playerName = "Adam"
        player1.meta.block = "B"
        player1.stats.faced = 5
        player1.stats.runs = 10
        player1.stats.status = .notOut
        player1.stats.outMethod = .notOut
        
        playerArray.append(player1)
        
        player2.meta.playerName = "Brian"
        player2.meta.block = "B"
        player2.stats.faced = 6
        player2.stats.runs = 12
        player2.stats.status = .notOut
        player2.stats.outMethod = .notOut
        
        playerArray.append(player2)
        
        player3.meta.playerName = "Chris"
        player3.meta.block = "C"
        player3.stats.faced = 7
        player3.stats.runs = 14
        player3.stats.outMethod = .notOut
        player3.stats.status = .notOut


        playerArray.append(player3)
        
        player4.meta.playerName = "Desmond"
        player4.meta.block = "C"
        player4.stats.faced = 8
        player4.stats.runs = 16
        player4.stats.outMethod = .notOut
        player4.stats.status = .notOut


        playerArray.append(player4)
        
        player5.meta.playerName = "Edward"
        player5.meta.block = "D"
        player5.stats.faced = 9
        player5.stats.runs = 18
        player5.stats.outMethod = .notOut
        player5.stats.status = .notOut


        playerArray.append(player5)

        
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
        return playerArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
    {
        return true
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        performSegue(withIdentifier: "showDetail", sender: self)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell()
        let player = playerArray[indexPath.row]
        cell.textLabel?.text = player.meta.playerName
        
        return cell
    }
    
    
    //MARK: - Navigation
    
    // Preparing ShowDetail and AddItem segues
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "showDetail"
        {
            if let indexPath = self.tableView.indexPathForSelectedRow
            {
                let destinationVC = segue.destination as! DetailsViewController
                destinationVC.nameLabel = playerArray[indexPath.row].meta.playerName!
                destinationVC.blockLabel = playerArray[indexPath.row].meta.block!
                destinationVC.facedLabel = playerArray[indexPath.row].stats.faced!
                destinationVC.runsLabel = playerArray[indexPath.row].stats.runs!
                destinationVC.status = playerArray[indexPath.row].stats.status!
                destinationVC.outMethod = playerArray[indexPath.row].stats.outMethod!
                
                
            }
        }
           
    }

    
    //MARK: Actions
    
    @IBAction func unwindToPlayerList(sender: UIStoryboardSegue)
    {
        if let sourceViewController = sender.source as? MasterTableViewController, let addedPlayer: PlayerClass = sourceViewController.newPlayer
        {
            if let selectedIndexPath = tableView.indexPathForSelectedRow
            {
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            }
            else
            {
                let newIndexPath = IndexPath(row: playerArray.count, section: 0)
                playerArray.append(addedPlayer)
                print(addedPlayer)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
        }
    }

}
