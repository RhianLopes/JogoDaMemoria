//
//  JogoDaMemoria.swift
//  JogoDaMemoria
//
//  Created by Rhian Lopes da Costa on 10/10/20.
//

import UIKit

class JogoDaMemoria {
    
    var cards: [Card] = []
    var cardsMostrados: [Card] = []
    
    init() {
    }
    
    func novoJogo(cards: [Card]) -> [Card] {
        self.cards = self.embaralharCards(cards: cards)
        return self.cards
    }
    
    func embaralharCards(cards: [Card]) -> [Card] {
        return cards.shuffled()
    }
    
    func cardAtIndex(_ index: Int) -> Card? {
        if cards.count > index {
            return cards[index]
        } else {
            return nil
        }
    }
    
    func indexForCard(_ card: Card) -> Int? {
        for index in 0...cards.count-1 {
            if card === cards[index] {
                return index
            }
        }
        return nil
    }
}
