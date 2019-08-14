//
//  EditrQuestaoViewController.swift
//  MyQuiz
//
//  Copyright © 2019 Rafaela Galdino. All rights reserved.
//

import UIKit

class EditQuestionViewController: UIViewController {
 
    @IBOutlet weak var txtQuestion: UITextView!
    @IBOutlet weak var txtAnswer1: UITextField!
    @IBOutlet weak var txtAnswer2: UITextField!
    @IBOutlet weak var txtAnswer3: UITextField!
    @IBOutlet weak var txtAnswer4: UITextField!
    @IBOutlet weak var txtAnswer5: UITextField!

    var editQuestion: Question?
    
    var owner: QuestionTableViewController?

    override func viewWillAppear(_ animated: Bool) {
        if editQuestion != nil {
            txtQuestion.text = editQuestion?.text
            txtAnswer1.text = editQuestion?.answers[0]
            txtAnswer2.text = editQuestion?.answers[1]
            txtAnswer3.text = editQuestion?.answers[2]
            txtAnswer4.text = editQuestion?.answers[3]
            txtAnswer5.text = editQuestion?.answers[4]
        }
    }
    
    @IBAction func cancel(_ sender:  UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func save(_ sender:  UIBarButtonItem) {
   
        print("chamou &&&&&&&&&&&&")
        let q = Question()
        q.text = txtQuestion.text!
        q.answers.append(txtAnswer1.text!)
        q.answers.append(txtAnswer2.text!)
        q.answers.append(txtAnswer3.text!)
        q.answers.append(txtAnswer4.text!)
        q.answers.append(txtAnswer5.text!)

        if (editQuestion != nil) {
            owner?.editQuestion(q)
        }
        else {
            owner?.addQuestion(q)
        }
        navigationController?.popViewController(animated: true)
    }
}
