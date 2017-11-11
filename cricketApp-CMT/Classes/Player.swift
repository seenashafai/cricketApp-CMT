//
//  Player.swift
//  cricketApp-CMT
//
//  Created by Seena Shafai on 22/10/2017.
//  Copyright © 2017 Seena Shafai. All rights reserved.
//

import Foundation

var playerArray = [String]()

struct metaData
{
    var playerName: String?
    var block: String?
}


struct statsData
{
    var faced: Int?
    var runs: Int?
    var status: Status?
    var outMethod: Out?

}

enum Status: String, CustomStringConvertible {
    
    case notOut
    case out
    case batting
    case fielding
    case bowling
    case keeping

    
    var description: String {
        get {
            switch (self) {
            case .out:
                return "out"
            case .notOut:
                return "not out"
            case .batting:
                return "currently batting"
            case .fielding:
                return "currently fielding"
            case .keeping:
                return "currently wicket keeping"
            case .bowling:
                return "currently bowling"
                

            }
        }
    }
    
}




enum Out: String, CustomStringConvertible {
    
    case notOut
    case caught
    case runout
    case bowled
    case lbw
    case stumped
    case obstructField
    case handledBall
    case hitWickets
    case hitTwice
    case timeout
    
    var description: String {
        get {
            switch (self) {
                case .notOut:
                    return "not out"
                case .caught:
                    return "caught"
                case .runout:
                    return "runout"
                case .bowled:
                    return "bowled"
                case .lbw:
                    return "lbw"
                case .stumped:
                    return "stumped"
                case .obstructField:
                    return "obstructed Field"
                case .handledBall:
                    return "handled ball"
                case .hitWickets:
                    return "hit wicket"
                case .hitTwice:
                    return "hit twice"
                case .timeout:
                    return "timed out"
            }
        }
    }
    
}

class PlayerClass {
    var meta = metaData()
    var stats = statsData()

    init() {
        
        meta.block = ""
        meta.playerName = ""
        stats.faced = 0
        stats.runs = 0
        stats.outMethod = .notOut
        stats.status = .notOut
        }
}
