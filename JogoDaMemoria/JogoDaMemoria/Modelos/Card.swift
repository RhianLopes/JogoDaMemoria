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
    
    init(imagemMemoria: UIImage) {
        self.id = NSUUID().uuidString
        self.estaVisivel = false
        self.imagemMemoria = imagemMemoria
        self.imagemMemoria =
    }
}
