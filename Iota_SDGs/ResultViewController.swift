//
//  ResultViewController.swift
//  Iota_SDGs
//
//  Created by 永田　花道 on 2026/02/19.
//

import UIKit

class ResultViewController: UIViewController {

    var correctCount = 0
    
    @IBOutlet weak var resultLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func showResult() {
            if correctCount == 3 {
                resultLabel.text = "🌟 かんぺき！ 🌟\n\n3問せいかい！\n\n宇宙博士！"
                resultLabel.textColor = .orange
                
            } else if correctCount == 2 {
                resultLabel.text = "🥈 すごい！ 🥈\n\n2問せいかい！\n\nもうちょっと！"
                resultLabel.textColor = .green
                
            } else if correctCount == 1 {
                resultLabel.text = "🥉 がんばった！ 🥉\n\n1問せいかい！\n\n次はもっとできるよ！"
                resultLabel.textColor = .blue
                
            } else {
                resultLabel.text = "📚 ざんねん 📚\n\n0問せいかい...\n\nまた挑戦してね！"
                resultLabel.textColor = .gray
            }
        }
    }

