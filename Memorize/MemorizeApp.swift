//
//  MemorizeApp.swift
//  Memorize
//
//

import SwiftUI

@main
struct MemorizeApp: App {
    private let game = EmojiMemoryGame() //game is a pointer to class reference type; classes are mutable
                                //let doesnt allow to change the pointer
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
        }
    }
}
