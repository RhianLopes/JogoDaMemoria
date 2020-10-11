//
//  Card.swift
//  JogoDaMemoria
//
//  Created by Rhian Lopes da Costa on 10/10/20.
//

import UIKit

class Card {
    
    var id: String
    var indice: Int?
    var pairId: Int
    var estaVisivel: Bool = false
    var imagemMemoria: UIImage!
    var imagemDefault: UIImage!
    
    init(_ imagemMemoria: UIImage?, _ pairId: Int) {
        self.id = NSUUID().uuidString
        self.pairId = pairId
        self.estaVisivel = false
        self.imagemMemoria = imagemMemoria
        self.imagemDefault = UIImage(named: "imagem_card_default")
    }
    
    func salvarIndice(indice: Int) {
        
    }
}

extension Card {
    
    class func buscarCards() -> [Card] {
        var cards: [Card] = []
        for _ in 0...1 {
            for y in 0...4 {
                let imagem = UIImage(named: "card_\(y)")
                cards.append(Card(imagem, y))
            }
        }
        return cards
    }
}
