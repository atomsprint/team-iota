import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var pointLabel: UILabel!
    @IBOutlet weak var earthImageView: UIImageView!
    
    @IBAction func unwindToHome(segue: UIStoryboardSegue) {}

    let pointlmageDictionary: [Int: String] = [
        0: "地球1",
        100: "地球2",
        300: "地球2",
        600: "地球２",
        1000: "地球2",
        1300: "地球3",
        1500: "地球3",
        1900: "地球3",
        2400: "地球3",
        2900: "地球4",
        3500: "地球4"
    ]
    
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

        let sortedKeys = pointlmageDictionary.keys.sorted(by: >)
        var targetKey = 0
        
        for key in sortedKeys {
            if currentPoint >= key {
                targetKey = key
                break
            }
        }

        if let imageName = pointlmageDictionary[targetKey] {
            earthImageView?.image = UIImage(named: imageName)
            
            if earthImageView?.image == nil {
                print("エラー発生！")
            }
        }
    }
}
