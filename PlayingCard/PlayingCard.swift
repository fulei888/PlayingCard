//
//  PlayingCard.swift
//  PlayingCard
//
//  Created by Lei Fu on 5/14/18.
//  Copyright © 2018 Lei Fu. All rights reserved.
//

import Foundation

struct PlayingCard: CustomStringConvertible
{
    var description: String {return "\(rank)\(suit)"}
    
    var suit: Suit
    var rank: Rank
    
    enum Suit: String, CustomStringConvertible {
        
        
        
        
        case spades = "♠︎"
        case hearts = "❤️"
        case diamonds="🔹"
        case clubs = "♣︎"
        static var all = [Suit.spades, .hearts, .diamonds, .clubs]
        var description: String {return rawValue}
        }
    
    enum Rank: CustomStringConvertible {
        
        
       
        
        case ace
        case face(String)
        case numberic(Int)
        
        var order: Int {
            switch self {
            case .ace: return 1
            case .numberic(let pips): return pips
            case .face(let kind) where kind == "J": return 11
            case .face(let kind) where kind == "Q": return 12
            case .face(let kind) where kind == "K": return 13
            default: return 0
            }
        }
        static var all: [Rank]{
            var allRanks = [Rank.ace]
            for pips in 2...10 {
                allRanks.append(Rank.numberic(pips))
            }
            allRanks += [Rank.face("J"), .face("Q"),.face("K")]
            return allRanks
        }
        
        var description: String {
            switch self{
            case .ace:return "A"
            case .numberic(let pips): return String(pips)
            case.face(let kind): return kind
        }
        
        }
    }
}
