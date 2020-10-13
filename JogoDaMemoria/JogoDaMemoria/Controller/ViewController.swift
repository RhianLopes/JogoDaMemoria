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
    var acao: UIAlertAction { UIAlertAction(title: "Bacana, bora de novo", style: .default) { _ in
            self.resetarJogo()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.novoJogo()
    }
    
    @IBAction func reiniciarJogoButton(_ sender: Any) {
        resetarJogo()
    }
    
    func novoJogo() {
        self.jogo.novoJogo()
        cardCollectionView.reloadData()
    }
    
    func resetarJogo() {
        self.jogo.resetarJogo()
        self.jogo.novoJogo()
        self.cardCollectionView.reloadData()
    }

    private func avisarFimDeJogo() {
        let alerta = UIAlertController(title: "Boa, você terminou!", message: "Você precisou de \(self.jogo.contadorTentativas) tentativas para finalizar o jogo da memória.", preferredStyle: .alert)
        alerta.addAction(acao)
        present(alerta, animated: true, completion: nil)
    }
    
    private func virarCardsParaPosicaoDefault(_ cards: [Card], _ collectionView: UICollectionView) {
        let tempoDeDelay = DispatchTime.now() + 0.7
        DispatchQueue.main.asyncAfter(deadline: tempoDeDelay) {
            for cardDeveVirar in cards {
                guard let index = cardDeveVirar.indice else { continue }
                let cell = collectionView.cellForItem(at: IndexPath(item: index, section:0)) as! CardViewCell
                cardDeveVirar.virarCardPosicaoDefault()
                cell.virarCard(cardDeveVirar.imagemDefault)
            }
        }
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.jogo.cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cardViewCell = cardCollectionView.dequeueReusableCell(withReuseIdentifier: "CardViewCell", for: indexPath) as! CardViewCell
        guard let card = jogo.buscarCardNoIndice(indexPath.item) else { return cardViewCell }
        card.virarCardPosicaoDefault()
        cardViewCell.resetarCardView(card)
        card.salvarIndice(indexPath.item)
        
        return cardViewCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cardViewCell = collectionView.cellForItem(at: indexPath) as! CardViewCell
        guard let card = cardViewCell.card else { return }
        if card.estaVisivel { return }
        
        card.virarCardPosicaoMemoria()
        cardViewCell.virarCard(card.imagemMemoria)
        let cards = jogo.validarCardsDevemVirar(card: cardViewCell.card)
        if jogo.jogoFinalizado() {
            avisarFimDeJogo()
        }
        self.virarCardsParaPosicaoDefault(cards, collectionView)
    }
}
