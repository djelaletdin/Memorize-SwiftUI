//
//  ContentView.swift
//  Memorize-SwiftUI
//
//  Created by Didar Jelaletdinov on 2022/06/24.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    
    @ObservedObject var game: EmojiMemoryGame
    
    var body: some View {
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]){
                    ForEach(game.cards) { card in
                        CardView(card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                game.choose(card)
                            }
                    }
                }
                .foregroundColor(.red)
            }
        .padding(.horizontal)

    }
    
}

struct CardView: View{

    let card: EmojiMemoryGame.Card
    
    init(_ card: EmojiMemoryGame.Card){
        self.card = card
    }
    
    var body: some View{
        GeometryReader (content: { geometry in // with geometry proxy you can get the size of the container
            ZStack{
                
                let shape = RoundedRectangle(cornerRadius: DrawintConstants.cornerRadius)
                
                if card.isFaceUp{
                    shape.fill()
                        .foregroundColor(.white)
                    shape.strokeBorder(lineWidth: DrawintConstants.lineWidth)
                        .foregroundColor(.orange)
                    Text(card.content).font(font(size: geometry.size))
                } else if card.isMatched{
                    shape.opacity(0)
                }
                
                else {
                    shape.fill()
                }
                
            }
        })
    }
    
    private func font(size: CGSize) -> Font {
        return Font.system(size: min(size.width, size.height) * DrawintConstants.fontScale)
    }
    
    private struct DrawintConstants {
        static let cornerRadius: CGFloat = 25
        static let lineWidth: CGFloat = 3
        static let fontScale: CGFloat = 0.8
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
        
    static var previews: some View {
        let game = EmojiMemoryGame()
        EmojiMemoryGameView(game: game)
    }
}
