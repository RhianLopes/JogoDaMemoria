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
    var cardsEmSelecao: [Card] = []
    
    init() {
    }
    
    func novoJogo(cards: [Card]) -> [Card] {
        self.cards = self.embaralharCards(cards: cards)
        return self.cards
    }
    
    func embaralharCards(cards: [Card]) -> [Card] {
        return cards.shuffled()
    }
    
    func buscarCardNoIndice(_ index: Int) -> Card? {
        return cards[index]
    }
    
    func deveSelecionarCard(card: Card?) -> [Card] {
        guard card != nil else { return [] }
        self.cardsEmSelecao.append(card!)
        
        if self.cardsEmSelecao.count == 2 {
            if cardsPares() {
                self.cardsMostrados.append(contentsOf: cardsEmSelecao)
                self.cardsEmSelecao = []
                return self.cardsEmSelecao
            } else {
                return self.cardsEmSelecao
            }
        }
        return []
    }
    
    func jogoFinalizado() -> Bool {
        return cardsMostrados.count == cards.count
    }
    
    private func cardsPares() -> Bool {
        return self.cardsEmSelecao[0].id == self.cardsEmSelecao[1].id
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
