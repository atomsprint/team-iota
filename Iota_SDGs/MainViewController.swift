//
//  FirstViewController.swift
//  Iota_SDGs
//
//  Created by 永田　花道 on 2025/11/09.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var pointLabel: UILabel!
    @IBOutlet weak var earthImageView: UIImageView!
    
    @IBAction func unwindToHome(segue: UIStoryboardSegue) {}
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        updatePointsLabel()
        
        NotificationCenter.default.addObserver(self, selector: #selector(pointsUpdated), name: .pointsUpdated, object: nil)
    }
    
    let pointlmageDictionary:[Int:String]=[
        0:"地球（ラフ 透明化）",
        100:"地球（ラフ 透明化）",
        300:"地球（ラフ 透明化）",
        700:"地球（ラフ 透明化）",
        1000:"地球（ラフ 透明化）",
        1300:"地球（ラフ 透明化）",
        1700:"地球（ラフ 透明化）",
        2000:"地球（ラフ 透明化）",
        2500:"地球（ラフ 透明化）",
        2900:"地球（ラフ 透明化）",
        3500:"地球（ラフ 透明化）"
    ]

    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func pointsUpdated() {
        updatePointsLabel()
        updateImage()
    }
    
    func updatePointsLabel() {
        let name = SettingsManager.shared.userName.isEmpty ? "ゲスト" : SettingsManager.shared.userName
        pointLabel.text = "\(name)さんは現在\(PointsManager.shared.points)ポイントです"
    }
    
    func updateImage() {
        let currentPoint = PointsManager.shared.points
        // ポイント数に応じて画像を変更（100pt以上は固定）
        let imageKey = min((currentPoint / 10) * 10, 100)
        if let imageName = pointlmageDictionary[imageKey] {
            earthImageView?.image = UIImage(named: imageName)
        }
    }

}
