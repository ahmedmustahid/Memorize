//
//  MemoryGame.swift
//  Memorize
//
//  Created by Ahmed on 2021/07/02.
//

import Foundation

struct MemoryGame <CardContent> where CardContent: Equatable { //CardContent argument needs to be passed from outside
                                    //bcz it's dont care type (generics)
                                    //MemoryGame is of generic type
    private(set) var cards: Array<Card> //private(set) makes a variable read only
    
    private var indexOfTheOneAndOnlyFaceUpCard: Int? { //computed properties
        var faceUpCardIndices = [Int]()
        for index in cards.indices {
            if cards[index].isFaceUp {
                faceUpCardIndices.append(index)
            }
        }
        if faceUpCardIndices.count == 1 {
            return faceUpCardIndices.first //returns nil if array empty
        } else {
            return nil
        }
        
    }
        
    
    
    mutating func choose(_ card: Card) {
       if let chosenIndex = cards.firstIndex( where: {$0.id == card.id} ),
            !cards[chosenIndex].isMatched,
            !cards[chosenIndex].isFaceUp
        {
            
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                indexOfTheOneAndOnlyFaceUpCard = nil
            } else {
                for index in cards.indices {
                //for index in 0..<cards.count{
                    cards[index].isFaceUp = false
                }
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
        
           cards[chosenIndex].isFaceUp =true//mutating 'self'(function arg) here;
       }
    }
   
    init(numberOfPairsOfCards: Int, createCardContent: (Int)->CardContent) {
        cards = [] //swift already knows it's an array of card, so empty array of cards
        //cards = Array<Card>()

        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card( content: content, id: pairIndex*2))
            cards.append(Card( content: content, id: pairIndex*2+1))
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp = false //type inference
        //var isFaceUp: Bool = false
        var isMatched = false
        let content: CardContent //dont care
        let id: Int
    }
}
