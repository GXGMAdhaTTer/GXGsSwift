//
//  Concentration.swift
//  Concentration
//
//  Created by Nextlab14 on 2019/5/9.
//  Copyright © 2019 Nextlab14. All rights reserved.
//

import Foundation

class Concentration {
    var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    print("indexOfOneAndOnlyFaceUpCard: \(indexOfOneAndOnlyFaceUpCard)")
                    print("matchIndex.identifier: \(cards[matchIndex].identifier)")
                    print("index.identifier: \(cards[index].identifier)")
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                //either no cards or 2 cards are face up
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards
        {
            let card = Card(identifier: 0)
            cards += [card, card]
        }
        // TODO: Shuffle the cards
        
    }
}
