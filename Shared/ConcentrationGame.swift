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
    private var indexOfFaceUpCard: Int? {
        get {
            cards.indices.filter{
                cards[$0].isFaceUp
            }.only
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = index == newValue
            }
        }
    }
    
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
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
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
                cards[chosenIndex].isFaceUp = true
            } else {
                indexOfFaceUpCard = chosenIndex
            }
            cards[chosenIndex].timesSeen += 1
        }
    }
    
    // MARK: - Bonus Time
    
//    var bonusTimeLimit: TimeInterval = 10
//    var lastFaceUpTime: Date?
//    var pastFaceUpTime: TimeInterval = 0
//
//    var bonusTimeRemaining: Double {
//        max(0, bonusTimeLimit - faceUpTime)
//    }
//
////    var faceUpTime: TimeInterval {
////        if let lastFaceUpTime = lastFaceUpTime {
////            return lastFaceUpTime
////        }
////    }
//
//
//    func startUsingBonusTime() {
//
//    }
//
//    func stopUsingBonusTime() {
//
//    }
}
