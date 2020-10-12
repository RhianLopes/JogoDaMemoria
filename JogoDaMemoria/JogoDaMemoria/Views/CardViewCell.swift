//
//  CardViewCell.swift
//  JogoDaMemoria
//
//  Created by Rhian Lopes da Costa on 10/10/20.
//

import UIKit

class CardViewCell: UICollectionViewCell {
    
    @IBOutlet weak var memoriaImageView: UIImageView!
    
    var card: Card?
    var estaVisivel: Bool = false
    
    func resetarCardView(_ card: Card) {
        self.memoriaImageView.image = card.imagemDefault
        self.card = card
        self.estaVisivel = false
    }
    
    func virarCardPosicaoDefault(_ image: UIImage) {
        self.memoriaImageView.image = image
        self.estaVisivel = false
    }
    
    func virarCardPosicaoMemoria(_ image: UIImage) {
        self.memoriaImageView.image = image
        self.estaVisivel = true
    }
    
    override func layoutSubviews() {
        self.layer.cornerRadius = 15.0
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        self.layer.shadowRadius = 5.0
        self.layer.shadowOpacity = 0.5
        self.layer.masksToBounds = false
    }
}
