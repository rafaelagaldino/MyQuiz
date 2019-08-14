//
//  QuizViewModel.swift
//  MyQuiz
//

import Foundation

class QuizViewModel {
    
    private let quiz: Quiz = Quiz()
    
    private (set) var currentNumber = 0
    private (set) var score = 0
    
    let userDefaults = UserDefaults.standard
    
    var record = 0
    
    var file = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Perguntas.plist")
    
    init() {
        record = userDefaults.integer(forKey: "record")
        print(record)
        loadData()
    }
    
    var questions: [Question] {
        return quiz.questions
    }
    
    var current: Question {
        return quiz.questions[currentNumber]
    }
    
    var isLast: Bool {
        return currentNumber == quiz.questions.count - 1
    }
    
    var isFirst: Bool {
        return currentNumber == 0
    }
    
    var count: Int {
        return quiz.questions.count
    }
    
    func reset() {
        currentNumber = 0
        score = 0
    }
    
    func checkAnswer(_ choice: Int) -> Bool {
        print("entrou em checkAnswer \(choice) ******* \(questions[currentNumber].answerCorrect)")
        if choice == questions[currentNumber].answerCorrect {
            score += 1
            print("vai retornar true ", score)
            return true
        }        
        return false
    }
    
    func next() {
        if currentNumber < quiz.questions.count - 1 {
            currentNumber+=1
        }
    }
    
    func previous() {
        if currentNumber > 0 {
            currentNumber-=1
        }
    }
    
    func add(_ question: Question) {
        quiz.add(question)
    }
    
    func remove(_ number : Int) {
        quiz.remove(number)
    }
    
    func finish() {
        userDefaults.set(score, forKey: "record")
        userDefaults.synchronize()
    }
    
    func saveData() {
        let encoder = PropertyListEncoder()
        
        do {
            let dados = try encoder.encode(quiz.questions)
            try dados.write(to: file!)
        } catch {
            print("Erro bla bla bla: \(error)")
        }
    }
    
    func loadData() {
        let decoder = PropertyListDecoder()
        do {
            let dados = try Data(contentsOf: file!)
            quiz.questions =  try decoder.decode([Question].self, from: dados)
        } catch {
            print("Erro bla bla bla: \(error)")
        }
    }
}
