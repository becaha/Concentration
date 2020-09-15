//
//  EmojiConcentrationGame.swift
//  HW 3
//
//  Created by Rebecca Nybo on 9/8/20.
//

import SwiftUI

class EmojiConcentrationGame: ObservableObject {
    @Published private var game = createGame()
    
    static let emojis = ["🥨", "🥭", "🥑", "🍕", "🥖"]
    
    static func createGame() -> ConcentrationGame<String> {
        ConcentrationGame<String> {
            index in emojis[index]
        }
    }
    
    // MARK: - Access to model
    
    var cards: Array<ConcentrationGame<String>.Card> {
        game.cards
    }
    
    // MARK: - Intents
    
    func choose(_ card: ConcentrationGame<String>.Card) {
        game.choose(card)
    }
    
    func newGame() {
        game = EmojiConcentrationGame.createGame()
    }
}
