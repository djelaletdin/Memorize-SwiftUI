//
//  EmojiMemoryGame.swift
//  Memorize-SwiftUI
//
//  Created by Didar Jelaletdinov on 2022/07/02.
//

import Foundation

class EmojiMemoryGame: ObservableObject {
    
    typealias Card = MemoryGame<String>.Card
    
    private static let emojis = ["🚜","🚗","🚑","🚚", "🥦", "🍅", "🌶", "🌽", "🥕", "🥬", "🥒", "🧄", "🍆", "🧅"]

    private static func createMemoryGame() -> MemoryGame<String>{
        return MemoryGame(numberOfPairsOfCards: 5) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    @Published private var model = createMemoryGame()
    
    var cards: Array<Card>{
        return model.cards
    }
    
    // MARK: - Intends
    
    func choose(_ card: Card){
        model.choose(card: card)
    }
}
