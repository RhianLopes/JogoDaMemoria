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
}
