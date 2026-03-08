//
//  SecondViewController.swift
//  Iota_SDGs
//
//  Created by 永田　花道 on 2025/11/09.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var iotaImageView: UIImageView!
    @IBOutlet weak var pointLabel: UILabel!
    
    let pointlmageDictionary:[Int:String]=[
        0:"iota-removebg-preview",
        10:"iota-1",
        20:"iota-2",
        30:"iota-3",
        40:"iota-4",
        50:"iota-5",
        60:"iota-6",
        70:"iota-7",
        80:"iota-8",
        90:"iota-9",
        100:"iota-gold"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 通知を受け取って表示を更新
        NotificationCenter.default.addObserver(self, selector: #selector(updatePointDisplay), name: .pointsUpdated, object: nil)
        updatePointDisplay()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // 表示するたび最新のポイントにする
        updatePointDisplay()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
        
        @IBAction func addPointButtonTapped(_ sender: Any) {
            PointsManager.shared.add(10)
        }
        
        @IBAction func subtractPointButtonTapped(_ sender: Any) {
            // デバッグ用にマイナス10ポイント
            PointsManager.shared.add(-10)
        }
        
        @IBAction func clearButtonTapped(_ sender: Any) {
            PointsManager.shared.reset()
        }
        
        @objc func updatePointDisplay() {
            let currentPoint = PointsManager.shared.points
            // ポイント数に応じて画像を変更（100pt以上はiota-gold固定）
            let imageKey = min((currentPoint / 10) * 10, 100)
            if let imageName = pointlmageDictionary[imageKey] {
                iotaImageView?.image = UIImage(named: imageName)
            }
            
            // ラベルを更新
            pointLabel?.text = "今は\(currentPoint)ptだよ！"
        }
}
