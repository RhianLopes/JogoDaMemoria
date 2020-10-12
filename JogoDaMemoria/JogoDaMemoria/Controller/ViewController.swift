//
//  ViewController.swift
//  JogoDaMemoria
//
//  Created by Rhian Lopes da Costa on 10/10/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cardCollectionView: UICollectionView!
    
    var jogo: JogoDaMemoria = JogoDaMemoria()

    var cards: [Card] = []
    
    var acao: UIAlertAction { UIAlertAction(title: "Bacana, bora de novo", style: .default) { _ in
            self.resetarJogo()
        }
    }
    
    @IBAction func reiniciarJogoIcon(_ sender: Any) {
        resetarJogo()
    }
    @IBAction func reiniciarJogoButton(_ sender: Any) {
        resetarJogo()
    }
    
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
        self.jogo.resetarJogo()
        self.cards = jogo.novoJogo(cards: self.cards)
        self.cardCollectionView.reloadData()
    }

    private func avisarFimDeJogo() {
        let alerta = UIAlertController(title: "Boa, você terminou!", message: "Você precisou de \(self.jogo.contadorTentativas) tentativas para finalizar o jogo da memória.", preferredStyle: .alert)
        alerta.addAction(acao)
        present(alerta, animated: true, completion: nil)
    }
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cardViewCell = cardCollectionView.dequeueReusableCell(withReuseIdentifier: "CardViewCell", for: indexPath) as! CardViewCell
        guard let card = jogo.buscarCardNoIndice(indexPath.item) else { return cardViewCell }
        cardViewCell.resetarCardView(card)
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
        
        let tempoDeDelay = DispatchTime.now() + 0.5
        DispatchQueue.main.asyncAfter(deadline: tempoDeDelay) {
            //TODO: separar em funcao
            for cardDevemVirar in cards {
                guard let index = cardDevemVirar.indice else { continue }
                let cell = collectionView.cellForItem(at: IndexPath(item: index, section:0)) as! CardViewCell
                cell.memoriaImageView.image = cardDevemVirar.imagemDefault
            }
        }
    }
}
