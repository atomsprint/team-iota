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

        // Do any additional setup after loading the view.
        quizList.shuffle()

        showQuestion()
    }

    func showQuestion() {
        // quizListから現在の問題を取得
        let quiz = quizList[questionNumber]
        
        quizNumberLabel.text = "第" + String(questionNumber + 1) + "問"
        quizLabel.text = quiz.question
        
        resultLabel.text = ""
        nextButton.isHidden = true
        
        maruButton.isEnabled = true
        batsuButton.isEnabled = true
    }
    
    func checkAnswer(selected: Bool) {
        let quiz = quizList[questionNumber]
        
        if selected == quiz.answer {
            resultLabel.text = "⭕️"
            resultLabel.textColor = .red
            correctCount += 1
        } else {
            resultLabel.text = "❌"
            resultLabel.textColor = .blue
        }
        
        maruButton.isEnabled = false
        batsuButton.isEnabled = false
        
        if questionNumber == quizList.count - 1 {
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
        // 問題番号を1つ進める
        questionNumber = questionNumber + 1
        // まだ問題が残ってるかチェック
        if questionNumber < quizList.count {
            // 次の問題を表示
            showQuestion()
        } else {
            // 全問終了 → 結果画面へ移動
            performSegue(withIdentifier: "toResult", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Segueの名前が"toResult"なら
        if segue.identifier == "toResult" {
            
            // 次の画面（ResultViewController）を取得
            let resultVC = segue.destination as! ResultViewController
            
            // 正解数を渡す
            resultVC.correctCount = correctCount
        }
    }

}
