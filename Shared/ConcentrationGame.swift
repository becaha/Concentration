//
//  ConcentrationGame.swift
//  HW 3
//
//  Created by Rebecca Nybo on 9/8/20.
//

import Foundation

struct ConcentrationGame<CardContent: Equatable> {
    private(set) var cards: Array<Card>
    var score: Int 
    private var indexOfFaceUpCard: Int?
//    private var indexOfFaceUpCard {
//    get set
    
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
    
    struct Card: Identifiable {
        static func == (lhs: ConcentrationGame<CardContent>.Card, rhs: ConcentrationGame<CardContent>.Card) -> Bool {
            return lhs.content == rhs.content
        }
        
        fileprivate(set) var isFaceUp = false
        fileprivate(set) var isMatched = false
        fileprivate(set) var timesSeen = 0
        fileprivate(set) var content: CardContent
        fileprivate(set) var id: Int
    }
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(matching: card),
           !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched
           {
            if let potentialMatchIndex = indexOfFaceUpCard {
                // found a match
                if cards[chosenIndex] == cards[potentialMatchIndex] {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    score += 2
                }
                else {
                    if cards[chosenIndex].timesSeen > 0 {
                        score -= 1
                    }
                    if cards[potentialMatchIndex].timesSeen > 1 {
                        score -= 1
                    }
                }
                indexOfFaceUpCard = nil
            } else {
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                indexOfFaceUpCard = chosenIndex
            }
            cards[chosenIndex].timesSeen += 1
            cards[chosenIndex].isFaceUp.toggle()
        }
    }
}
