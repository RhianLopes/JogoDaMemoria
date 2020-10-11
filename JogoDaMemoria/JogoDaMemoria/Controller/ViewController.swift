//
//  ViewController.swift
//  JogoDaMemoria
//
//  Created by Rhian Lopes da Costa on 10/10/20.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource  {

    @IBOutlet weak var cardCollectionView: UICollectionView!
    
    var cards: [Card] = Card.buscarCards()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cardCollectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cardViewCell = cardCollectionView.dequeueReusableCell(withReuseIdentifier: "CardViewCell", for: indexPath) as! CardViewCell
        print(cards[indexPath.item])
        cardViewCell.memoriaImageView.image = cards[indexPath.item].imagemMemoria
        
        return cardViewCell
    }
}
