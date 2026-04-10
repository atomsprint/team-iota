//
//  FirstViewController.swift
//  Iota_SDGs
//
//  Created by 永田　花道 on 2025/11/09.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var pointLabel: UILabel!
    
    @IBAction func unwindToHome(segue: UIStoryboardSegue) {}
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        updatePointsLabel()
        
        NotificationCenter.default.addObserver(self, selector: #selector(pointsUpdated), name: .pointsUpdated, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func pointsUpdated() {
        updatePointsLabel()
    }
    
    func updatePointsLabel() {
        let name = SettingsManager.shared.userName.isEmpty ? "ゲスト" : SettingsManager.shared.userName
        pointLabel.text = "\(name)さんは現在\(PointsManager.shared.points)ポイントです"
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
