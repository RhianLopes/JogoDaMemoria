//
//  CardTests.swift
//  JogoDaMemoriaTests
//
//  Created by Rhian Lopes da Costa on 12/10/20.
//

import UIKit
import Quick
import Nimble

@testable import JogoDaMemoria

class CardTests: QuickSpec {
    
    override func spec() {
        var card: Card!
        beforeEach {
            card = Card(UIImage(named: "card_0")!, 0)
        }
        describe("ao jogar normalmente") {
            context("ao renderizar os cards") {
                it("deve salvar o indice no card") {
                    let indice = 0
                    
                    card.salvarIndice(indice)
                    expect(card.indice).to(equal(indice))
                }
                it("deve buscar cards default") {
                    let cards = Card.buscarCards()
                    expect(cards.count).to(equal(10))
                }
            }
            context("selecionar algum card") {
                it("deve vira-lo para posicao memoria") {
                    card.virarCardPosicaoMemoria()
                    expect(card.estaVisivel).to(beTrue())
                }
            }
            context("selecionar um card diferente do ja selecionado") {
                it("deve vira-lo para posicao default") {
                    card.virarCardPosicaoDefault()
                    expect(card.estaVisivel).to(beFalse())
                }
            }
        }
    }
}
