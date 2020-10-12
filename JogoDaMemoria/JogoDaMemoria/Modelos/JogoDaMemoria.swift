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
    var contadorTentativas: Int = 0
    
    func novoJogo() {
        let cards = Card.buscarCards()
        self.cards = self.embaralharCards(cards)
    }
    
    func resetarJogo() {
        self.cards.removeAll()
        self.cardsMostrados.removeAll()
        self.cardsEmSelecao.removeAll()
        self.contadorTentativas = 0
    }
    
    func embaralharCards(_ cards: [Card]) -> [Card] {
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
                self.gravarTentativa()
                return self.cardsEmSelecao
            } else {
                let cardsDevemVirar = self.cardsEmSelecao
                self.cardsEmSelecao = []
                self.gravarTentativa()
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
    
    private func gravarTentativa() {
        self.contadorTentativas += 1
    }
}
