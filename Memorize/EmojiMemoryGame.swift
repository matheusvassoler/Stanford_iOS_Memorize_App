//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Matheus da Silva Vassoler on 30/09/21.
//

import SwiftUI

func makeCardContent(index: Int) -> String {
    return "😀"
}

class EmojiMemoryGame {
    static let emojis = ["🚲", "🚂", "🚁", "🚜", "🚕", "🏎", "🚑", "🚓", "🚒", "✈️", "🚀","⛵️", "🛸", "🛶", "🚌", "🏍", "🛵", "🚠", "🚛", "🚗", "🚝", "🚚", "🛳", "🚤"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame(numberOfPairOfCards: 4) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
}
