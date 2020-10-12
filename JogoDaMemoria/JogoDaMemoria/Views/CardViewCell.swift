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
    
    func resetarCardView(_ card: Card) {
        self.memoriaImageView.image = card.imagemDefault
        self.card = card
    }
    
    func virarCard(_ image: UIImage) {
        self.memoriaImageView.image = image
    }
}
