//
//  PerguntasTableViewController.swift
//  MyQuiz
//
//  Copyright © 2019 Rafaela Galdino. All rights reserved.
//

import UIKit

class QuestionTableViewController: UITableViewController {

    var quiz: QuizViewModel!
    var selectedIndex: Int = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItems?.append(editButtonItem)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quiz.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListQuestions", for: indexPath)
        let perguntas = quiz.questions[indexPath.row]
        cell.textLabel?.text = perguntas.text

        return cell
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            quiz.remove(indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func addQuestion(_ question : Question) {
        quiz.add(question)
        quiz.saveData()
        
        let cell = IndexPath(row: quiz.questions.count - 1, section: 0)
        tableView.beginUpdates()
        tableView.insertRows(at: [cell], with: .bottom)
        tableView.endUpdates()
    }
    
    func editQuestion(_ question : Question) {
        let index = tableView.indexPathForSelectedRow?.row
        quiz.questions[index!].text = question.text
        quiz.questions[index!].answers[0] = question.answers[0]
        quiz.questions[index!].answers[1] = question.answers[1]
        quiz.questions[index!].answers[2] = question.answers[2]
        quiz.questions[index!].answers[3] = question.answers[3]
        quiz.questions[index!].answers[4] = question.answers[4]
        quiz.saveData()
        self.tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let next = segue.destination as! EditQuestionViewController
        next.owner = self
        if segue.identifier == "edit" {
            next.editQuestion = quiz.questions[(tableView.indexPathForSelectedRow?.row)!]
        } else {
            next.editQuestion = nil
        }
    }
}
