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
        updatePointsLabel()
        
        NotificationCenter.default.addObserver(self, selector: #selector(pointsUpdated), name: .pointsUpdated, object: nil)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updatePointsLabel()
        updateImage()
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
        3500:"地球（ラフ 透明化）"]

    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func pointsUpdated() {
            updatePointsLabel()
            updateImage()
        }

        func updatePointsLabel() {
            let account = AccountManager.shared.getCurrentAccount()
            let name = account.name.isEmpty ? "ゲスト" : account.name
            pointLabel.text = "\(name)さんは現在\(account.points)ポイントです"
        }

        func updateImage() {
            let account = AccountManager.shared.getCurrentAccount()
            let currentPoint = account.points
            
            let imageKey = min((currentPoint / 10) * 10, 100)
            if let imageName = pointlmageDictionary[imageKey] {
                earthImageView?.image = UIImage(named: imageName)
            }
        }
    }
