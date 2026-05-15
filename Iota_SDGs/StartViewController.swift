//
//  StartViewController.swift
//  Iota_SDGs
//
//  Created by 井手 on 2026/04/09.
//

import UIKit

class StartViewController: UIViewController {
    
    private let audioManager = AudioPlayerManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // 事前に音声を読み込む
        audioManager.load(fileName: "start")
    }
    
    override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)

            // 画面が表示されたら再生
            audioManager.play(loop: true)
        print("再生開始: \(audioManager)")
        }

        override func viewDidDisappear(_ animated: Bool) {
            super.viewDidDisappear(animated)

            // 画面遷移後に停止
            audioManager.stop()
        }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
