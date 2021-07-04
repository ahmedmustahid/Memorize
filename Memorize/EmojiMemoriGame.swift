//
//  EmojiMemoriGame.swift
//  Memorize
//
//  Created by Ahmed on 2021/07/02.
//

import SwiftUI

/*
func makeCardContent(index: Int)-> String{
    return "😀"
}
*/

//let emojis = ["🤣","😜","🤩","😀","😇","😅","😍","😘","🥰","😤","😡","🤬","🤯","🤗","🤔","🤭","🤫","🤥","😲"]

class EmojiMemoryGame: ObservableObject { //used to publish the chenged model to the world
    //privat(set) var model: MemoryGame<String>
    //type variable
    static let emojis = ["🤣","😜","🤩","😀","😇","😅","😍","😘","🥰","😤","😡","🤬","🤯","🤗","🤔","🤭","🤫","🤥","😲"]
    
    //type function
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) {
            pairIndex  in
            EmojiMemoryGame.emojis[pairIndex]
        }
    }
    
//    private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    @Published private var model: MemoryGame<String> = createMemoryGame() //can be done only during initialization/ accessing static inside
    //another static
    //using var instead of let; because MemoryGame is mutating cards
    //let would have turned model into immutable
    
    
//    private var model: MemoryGame<String> = MemoryGame<String>(numberOfPairsOfCards: 4) {
//        pairIndex  in
//        EmojiMemoryGame.emojis[pairIndex]
//    }
    var cards: Array<MemoryGame<String>.Card>{
        model.cards
    }
    
    //implicit var inside ObservableObject; automatically sends the changed info
    //var objectWillChange: ObservableObjectPublisher
    
    
    //MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card){
        
        //objectWillChange.send()//sends model changed info to UI
        //replaced by @Published keyword for the model
        model.choose(card)
    }
    
}
