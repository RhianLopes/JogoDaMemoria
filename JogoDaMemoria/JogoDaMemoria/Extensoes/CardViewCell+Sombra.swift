//
//  CardViewCell+Sombra.swift
//  JogoDaMemoria
//
//  Created by Rhian Lopes da Costa on 12/10/20.
//

import UIKit

extension CardViewCell {
    
    override func layoutSubviews() {
        self.layer.cornerRadius = 15.0
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        self.layer.shadowRadius = 5.0
        self.layer.shadowOpacity = 0.5
        self.layer.masksToBounds = false
    }
    
}
