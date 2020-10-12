//
//  JogoDaMemoriaTests.swift
//  JogoDaMemoriaTests
//
//  Created by Rhian Lopes da Costa on 10/10/20.
//

import UIKit
import Quick
import Nimble

@testable import JogoDaMemoria

class JogoDaMemoriaTests: QuickSpec {

    override func spec() {
        var jogo: JogoDaMemoria!
        beforeEach {
            jogo = JogoDaMemoria()
        }
        
        describe("ao jogar normalmente") {
            context("ao iniciar o jogo") {
                it("deve iniciar o jogo normalmente com 10 cards embaralhados") {
                    jogo.novoJogo()
                    expect(jogo.cards.count).to(equal(10))
                    expect(jogo.cardsMostrados.count).to(equal(.zero))
                    expect(jogo.cardsEmSelecao.count).to(equal(.zero))
                    expect(jogo.contadorTentativas).to(equal(.zero))
                }
            }
            context("ao reiniciar o jogo") {
                it("deve resetar zerando todas as propiedades") {
                    jogo.resetarJogo()
                    expect(jogo.cards.count).to(equal(.zero))
                    expect(jogo.cardsMostrados.count).to(equal(.zero))
                    expect(jogo.cardsEmSelecao.count).to(equal(.zero))
                    expect(jogo.contadorTentativas).to(equal(.zero))
                }
            }
            context("ao buscar card pelo indice") {
                it("deve possuir indice valido salvar indice") {
                    let card = Card(UIImage(named: "card_0")!, 0)
                    let indice = 0
                    
                    jogo.cards.append(card)
                    let cardEsperado = jogo.buscarCardNoIndice(indice)
                    expect(jogo.cards[0].pairId).to(equal(cardEsperado?.pairId))
                    expect(jogo.cards[0].indice).to(equal(cardEsperado?.indice))
                }
                it("deve possuir indice invalido") {
                    let card = Card(UIImage(named: "card_0")!, 0)
                    let indice = 1
                    
                    jogo.cards.append(card)
                    let cardEsperado = jogo.buscarCardNoIndice(indice)
                    expect(cardEsperado).to(beNil())
                }
            }
            context("ao buscar card pelo indice") {
                it("deve validar que possui apenas um card selecionado") {
                    let indice = 0
                    let card = Card(UIImage(named: "card_0")!, 0)
                    card.indice = indice
                    
                    let cardsDevemVirar = jogo.validarCardsDevemVirar(card: card)
                    expect(jogo.cardsEmSelecao.count).to(equal(1))
                    expect(jogo.cardsEmSelecao[0].indice).to(equal(indice))
                    expect(cardsDevemVirar).to(beEmpty())
                }
                it("deve validar que possui dois cards selecionados mas nao sao pares") {
                    let primeiroPairId = 0
                    let segundoPairId = 1
                    let primeiroIndice = 0
                    let segundoIndice = 1
                    let primeiroCard = Card(UIImage(named: "card_0")!, primeiroPairId)
                    primeiroCard.indice = primeiroIndice
                    let segundoCard = Card(UIImage(named: "card_1")!, segundoPairId)
                    segundoCard.indice = segundoIndice
                    
                    jogo.cardsEmSelecao.append(primeiroCard)
                    let cardsDevemVirar = jogo.validarCardsDevemVirar(card: segundoCard)
                    expect(cardsDevemVirar[0].indice).to(equal(primeiroIndice))
                    expect(cardsDevemVirar[0].pairId).to(equal(primeiroPairId))
                    expect(cardsDevemVirar[1].indice).to(equal(segundoIndice))
                    expect(cardsDevemVirar[1].pairId).to(equal(segundoPairId))
                    expect(jogo.cardsEmSelecao).to(beEmpty())
                }
                it("deve validar que possui dois cards selecionados e sao pares") {
                    let primeiroPairId = 0
                    let segundoPairId = 0
                    let primeiroIndice = 0
                    let segundoIndice = 1
                    let primeiroCard = Card(UIImage(named: "card_0")!, primeiroPairId)
                    primeiroCard.indice = primeiroIndice
                    let segundoCard = Card(UIImage(named: "card_0")!, segundoPairId)
                    segundoCard.indice = segundoIndice
                    
                    jogo.cardsEmSelecao.append(primeiroCard)
                    let cardsDevemVirar = jogo.validarCardsDevemVirar(card: segundoCard)
                    expect(cardsDevemVirar).to(beEmpty())
                    expect(jogo.cardsEmSelecao).to(beEmpty())
                    expect(jogo.cardsMostrados[0].indice).to(equal(primeiroIndice))
                    expect(jogo.cardsMostrados[0].pairId).to(equal(primeiroPairId))
                    expect(jogo.cardsMostrados[1].indice).to(equal(segundoIndice))
                    expect(jogo.cardsMostrados[1].pairId).to(equal(segundoPairId))
                }
            }
        }
    }

}
