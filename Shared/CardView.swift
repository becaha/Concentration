//
//  CardView.swift
//  HW 3
//
//  Created by Rebecca Nybo on 9/10/20.
//

import SwiftUI

struct CardView: View {
    var card: ConcentrationGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            if card.isFaceUp || !card.isMatched {
                ZStack {
                    Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(-card.bonusRemaining*360-90))
                        .padding()
                        .opacity(0.4)
                    Text(card.content)
                        .font(systemFont(for: geometry.size))
                        .rotationEffect(Angle.degrees(card.isMatched ? 360 : 0))
                        .animation(card.isMatched ? Animation.linear(duration: 1)
                                    .repeatForever(autoreverses: false) : .default)
                }
                .cardify(isFaceUp: card.isFaceUp)
            }
        }
        .aspectRatio(2/3, contentMode: .fit)
    }
    
    private func systemFont(for size: CGSize) -> Font {
        return Font.system(size: min(size.width, size.height) * fontScaleFactor)
    }
        
    // MARK: - Drawing constants
    
    private let cardCornerRadius: CGFloat = 10.0
    private let fontScaleFactor: CGFloat = 0.50
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: ConcentrationGame<String>.Card(isFaceUp: true, content: "🥨", id: 1))
            .padding(50)
    }
}
