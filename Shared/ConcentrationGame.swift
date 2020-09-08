//
//  ConcentrationGame.swift
//  HW 3
//
//  Created by Rebecca Nybo on 9/8/20.
//

import Foundation

struct ConcentrationGame<CardContent> {
    struct Card: Identifiable {
        var isFaceUp = true
        var isMatched = true
        var content: CardContent
        var id: Int
    }
    
    var cards: Array<Card>
    
    init(cardContentFactory: (Int) -> CardContent) {
        
        cards = Array<Card>()
        
        let pairNum = Int.random(in: 2..<6)
        
        for pairIndex in 0..<pairNum {
            let content = cardContentFactory(pairIndex)
            
            cards.append(Card(content: content, id: pairIndex * 2))
            cards.append(Card(content: content, id: pairIndex * 2 + 1))
        }
        
        cards.shuffle()
    }
    
    func choose(card: Card) {
        print("You chose \(card)")
    }
}
