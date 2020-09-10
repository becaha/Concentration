//
//  EmojiConcentrationGameView.swift
//  Shared
//
//  Created by Rebecca Nybo on 9/8/20.
//

import SwiftUI

struct EmojiConcentrationGameView: View {
    @ObservedObject var emojiGame: EmojiConcentrationGame

    var body: some View {
        HStack {
            ForEach(emojiGame.cards) { card in
                CardView(card: card, cardCount: emojiGame.cards.count)
                    .onTapGesture {
                        emojiGame.choose(card)
                    }
                .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .padding()
        .foregroundColor(.blue)
    }
}

struct EmojiConcentrationGameView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiConcentrationGameView(emojiGame: EmojiConcentrationGame())
    }
}
