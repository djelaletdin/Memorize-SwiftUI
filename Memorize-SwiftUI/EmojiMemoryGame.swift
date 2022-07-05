//
//  EmojiMemoryGame.swift
//  Memorize-SwiftUI
//
//  Created by Didar Jelaletdinov on 2022/07/02.
//

import Foundation

class EmojiMemoryGame: ObservableObject {
    
    static let emojis = ["🚜","🚗","🚑","🚚", "🥦", "🍅", "🌶", "🌽", "🥕", "🥬", "🥒", "🧄", "🍆", "🧅"]

    static func createMemoryGame() -> MemoryGame<String>{
        return MemoryGame(numberOfPairsOfCards: 5) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card>{
        return model.cards
    }
    
    // MARK: - Intends
    
    func choose(_ card: MemoryGame<String>.Card){
        model.choose(card: card)
    }
}
