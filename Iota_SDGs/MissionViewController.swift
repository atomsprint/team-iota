//
//  MissionViewController.swift
//  Iota_SDGs
//
//  Created by YukoKobayashi on 2026/04/16.
//

import UIKit

class MissionViewController: UIViewController {
    
    @IBOutlet weak var iotaImageView: UIImageView!
    @IBOutlet weak var switch1: UISwitch!
    @IBOutlet weak var switch2: UISwitch!
    @IBOutlet weak var switch3: UISwitch!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var missionLabel1: UILabel!
    @IBOutlet weak var missionLabel2: UILabel!
    @IBOutlet weak var missionLabel3: UILabel!
    
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
    
    private var missionCompleted = false
    
    private let missions = [
        "🌟ごはんをのこさずたべる",
        "🌟ごみをひろう",
        "🌟みずをながしっぱなしにしない",
        "🌟でんきをこまめにけす",
        "🌟リサイクルする",
        "🌟あるくかじてんしゃをつかう",
        "🌟プラスチックをつかわない",
        "🌟しゅんのやさいをたべる",
        "🌟エコバッグをつかう"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        switch1.isOn = false
        switch2.isOn = false
        switch3.isOn = false

        let selectedMissions = Array(missions.shuffled().prefix(3))
        missionLabel1.text = selectedMissions[0]
        missionLabel2.text = selectedMissions[1]
        missionLabel3.text = selectedMissions[2]
        updateResultLabel()
        updateIotaImage()
    }
    
    @IBAction func switchValueChanged(_ sender: UISwitch) {
        updateResultLabel()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateIotaImage()
    }
    private func updateResultLabel() {
        let onCount = [switch1, switch2, switch3].filter { $0.isOn }.count
        
        switch onCount {
        case 0:
            resultLabel.text = "きょうもがんばろう"
        case 1:
            resultLabel.text = "あと２つ"
        case 2:
            resultLabel.text = "あと１つ"
        case 3:
            resultLabel.text = "ミッションコンプリート！\n\n10ポイントゲット！"
            if !missionCompleted {
                let account = AccountManager.shared.getCurrentAccount()
                let newPoints = account.points + 10
                AccountManager.shared.updateAccount(age: account.age, points: newPoints)
                
                missionCompleted = true
                updateIotaImage()
            }
        default:
            break
        }
    }
    
    @objc func updateIotaImage() {
        let account = AccountManager.shared.getCurrentAccount()
        let currentPoint = account.points
        let imageKey = min((currentPoint / 10) * 10, 100)
        if let imageName = pointlmageDictionary[imageKey] {
            iotaImageView?.image = UIImage(named: imageName)
        }
    }
}
