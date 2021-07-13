//
//  ContentView.swift
//  Memorize
//
//  
//

import SwiftUI

struct EmojiMemoryGameView: View {
    //var emojis: Array<String> = ["🤣","😜","🤩"]
    //var emojis: [String] = ["🤣","😜","🤩"]
//    var emojis = ["🤣","😜","🤩","😀","😇","😅","😍","😘","🥰","😤","😡","🤬","🤯","🤗","🤔","🤭","🤫","🤥","😲"]
//    @State var emojiCount = 3
    
    //@ObservedObject let viewModel: EmojiMemoryGame
    //Property wrapper can only be applied to a 'var'
    @ObservedObject var game: EmojiMemoryGame
    var body: some View {
//        VStack{

        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))] ) {
                //CardView(isFaceUp: false)
                ForEach(game.cards) { card in
                    CardView(card: card)
                        .aspectRatio(2/3,contentMode: .fit)
                        .onTapGesture {
                            game.choose(card)
                        }
                }

            }
        }.foregroundColor(.red)
//        }
    }
}
    
    struct CardView: View {
        //private let card: EmojiMemoryGame.Card
        let card: EmojiMemoryGame.Card

       
        var body: some View{
            ZStack {
                
                let shape = RoundedRectangle(cornerRadius: 20.0)
                if card.isFaceUp {
                    //RoundedRectangle(cornerRadius: 20.0)
                    shape.fill().foregroundColor(.white)
                    //RoundedRectangle(cornerRadius: 20.0)
//                    shape.stroke(lineWidth: 3.0)
                    shape.strokeBorder(lineWidth: 3.0)

                   
                    //Text("🤣")
                    Text(card.content)
                        .font(.largeTitle)
                } else if card.isMatched {
                    shape.opacity(0)
                }
                else {
                    //RoundedRectangle(cornerRadius: 20.0)
                    shape.fill()
                }
            }

       }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        let game = EmojiMemoryGame()
        EmojiMemoryGameView(game: game)
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        EmojiMemoryGameView(game: game)
            .preferredColorScheme(.light)
    }
}
