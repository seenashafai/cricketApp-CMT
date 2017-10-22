//
//  Player.swift
//  cricketApp-CMT
//
//  Created by Seena Shafai on 22/10/2017.
//  Copyright © 2017 Seena Shafai. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

struct PlayerItem {
    
    let key: String
    let name: String
    let block: String
    let addedByUser: String
    let ref: DatabaseReference!
    
    init(name: String, addedByUser: String, key: String = "", block: String) {
        self.key = key
        self.name = name
        self.addedByUser = addedByUser
        self.ref = nil
        self.block = block
    }
    
    init(snapshot: DataSnapshot) {
        key = snapshot.key
        let snapshotValue = snapshot.value as! [String: AnyObject]
        name = snapshotValue["name"] as! String
        addedByUser = snapshotValue["addedByUser"] as! String
        block = snapshotValue["block"] as! String
        ref = snapshot.ref
    }
    
    func toAnyObject() -> Any {
        return [
            "name": name,
            "addedByUser": addedByUser,
            "block": block
        ]
    }
    
}
