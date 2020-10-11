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
        let card = cards[index]
        card.indice = index
        return card
    }
    
    func deveSelecionarCard(cardViewCell: CardViewCell) -> [Card] {
        guard cardViewCell.card != nil else { return [] }
        let card = cardViewCell.card
        self.cardsEmSelecao.append(card!)
        
        if self.cardsEmSelecao.count == 2 {
            if cardsPares() {
                self.cardsMostrados.append(contentsOf: cardsEmSelecao)
                self.cardsEmSelecao = []
                cardViewCell.estaVisivel = true
                return []
            } else {
                let cardsDevemVirar = self.cardsEmSelecao
                self.cardsEmSelecao = []
                return cardsDevemVirar
            }
        }
        return []
    }
    
    func jogoFinalizado() -> Bool {
        return cardsMostrados.count == cards.count
    }
    
    private func cardsPares() -> Bool {
        return self.cardsEmSelecao[0].pairId == self.cardsEmSelecao[1].pairId
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
