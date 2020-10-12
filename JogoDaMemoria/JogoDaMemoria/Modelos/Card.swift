//
//  Card.swift
//  JogoDaMemoria
//
//  Created by Rhian Lopes da Costa on 10/10/20.
//

import UIKit

class Card {
    
    var indice: Int?
    var pairId: Int
    var imagemMemoria: UIImage!
    var imagemDefault: UIImage!
    var estaVisivel: Bool = false
    
    init(_ imagemMemoria: UIImage, _ pairId: Int) {
        self.pairId = pairId
        self.imagemMemoria = imagemMemoria
        self.imagemDefault = UIImage(named: "imagem_card_default")
    }
    
    func salvarIndice(_ indice: Int) {
        self.indice = indice
    }
    
    func virarCardPosicaoMemoria() {
        self.estaVisivel = true
    }
    
    func virarCardPosicaoDefault() {
        self.estaVisivel = false
    }
}

extension Card {
    
    class func buscarCards() -> [Card] {
        var cards: [Card] = []
        for _ in 0...1 {
            for y in 0...4 {
                let imagem = UIImage(named: "card_\(y)")
                cards.append(Card(imagem!, y))
            }
        }
        return cards
    }
}
