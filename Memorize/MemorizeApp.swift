//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Илья Ковальчук on 24.09.2020.
//

import SwiftUI

@main
struct MemorizeApp: App {
    var body: some Scene {
        WindowGroup {
            let game = EmojiMemoryGame()
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
