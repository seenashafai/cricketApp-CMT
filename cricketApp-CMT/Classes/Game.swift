//
//  Game.swift
//  cricketApp-CMT
//
//  Created by Seena Shafai on 11/11/2017.
//  Copyright © 2017 Seena Shafai. All rights reserved.
//

import Foundation

struct GameMetaData
{
    var gameID: String?
    
}

struct GameStatsData
{
    var innings: Int?
    var overs: Int?
}

class Game {
    var GameMeta = GameMetaData()
    var GameStats = GameStatsData()


    init() {
        GameMeta.gameID = ""
        GameStats.innings = 0
        GameStats.overs = 0
    }
    
   

}
