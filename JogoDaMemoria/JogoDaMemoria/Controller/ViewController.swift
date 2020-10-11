//
//  ViewController.swift
//  JogoDaMemoria
//
//  Created by Rhian Lopes da Costa on 10/10/20.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource  {

    @IBOutlet weak var cardCollectionView: UICollectionView!
    
    @IBAction func reiniciarJogoButton(_ sender: Any) {
        resetarJogo()
    }
    
    var jogo: JogoDaMemoria = JogoDaMemoria()
    var cards: [Card] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.cards = Card.buscarCards()
        self.novoJogo()
    }
    
    func novoJogo() {
        self.cards = jogo.novoJogo(cards: self.cards)
        cardCollectionView.reloadData()
    }
    
    func resetarJogo() {
        self.cards = Card.buscarCards()
        jogo.resetarJogo()
        self.cards = jogo.novoJogo(cards: self.cards)
        self.cardCollectionView.reloadData()
        cardCollectionView.allowsSelection = false
        cardCollectionView.allowsSelection = true
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cardViewCell = cardCollectionView.dequeueReusableCell(withReuseIdentifier: "CardViewCell", for: indexPath) as! CardViewCell
        guard let card = jogo.buscarCardNoIndice(indexPath.item) else { return cardViewCell }
        cardViewCell.memoriaImageView.image = card.imagemDefault
        cardViewCell.card = card
        cardViewCell.estaVisivel = false
        cards[indexPath.item].indice = indexPath.item
        
        return cardViewCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cardViewCell = collectionView.cellForItem(at: indexPath) as! CardViewCell
        cardViewCell.memoriaImageView.image = cards[indexPath.item].imagemMemoria
        
        if cardViewCell.estaVisivel { return }
        let cards = jogo.deveSelecionarCard(cardViewCell: cardViewCell)
        if jogo.jogoFinalizado() {
            avisarFimDeJogo()
        }
        
        let delayTime = DispatchTime.now() + 0.5
        DispatchQueue.main.asyncAfter(deadline: delayTime) {
            for cardDevemVirar in cards {
                guard let index = cardDevemVirar.indice else { continue }
                let cell = collectionView.cellForItem(at: IndexPath(item: index, section:0)) as! CardViewCell
                cell.memoriaImageView.image = cardDevemVirar.imagemDefault
            }
        }
    }

    private func avisarFimDeJogo() {
        let alerta = UIAlertController(title: "Parabéns!", message: "Fim de jogo", preferredStyle: .alert)
        alerta.addAction(acao)
        present(alerta, animated: true, completion: nil)
    }
    
    var acao: UIAlertAction { UIAlertAction(title: "Jogar novamente", style: .default) { _ in
            self.resetarJogo()
        }
    }
    
}
