//
//  ContentView.swift
//  Memorize
//
//  
//

import SwiftUI

struct ContentView: View {
    //var emojis: Array<String> = ["🤣","😜","🤩"]
    //var emojis: [String] = ["🤣","😜","🤩"]
//    var emojis = ["🤣","😜","🤩","😀","😇","😅","😍","😘","🥰","😤","😡","🤬","🤯","🤗","🤔","🤭","🤫","🤥","😲"]
//    @State var emojiCount = 3
    
    //@ObservedObject let viewModel: EmojiMemoryGame
    //Property wrapper can only be applied to a 'var'
    @ObservedObject var viewModel: EmojiMemoryGame
    var body: some View {
//        VStack{

        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))] ) {
                //CardView(isFaceUp: false)
                ForEach(viewModel.cards) { card in
                    CardView(card: card)
                        .aspectRatio(2/3,contentMode: .fit)
                        .onTapGesture {
                            viewModel.choose(card)
                        }
                }

            }
        }.foregroundColor(.red)
//        }
    }
}
    
    struct CardView: View {
        let card: MemoryGame<String>.Card
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
        ContentView(viewModel: game)
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        ContentView(viewModel: game)
            .preferredColorScheme(.light)
    }
}
