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
    var emojis = ["🤣","😜","🤩","😀","😇","😅","😍","😘","🥰","😤","😡","🤬","🤯","🤗","🤔","🤭","🤫","🤥","😲"]
    @State var emojiCount = 3
    var body: some View {
        VStack{
//            HStack {
//            LazyVGrid(columns: [GridItem(),GridItem(),GridItem()] ) {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))] ) {
                    //CardView(isFaceUp: false)
                    ForEach(emojis[0..<emojiCount], id:\.self) { emoji in
                        CardView(content: emoji).aspectRatio(2/3,contentMode: .fit)
                    }
        //            CardView(content: "🤣")
        //            CardView(content: "😜")
        //            CardView(content: "🤩")
                    //CardView(isFaceUp: false)
                }
            }.foregroundColor(.red)
        
            Spacer(minLength: 12)
            HStack {
//                Button(action: {
//                        emojiCount += 1
//                } , label: {
//                    VStack{
//                        Text("Add")
//                        Text("Card")
//                    }
//
//                })
                remove
                Spacer()
                add
            }
            .font(.largeTitle)
            .padding(.horizontal)
            

        }
        .padding(.horizontal)
        
    }
    
    var remove: some View {
        Button {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
//           VStack{
//                Text("Remove")
//                Text("Card")
                
//            }
            
        }
        
    }
 
    var add: some View {
//        Button(action: {
        Button {
            if emojiCount < emojis.count {
                emojiCount += 1
            }
        } label: {
            Image(systemName: "plus.circle")
//            VStack{
//                Text("Add")
//                Text("Card")
//            }
            
        }
    }
}
    
//        return ZStack {
//            RoundedRectangle(cornerRadius: 20.0)
//                .stroke(lineWidth: 3.0)
////                .padding(.horizontal)
////                .foregroundColor(.red)
//
//            Text("Hello, world!")
////                .foregroundColor(Color.orange)
////                .padding()
//        }
//        .padding(.horizontal)
//        .foregroundColor(.red)
//
////        Text("Hello, world!")
////            .foregroundColor(Color.orange)
////            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
//
////        RoundedRectangle(cornerRadius: 20.0).stroke(lineWidth: 3.0).padding(.horizontal).foregroundColor(.red)
//    }
//}

    struct CardView: View {
        //var isFaceUp: Bool { return false }
        var content: String
        @State var isFaceUp: Bool = true
        //var isFaceUp: Bool
        
        var body: some View{
            ZStack {
                //var shape = RoundedRectangle(cornerRadius: 20.0)
                let shape = RoundedRectangle(cornerRadius: 20.0)
                if isFaceUp {
                    //RoundedRectangle(cornerRadius: 20.0)
                    shape.fill().foregroundColor(.white)
                    //RoundedRectangle(cornerRadius: 20.0)
//                    shape.stroke(lineWidth: 3.0)
                    shape.strokeBorder(lineWidth: 3.0)

                   
                    //Text("🤣")
                    Text(content)
                        .font(.largeTitle)
                } else {
                    //RoundedRectangle(cornerRadius: 20.0)
                    shape.fill()
                }
            }
            .onTapGesture {
                isFaceUp = !isFaceUp
            }
           //.padding(.horizontal)
           //.foregroundColor(.red)
       }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        ContentView()
            .preferredColorScheme(.light)
    }
}
