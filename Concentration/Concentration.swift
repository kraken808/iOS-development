//
//  Concentration.swift
//  Concentration
//
//  Created by Murat Merekov on 06.07.2020.
//  Copyright © 2020 Murat Merekov. All rights reserved.
//

import Foundation

class Concentration{
    
    private var indexOfOneAndOnlyFaceUpCard: Int?{
        get{
            var foundIndex: Int?
            for index in cards.indices{
                if cards[index].isFaceUp{
                    if foundIndex == nil{
                    foundIndex = index
                    
                }else{
                    return nil
                }
                }
            }
            return foundIndex
        }
        set{
            for index in cards.indices{
                cards[index].isFaceUp = (index == newValue )
            }
        }
    }
    
    
    private(set) var cards = [Card]()
    
    func chooseCard(at index: Int){
        
        assert(cards.indices.contains(index),"not contain index: \(index)")
        if !cards[index].isMatched{
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index{
                if cards[matchIndex] == cards[index]{
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    
                }
                cards[index].isFaceUp = true
            }else{
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    init(numberOfPairsOfCards: Int){
        assert(numberOfPairsOfCards>0,"func init( \(numberOfPairsOfCards)) must have at least one pair of cards")
        for _ in 0..<numberOfPairsOfCards{
            let card = Card()
            cards += [card, card]
        }
    }
}
