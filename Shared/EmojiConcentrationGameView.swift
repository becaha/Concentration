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
        VStack {
            HStack {
//                TextField("", text: $emojiGame.score)

                Spacer()

                Button(action: {
                    emojiGame.newGame()
                }) {
                    Text("New Game")
                        .padding(8)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }.padding()
            
            GeometryReader { geometry in
                LazyVGrid(columns: columns(for: geometry.size)) {
                    ForEach(emojiGame.cards) { card in
                        CardView(card: card)
                            .onTapGesture {
                                emojiGame.choose(card)
                            }
                    }
                }
                .padding()
                .foregroundColor(.blue)
            }
           
        }
    }
    
    private func columns(for size: CGSize) -> [GridItem] {
        Array(repeating: GridItem(.flexible()), count: Int(size.width / desiredCardWidth))
    }
    
    // MARK: - Drawing Constants
    
    private let desiredCardWidth: CGFloat = 120
}

struct EmojiConcentrationGameView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiConcentrationGameView(emojiGame: EmojiConcentrationGame())
    }
}
