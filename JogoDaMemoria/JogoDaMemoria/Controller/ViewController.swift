//
//  ViewController.swift
//  JogoDaMemoria
//
//  Created by Rhian Lopes da Costa on 10/10/20.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource  {

    @IBOutlet weak var cardCollectionView: UICollectionView!
    
    var jogo: JogoDaMemoria = JogoDaMemoria()
    var cards: [Card] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.cards = Card.buscarCards()
        self.novoJogo()
    }
    
    func novoJogo() {
        cards = jogo.novoJogo(cards: self.cards)
        cardCollectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cardViewCell = cardCollectionView.dequeueReusableCell(withReuseIdentifier: "CardViewCell", for: indexPath) as! CardViewCell
        cardViewCell.memoriaImageView.image = cards[indexPath.item].imagemDefault
        guard let card = jogo.buscarCardNoIndice(indexPath.item) else { return cardViewCell }
        cardViewCell.card = card
        
        return cardViewCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cardViewCell = collectionView.cellForItem(at: indexPath) as! CardViewCell
        cardViewCell.memoriaImageView.image = cards[indexPath.item].imagemMemoria
        
        if cardViewCell.estaVisivel { return }
        let cards = jogo.deveSelecionarCard(card: cardViewCell.card)
        
        for cardsDevemVirar in cards {
            guard let index = jogo.indexForCard(cardsDevemVirar) else { continue }
            let cell = collectionView.cellForItem(at: IndexPath(item: index, section:0)) as! CardViewCell
            cell.memoriaImageView.image = cards[index].imagemDefault
        }
        
        return
    }

}
