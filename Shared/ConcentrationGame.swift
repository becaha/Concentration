//
//  ConcentrationGame.swift
//  HW 3
//
//  Created by Rebecca Nybo on 9/8/20.
//

import Foundation

struct ConcentrationGame<CardContent: Equatable> {
    struct Card: Identifiable {
        static func == (lhs: ConcentrationGame<CardContent>.Card, rhs: ConcentrationGame<CardContent>.Card) -> Bool {
            return lhs.content == rhs.content
        }
        
        var isFaceUp = false
        var isMatched = false
        var content: CardContent
        var id: Int
    }
    
    var cards: Array<Card>
    var score: Int
    var indexOfFaceUpCard: Int?
    
    init(cardContentFactory: (Int) -> CardContent) {
        
        cards = Array<Card>()
        score = 0
        
        let pairNum = Int.random(in: 2..<6)
        
        for pairIndex in 0..<pairNum {
            let content = cardContentFactory(pairIndex)
            
            cards.append(Card(content: content, id: pairIndex * 2))
            cards.append(Card(content: content, id: pairIndex * 2 + 1))
        }
        
        cards.shuffle()
    }
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(matching: card),
           !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched
           {
            if let potentialMatchIndex = indexOfFaceUpCard {
                if cards[chosenIndex] == cards[potentialMatchIndex] {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                indexOfFaceUpCard = nil
            } else {
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                indexOfFaceUpCard = chosenIndex
            }
            cards[chosenIndex].isFaceUp.toggle()
        }
    }
}
