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
        AspectVGrid(items: game.cards, aspectRatio: 2/3, content: { card in
            if card.isMatched && !card.isFaceUp {
                Rectangle().opacity(0)
            } else {
                CardView(card)
                    .onTapGesture {
                        game.choose(card)
                    }
            }
        })
        .foregroundColor(.red)
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
                Pie(startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 20))
                    .padding(5).opacity(0.5)
                Text(card.content)
                    .rotationEffect(Angle(degrees: card.isMatched ? 360 : 0))
                    .animation(.linear(duration: 2).repeatForever(autoreverses: false))
                    .font(Font.system(size: DrawintConstants.fontSize))
                    .scaleEffect(scale(thatFits: geometry.size))
                    
            }
            .cardify(isFaceUp: card.isFaceUp)
        })
    }
    
    private func scale(thatFits size: CGSize) -> CGFloat {
        min(size.width, size.height) / (DrawintConstants.fontSize/DrawintConstants.fontScale)
    }
    
    private struct DrawintConstants {
        static let fontScale: CGFloat = 0.7
        static let fontSize: CGFloat = 32
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        let game = EmojiMemoryGame()
        EmojiMemoryGameView(game: game)
    }
}
