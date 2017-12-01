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
            switch (self)
            
            {
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

enum Block: String, CustomStringConvertible {
    
    case B
    case C
    case D
    case E
    case F
    case other
    
    var description: String {
        get {
            switch (self)
                
            {
            case .B:
                return "B"
            case .C:
                return "C"
            case .D:
                return "D"
            case .E:
                return "E"
            case .F:
                return "F"
            case .other:
                return "other"
                
    
            }
            
        }
    }
    
}



enum Out: Int, CustomStringConvertible {
    
    case caught = 0
    case runout = 1
    case bowled = 2
    case lbw = 3
    case stumped = 4
    case obstructField = 5
    case handledBall = 6
    case hitWickets = 7
    case hitTwice = 8
    case timeOut = 9
    static var count: Int { return Out.timeOut.hashValue + 1}
    
    var description: String {
        get {
            switch (self) {
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
                case .timeOut:
                    return "timed out"
                
            }
        }
    }
    
}

class PlayerClass
{
    var meta = metaData()
    var stats = statsData()

    init()
    {
        meta.block = ""
        meta.playerName = ""
        stats.faced = 0
        stats.runs = 0
        stats.outMethod = .caught
        stats.status = .notOut
    }
}
