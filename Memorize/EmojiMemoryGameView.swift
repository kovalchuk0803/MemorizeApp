 //
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Илья Ковальчук on 24.09.2020.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        Grid(viewModel.cards) { card in
            CardView(card: card).onTapGesture {
                withAnimation(.linear) {
                    viewModel.choose(card: card)
                }
            }
            .padding(8)
        }
        .padding()
        .foregroundColor(.blue)
        
        Button(action: {
            withAnimation(.easeInOut) {
                viewModel.resetGame()
            }
        }, label: { Text("New Game") } )
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    @ViewBuilder
    var body: some View {
        if card.isFaceUp || !card.isMatched {
            GeometryReader { geometry in
                ZStack {
                    Text(card.content)
                        .font(.system(size: fontSize(forSize: geometry.size)))
                        .rotationEffect(.degrees(card.isMatched ? 360.0 : 0.0))
                        .animation(card.isMatched ? Animation.linear.repeatForever(autoreverses: false) : .default)
                }
                .cardify(isFaceUp: card.isFaceUp)
                .transition(.scale)
            }
        }
    }
    
    // MARK: - Drawing constants
    
    private let fontScaleFactor: CGFloat = 0.7
    private func fontSize(forSize size: CGSize) -> CGFloat {
        return min(size.width, size.height) * fontScaleFactor
    }
}
 
#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(card: game.cards[2])
        return EmojiMemoryGameView(viewModel: game)
    }
}
#endif
