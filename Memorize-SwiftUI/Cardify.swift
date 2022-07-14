//
//  Cardify.swift
//  Memorize-SwiftUI
//
//  Created by Didar Jelaletdinov on 2022/07/12.
//

import SwiftUI

struct Cardify: ViewModifier {

    var isFaceUp: Bool
    
    func body(content: Content) -> some View {
        ZStack{
            let shape = RoundedRectangle(cornerRadius: DrawintConstants.cornerRadius)
            
            if isFaceUp{
                shape.fill()
                    .foregroundColor(.white)
                shape.strokeBorder(lineWidth: DrawintConstants.lineWidth)
                    .foregroundColor(.orange)
                
            } else {
                shape.fill()
            }
            content
                .opacity(isFaceUp ? 1 : 0)
        }
    }
    
    private struct DrawintConstants {
        static let cornerRadius: CGFloat = 10
        static let lineWidth: CGFloat = 3        
    }
    
}

extension View{
    func cardify(isFaceUp: Bool) -> some View {
        return self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}
