//
//  CardView.swift
//  HW 3
//
//  Created by Rebecca Nybo on 9/10/20.
//

import SwiftUI

struct CardView: View {
    var card: ConcentrationGame<String>.Card
    var cardCount: Int
    
    var body: some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: cardCornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cardCornerRadius).stroke()
                if cardCount < 10 {
                    Text(card.content)
                        .font(.largeTitle)
                }
                else{
                    Text(card.content)
                        .font(.body)
                }
            }
            else {
                RoundedRectangle(cornerRadius: 10).fill()
            }
        }
    }
    
    // MARK: - Drawing constants
    
    private let cardCornerRadius: CGFloat = 10.0
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: ConcentrationGame<String>.Card(content: "🥨", id: 1), cardCount: 1)
    }
}
