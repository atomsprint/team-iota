//
//  QuizViewController.swift
//  Iota_SDGs
//
//  Created by 永田　花道 on 2026/02/17.
//

import UIKit

class QuizViewController: UIViewController {
    @IBOutlet weak var quizNumberLabel: UILabel!
    @IBOutlet weak var quizLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var maruButton: UIButton!
    @IBOutlet weak var batsuButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    var questionNumber = 0
    var correctCount = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        quizlist.shuffle()
        quizlist = Array(quizlist.prefix(5))
        showQuestion()
    }

    func showQuestion() {
        let quiz = quizlist[questionNumber]
        
        quizNumberLabel.text = "第" + String(questionNumber + 1) + "問"
        quizLabel.text = quiz.question
        
        resultLabel.text = ""
        nextButton.isHidden = true
        
        maruButton.isEnabled = true
        batsuButton.isEnabled = true
    }
    
    func checkAnswer(selected: Bool) {
            let quiz = quizlist[questionNumber]
            let account = AccountManager.shared.getCurrentAccount()
            var currentPoints = account.points

            if selected == quiz.answer {
                resultLabel.text = "⭕️"
                resultLabel.textColor = .red
                correctCount += 1

                currentPoints += 10
            } else {
                resultLabel.text = "❌"
                resultLabel.textColor = .blue

                currentPoints -= 10
            }

            AccountManager.shared.updateAccount(age: account.age, points: currentPoints)
            
            maruButton.isEnabled = false
            batsuButton.isEnabled = false
            
            if questionNumber == quizlist.count - 1 {
                nextButton.setTitle("結果を見る", for: .normal)
            }
            nextButton.isHidden = false
        }
    @IBAction func maruTapped(_ sender: Any) {
        checkAnswer(selected: true)
    }
    
    @IBAction func batsuTapped(_ sender: Any) {
        checkAnswer(selected: false)
    }
    
    @IBAction func nextTapped(_ sender: Any) {
        questionNumber = questionNumber + 1
        if questionNumber < quizlist.count {
            showQuestion()
        } else {
            performSegue(withIdentifier: "toResult", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResult" {
            let resultVC = segue.destination as! ResultViewController

            resultVC.correctCount = correctCount
        }
    }

}
