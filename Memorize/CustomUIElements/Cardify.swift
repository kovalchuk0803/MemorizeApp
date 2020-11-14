//
//  Cardify.swift
//  Memorize
//
//  Created by Илья Ковальчук on 08.11.2020.
//

import SwiftUI

struct Cardify: AnimatableModifier {
    
    var animatableData: Double {
        get { rotation }
        set { rotation = newValue }
    }
    
    var isFaceUp: Bool { rotation < 90 }
    private var rotation: Double
    
    init(isFaceUp: Bool) {
        rotation = isFaceUp ? 0.0 : 180.0
    }
    
    func body(content: Content) -> some View {
        ZStack {
            Group {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: lineWidth)
                content
            }
            .opacity(isFaceUp ? 1.0 : 0.0)
            
            RoundedRectangle(cornerRadius: cornerRadius).fill()
                .opacity(isFaceUp ? 0.0 : 1.0)
        }
        .rotation3DEffect(.degrees(rotation), axis: (0, 1, 0))
    }
    
    // MARK: - Drawing constants
    
    private let cornerRadius: CGFloat = 10.0
    private let lineWidth: CGFloat = 3.0
}

extension View {
    func cardify(isFaceUp: Bool) -> some View {
        self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}
