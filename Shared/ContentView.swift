//
//  ContentView.swift
//  Shared
//
//  Created by Rebecca Nybo on 9/8/20.
//

import SwiftUI

struct ContentView: View {
    var emojiGame: EmojiConcentrationGame

    var body: some View {
        HStack {
            ForEach(emojiGame.cards) { card in
                CardView(card: card, cardCount: emojiGame.cards.count).onTapGesture( perform: {
                    emojiGame.choose(card: card)
                })
                .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .padding()
        .foregroundColor(.blue)
    }
}

struct CardView: View {
    var card: ConcentrationGame<String>.Card
    var cardCount: Int
    
    var body: some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10).fill(Color.white)
                RoundedRectangle(cornerRadius: 10).stroke()
                if cardCount < 5 {
                    Text(card.content)
                        .font(.largeTitle)
                }
                else{
                    Text(card.content)
                        .font(.title)
                }
            }
            else {
                RoundedRectangle(cornerRadius: 10).fill()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(emojiGame: EmojiConcentrationGame())
    }
}
