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
        "🌟今日食べたものがどこでつくられたかを調べた",
        "🌟住んでいる街のゴミの分別について調べた",
        "🌟使ってないコンセントを抜いた",
        "🌟マイボトル、マイ箸を使った",
        "🌟シャワーの時間を１分短くした",
        "🌟ご飯を全部食べた",
        "🌟階段を使った",
        "🌟電気をこまめに消した",
        "🌟エコバッグを使った",
        "🌟水を出しっぱなしにしなかった",
        "🌟運動をした",
        "🌟トイレットペーパーを少なく使った",
        "🌟今日食べたものがどこでつくられたかを調べた",
        "🌟自分の住んでいる街のゴミの分別を調べた",
        "🌟食器の油汚れを拭いた",
        "🌟お手伝いをした",
        "🌟近所の緊急避難所の場所を調べた",
        "🌟「ジェンダー」について調べた",
        "🌟今日あったいいことを誰かに話した",
        "🌟家の周りの虫を観察した",
        "🌟ゴミを十個拾った",
        "🌟「マイクロプラスチック」について調べた",
        "🌟原子力発電所のことを大人に聞いた",
        "🌟親や親戚の大人に仕事について聞いた",
        "🌟電車やバスで席を譲った",
        "🌟「フェアトレード商品を探した",
        "🌟家族と、災害時にどう動くかを話し合った",
        "🌟いらなくなった服などを人に譲った",
        "🌟SDGsのことを親に１分説明した",
        "🌟自分の家で１日にでたゴミの量を測った",
        "🌟森へ行って自然を観察した",
        "🌟妊婦さんや体が不自由な方を手伝った",
        "🌟原爆についてノートにまとめ、親に発表した",
        "🌟戦争や平和に関する博物館などに行った",
        "🌟地域のゴミ拾い活動に参加した",
        "🌟植林活動に参加した",
        "🌟農家さんにインタビューした",
    
    
    
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
            resultLabel.text = "ミッションコンプリート！\n\n30ポイントゲット！"
            if !missionCompleted {
                let account = AccountManager.shared.getCurrentAccount()
                let newPoints = account.points + 30
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
