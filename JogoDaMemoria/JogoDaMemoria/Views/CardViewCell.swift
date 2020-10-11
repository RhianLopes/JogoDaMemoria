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
}
