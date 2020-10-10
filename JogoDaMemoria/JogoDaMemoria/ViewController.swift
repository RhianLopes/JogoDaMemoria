//
//  ViewController.swift
//  JogoDaMemoria
//
//  Created by Rhian Lopes da Costa on 10/10/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var colecaoDeViews: UICollectionView!
    
    var jogo = JogoDaMemoria()
    var cards: [Card] = []
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.cards = Card.buscarCards()
        self.prepararNovoJogo()
    }
    
    func prepararNovoJogo() {
        self.cards = jogo.novoJogo(cards: self.cards)
        colecaoDeViews.reloadData()
    }
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as! CardCell
    }
    
    
}
