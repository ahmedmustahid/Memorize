//
//  MemoryGame.swift
//  Memorize
//
//  Created by Ahmed on 2021/07/02.
//

import Foundation

struct MemoryGame <CardContent> {
    private(set) var cards: Array<Card>
    
    mutating func choose(_ card: Card){
        //card.isFaceUp.toggle()//All arguments to functions are lets
        //let chosenIndex = index(of: card)! //some chosen; if nil, program crashes
        if let chosenIndex = index(of: card){
            //var chosenCard = cards[chosenIndex]//only cards[chosenIndex] copies the struct
            // instead of accessing it directly
            //cards[chosenIndex] needs to be changed directly instead of assigning its value
            //to a var
            cards[chosenIndex].isFaceUp.toggle()//mutating 'self'(function arg) here;
            //that's why mutating func instead of just func
            //chosenCard.isFaceUp.toggle()
            print("\(cards) ")
        }
    }
    
    func index( of card : Card ) -> Int? {
        
        for index in 0..<cards.count {
            if cards[index].id == card.id {
                return index
            }
        }
        return nil
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int)->CardContent){
        cards = Array<Card>()
        
        for pairIndex in 0..<numberOfPairsOfCards{
            let content = createCardContent(pairIndex)
            cards.append(Card( content: content, id: pairIndex*2))
            cards.append(Card( content: content, id: pairIndex*2+1))
        }
    }
    
    struct Card: Identifiable {
        
        
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent //dont care
        var id: Int
    }
}
