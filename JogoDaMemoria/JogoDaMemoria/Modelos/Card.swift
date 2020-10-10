//
//  Card.swift
//  JogoDaMemoria
//
//  Created by Rhian Lopes da Costa on 10/10/20.
//

import UIKit

class Card {
    
    var id: String
    var estaVisivel: Bool = false
    var imagemMemoria: UIImage!
    var imagemDefault: UIImage!
    
    init(imagemMemoria: UIImage?) {
        self.id = NSUUID().uuidString
        self.estaVisivel = false
        self.imagemMemoria = imagemMemoria
        self.imagemDefault = UIImage(named: "imagem_card_default")
    }
}

extension Card {
    
    class func buscarCards() -> [Card] {
        var cards: [Card] = []
        for i in 0...4 {
            let imagem = UIImage(named: "card_\(i)")
            cards.append(Card(imagemMemoria: imagem))
        }
        return cards + cards
    }
}
