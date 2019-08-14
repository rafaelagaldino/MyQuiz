//
//  PlayQuizViewController.swift
//  MyQuiz
//
//  Copyright © 2019 Rafaela Galdino. All rights reserved.
//

import UIKit

class PlayQuizViewController: UIViewController {
    
    @IBOutlet weak var _question: UILabel!
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    @IBOutlet weak var answer4: UIButton!
    @IBOutlet weak var answer5: UIButton!
    @IBOutlet weak var placar: UILabel!
    
    var quiz: QuizViewModel!
    
    override func viewDidLoad() {
        showQuestion(quiz.current)
    }
    
    func showQuestion(_ question : Question) {
        _question.text = question.text
        answer1.setTitle(question.answers[0], for: .normal)
        answer2.setTitle(question.answers[1], for: .normal)
        answer3.setTitle(question.answers[2], for: .normal)
        answer4.setTitle(question.answers[3], for: .normal)
        answer5.setTitle(question.answers[4], for: .normal)
    }
    
    func next() {
        if (!quiz.isLast) { // se não é a última questão
            quiz.next()
        } else {
            self.message()
        }
        showQuestion(quiz.current)
    }
    
    func message() {
        let action = UIAlertAction(title: "Continuar",
                                   style: .default) { (action) in
                                    self.quiz.finish()
                                    self.quiz.reset()
                                    self.navigationController?.popViewController(animated: true)
        }
        
        let alert = UIAlertController(title: "Fim!", message: "Placar: \(quiz.score)", preferredStyle: .alert)
        alert.addAction(action)
        
        self.present(alert, animated: true) {
        }
    }
    
    @IBAction func answer(_ sender: UIButton) {
        _ = quiz.checkAnswer(sender.tag)
        placar.text = String(quiz.score)
        
        self.next()
    }

}
