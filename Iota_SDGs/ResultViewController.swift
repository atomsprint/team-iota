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
    /// 自動で画面を閉じるためのタイマー
    private var autoCloseTimer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 結果を設定
        showResult()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // 画面が表示されたら3秒後に閉じる
        startAutoCloseTimer()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        autoCloseTimer?.invalidate()
    }
    
    private func startAutoCloseTimer() {
        autoCloseTimer?.invalidate()
        autoCloseTimer = Timer.scheduledTimer(timeInterval: 3.0,
                                              target: self,
                                              selector: #selector(closeScreen),
                                              userInfo: nil,
                                              repeats: false)
    }
    
    @objc private func closeScreen() {
        dismiss(animated: true, completion: nil)
    }
    
    func showResult() {
        resultLabel.numberOfLines = 0
        
        if correctCount == 5 {
            resultLabel.text = "全問正解だ！\nいいね！"
            
        } else if correctCount == 4 {
            resultLabel.text = "もう一息！\nがんばれ！"
            
        } else if correctCount == 3 {
            resultLabel.text = "あとちょっと！\nもう一回！"
            
        } else {
            resultLabel.text = "もう一度\n頑張ろう！"
        }
    }
}
