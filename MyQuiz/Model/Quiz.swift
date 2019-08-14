//
//  Quiz.swift
//  MyQuiz
//
//  Copyright © 2019 Rafaela Galdino. All rights reserved.
//

import Foundation

class Quiz {
    var questions: [Question]
    
    func add(_ question: Question) {
        questions.append(question)
    }
    
    func remove(_ number : Int) {
        questions.remove(at: number)
    }
    
    init() {
        questions = [Question]()
        
        var q = Question()
        q.text = "Qual das cinco representa a melhor comparação? Água está para o gelo assim como leite está para..."
        q.answers.append("Mel")
        q.answers.append("Queijo")
        q.answers.append("Café")
        q.answers.append("Mingau")
        q.answers.append("Biscoito")
        q.answerCorrect = 2
        self.add(q)

        q = Question()
        q.text = "As letras ECHOOL depois de colocadas em ordem, será o nome de..."
        q.answers.append("Um país")
        q.answers.append("Uma cidade")
        q.answers.append("Um animal")
        q.answers.append("Um oceano")
        q.answers.append("Um estado")
        q.answerCorrect = 3
        self.add(q)
        
        q = Question()
        q.text = "Para que a frase: A roupa tempestade roeu o rato, depois de arrumada, faça sentido, que palavra deve ser retirada?"
        q.answers.append("Rato")
        q.answers.append("Tempestade")
        q.answers.append("Roupa")
        q.answers.append("Roeu")
        q.answers.append("Os artigos")
        q.answerCorrect = 2
        self.add(q)

        q = Question()
        q.text = "Depois de ordenadas as letras, uma das palavras abaixo não tem nenhuma relação com as outras."
        q.answers.append("L P A E P")
        q.answers.append("R A H C O B A R")
        q.answers.append("E R F O R")
        q.answers.append("A C E N A T")
        q.answers.append("A L I S P")
        q.answerCorrect = 3
        self.add(q)
        
        q = Question()
        q.text = "Qual dos cinco itens se parece menos com os outros?"
        q.answers.append("Paladar")
        q.answers.append("Sorriso")
        q.answers.append("Tato")
        q.answers.append("Audição")
        q.answers.append("Visão")
        q.answerCorrect = 2
        self.add(q)
        
        q = Question()
        q.text = "Qual dos cinco itens representa a melhor comparação? árvore está para o chão assim como chaminé está para..."
        q.answers.append("Fumaça")
        q.answers.append("Céu")
        q.answers.append("Tijolo")
        q.answers.append("Casa")
        q.answers.append("Garagem")
        q.answerCorrect = 4
        self.add(q)
       
        q = Question()
        q.text = "Depois de doar um quarto de sua mesada ao irmão, e ganhar mais cinco reais, ele ficou com 20 reais. Qual era o valor de sua mesada?"
        q.answers.append("20 reais")
        q.answers.append("10 reais")
        q.answers.append("30 reais")
        q.answers.append("35 reais")
        q.answers.append("25 reais")
        q.answerCorrect = 1
        self.add(q)
    }
}
