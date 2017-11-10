//
//  Player.swift
//  cricketApp-CMT
//
//  Created by Seena Shafai on 22/10/2017.
//  Copyright © 2017 Seena Shafai. All rights reserved.
//

import Foundation


struct metaData
{
    var playerName: String?
    var block: String?
}


struct statsData
{
    var faced: Int?
    var runs: Int?
    var outs: Int?
}

enum Out {
    
    case blank
    case caught
    case runout
    case bowled
    case lbw
    case stumped
    case obstructfield
    case handledball
    case hitwickets
    case hittwice
    case timedout
    
}

class PlayerClass {
    var meta = metaData()
    var stats = statsData()

    init() {
        
        meta.block = ""
        meta.playerName = ""
        stats.faced = 0
        stats.runs = 0
        stats.outs = 0
        

        



    }
}
