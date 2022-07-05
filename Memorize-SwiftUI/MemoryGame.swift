//
//  MemoryGame.swift
//  Memorize-SwiftUI
//
//  Created by Didar Jelaletdinov on 2022/07/02.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    
    private (set) var cards: Array<Card>
    private var indexOfTheOnlyFaceUpCard: Int?
    
    
    // when assigning value to a new variable. it gets copied in struct
    // For example chosenCard = cards[chosenIndex]
    // even if you change the chosenCard, cards[chosenIndex] isn't changed.
    mutating func choose(card: Card){
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id}),
            !cards[chosenIndex].isFaceUp,
            !cards[chosenIndex].isMatched { // checks if id of a card from "cards" arrays is equal to "card.id"
            
            if let potentionalMatchIndex = indexOfTheOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentionalMatchIndex].content{
                    cards[potentionalMatchIndex].isMatched = true
                    cards[chosenIndex].isMatched = true
                }
                
                indexOfTheOnlyFaceUpCard = nil
            } else {
                for index in cards.indices{
                    cards[index].isFaceUp = false
                }
                indexOfTheOnlyFaceUpCard = chosenIndex
            }
            cards[chosenIndex].isFaceUp.toggle()
        }
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent){
        cards = Array<Card>()
        
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(id: pairIndex*2, content: content))
            cards.append(Card(id: pairIndex*2+1, content: content))
        }
    }
    
    struct Card: Identifiable{ 
        var id: Int
        var isFaceUp = false
        var isMatched =  false
        var content: CardContent
    }
}
