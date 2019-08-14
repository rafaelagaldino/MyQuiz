//
//  ViewController.swift
//  MyQuiz
//

import UIKit

class ViewController: UIViewController {

    var quiz: QuizViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        quiz = QuizViewModel()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "quiz" {
            let next = segue.destination as! PlayQuizViewController
            next.quiz = quiz
        } else if segue.identifier == "edit" {
            let next = segue.destination as! QuestionTableViewController
            next.quiz = quiz
        }
    }

}

