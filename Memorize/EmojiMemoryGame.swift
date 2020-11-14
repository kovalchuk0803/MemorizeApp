//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Илья Ковальчук on 26.09.2020.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private(set) var model: MemoryGame<String> = createMemoryGame()
    
    // MARK: - Access to the Model
    var cards: [MemoryGame<String>.Card] { model.cards }
    
    // MARK: - Intents
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
    
    func resetGame() {
        model = EmojiMemoryGame.createMemoryGame()
    }
    
    // MARK: - Private methods
    
    private static func createMemoryGame() -> MemoryGame<String> {
        let emojis = ["🙃", "😡", "🥰"]
        return MemoryGame<String>(numberOfPairsOfCards: emojis.count) { pairIndex in
            return emojis[pairIndex]
        }
    }
}
