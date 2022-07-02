//
//  EmojiMemoryGame.swift
//  Memorize-SwiftUI
//
//  Created by Didar Jelaletdinov on 2022/07/02.
//

import Foundation

class EmojiMemoryGame {
    
    static let emojis = ["🚜","🚗","🚑","🚚", "🥦", "🍅", "🌶", "🌽", "🥕", "🥬", "🥒", "🧄", "🍆", "🧅"]

    static func createMemoryGame() -> MemoryGame<String>{
        return MemoryGame(numberOfPairsOfCards: 4) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card>{
        return model.cards
    }
}
