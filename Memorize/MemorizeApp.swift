//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Atsushi Koshio on 2021/06/29.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame() //game is a pointer to class reference type; classes are mutable
                                //let doesnt allow to change the pointer
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
