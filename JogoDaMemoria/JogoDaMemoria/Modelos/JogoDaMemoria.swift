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
        self.cards = cards.shuffled()
    }
    
    func resetarJogo() {
        self.cards.removeAll()
        self.cardsMostrados.removeAll()
        self.cardsEmSelecao.removeAll()
        self.contadorTentativas = 0
    }
    
    func jogoFinalizado() -> Bool {
        return cardsMostrados.count == cards.count
    }
    
    func buscarCardNoIndice(_ indice: Int) -> Card? {
        if cards.count > indice {
            let card = cards[indice]
            card.salvarIndice(indice)
            return card
        } else {
            return nil
        }
    }
    
    func validarCardsDevemVirar(card: Card?) -> [Card] {
        guard card != nil else { return [] }
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
    
    private func cardsPares() -> Bool {
        return self.cardsEmSelecao[0].pairId == self.cardsEmSelecao[1].pairId
    }
    
    private func gravarTentativa() {
        self.contadorTentativas += 1
    }
}
