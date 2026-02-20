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
        0:"iota-1",
        10:"iota-2",
        20:"iota-3",
        30:"iota-4",
        40:"iota-5",
        50:"iota-6",
        60:"iota-7",
        70:"iota-8",
        80:"iota-9",
        90:"iota-gold"
    ]
    var currentPoint: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentPoint = 0
        updatePointDisplay()
        // Do any additional setup after loading the view.
    }
       
    /*
     // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation hello!　hello-test-commit
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func addPointButtonTapped(_ sender: Any) {
        currentPoint += 10
        if currentPoint > 90 {
            currentPoint = 90
        }
        updatePointDisplay()
        
    }
    
    
    @IBAction func clearButtonTapped(_ sender: Any) {
        currentPoint = 0
        updatePointDisplay()
    }
    
    func updatePointDisplay() {
        // ポイント数に応じて画像を変更
        let imageKey = (currentPoint / 10) * 10
        if let imageName = pointlmageDictionary[imageKey] {
            iotaImageView.image = UIImage(named: imageName)
        }
        
        // ラベルを更新
        pointLabel.text = "今は\(currentPoint)ptだよ！"
    }
    
}
