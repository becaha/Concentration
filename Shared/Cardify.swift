//
//  Cardify.swift
//  HW 3 Concentration
//
//  Created by Rebecca Nybo on 9/22/20.
//

import SwiftUI

struct Cardify: AnimatableModifier {
    var rotation: Double
    
    var isFaceUp: Bool {
        rotation < 90
    }
    
    var animatableData: Double {
        get { rotation }
        set { rotation = newValue }
    }
    
    init(isFaceUp: Bool) {
        rotation = isFaceUp ? 0 : 180
    }
    
    func body(content: Content) -> some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: cardCornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cardCornerRadius).stroke()
                content
            }
            else {
                RoundedRectangle(cornerRadius: cardCornerRadius).fill()
            }
        }
        .rotation3DEffect(
            Angle.degrees(rotation),
            axis: (0, 1, 0)
        )
    }
    
    // MARK: - Drawing constants
    
    private let cardCornerRadius: CGFloat = 10.0
}

struct Cardify_Previews: PreviewProvider {
    static var previews: some View {
        Text("🎲").cardify(isFaceUp: true)
            .padding()
    }
}

extension View {
    func cardify(isFaceUp: Bool) -> some View {
        modifier(Cardify(isFaceUp: isFaceUp))
    }
}
