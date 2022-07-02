//
//  ContentView.swift
//  Memorize-SwiftUI
//
//  Created by Didar Jelaletdinov on 2022/06/24.
//

import SwiftUI

struct ContentView: View {
    
    var emojis = ["🚜","🚗","🚑","🚚", "🥦", "🍅", "🌶", "🌽", "🥕", "🥬", "🥒", "🧄", "🍆", "🧅"]
    @State var emojiCount = 10
    
    var body: some View {
        VStack{
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]){
                    ForEach(emojis[0..<emojiCount ] ,id: \.self, content: { emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    })
                }
                .foregroundColor(.red)
            }
        }
        .padding(.horizontal)

    }
    
}

struct CardView: View{
    
    var content: String
    
    @State var isFaceUp: Bool = true
    
    var body: some View{
        ZStack{
            
            let shape = RoundedRectangle(cornerRadius: 25)
            
            if isFaceUp{
                shape.fill()
                    .foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                    .foregroundColor(.orange)
                Text(content)
            } else {
                shape.fill()
            }
            
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
