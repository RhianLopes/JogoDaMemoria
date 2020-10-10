//
//  ViewController.swift
//  JogoDaMemoria
//
//  Created by Rhian Lopes da Costa on 10/10/20.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var cardCollectionView: UICollectionView!
    
//    var cards: [Card] = Card.buscarCards()
    var cards: [UIImage] = [
        UIImage(named: "card_0")!,
        UIImage(named: "card_1")!,
        UIImage(named: "card_2")!,
        UIImage(named: "card_3")!
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cardViewCell = cardCollectionView.dequeueReusableCell(withReuseIdentifier: "CardViewCell", for: indexPath) as! CardViewCell
        cardViewCell.memoriaImageView.image = cards[indexPath.item]
        
        return cardViewCell
    }
}
