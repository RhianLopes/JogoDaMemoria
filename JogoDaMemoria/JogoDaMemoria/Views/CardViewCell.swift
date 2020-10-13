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
        UIView.transition(
            with: self,
            duration: 0.5,
            options: .transitionFlipFromRight,
            animations: {
                self.memoriaImageView.image = image
            },
            completion: nil)
    }
}
