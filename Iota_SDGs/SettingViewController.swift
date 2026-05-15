import UIKit

class SettingViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var statusLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        nameTextField.addTarget(self, action: #selector(nameDidChange), for: .editingChanged)
        nameTextField.text = AccountManager.shared.currentUserName
        let account = AccountManager.shared.getCurrentAccount()
        ageTextField.text = account.age
        updateStatusLabel()

        NotificationCenter.default.addObserver(self, selector: #selector(pointsUpdated), name: .pointsUpdated, object: nil)
    }

    @objc func nameDidChange(_ textField: UITextField) {
        let name = textField.text ?? ""
        if name.isEmpty { return }
        AccountManager.shared.currentUserName = name
        let account = AccountManager.shared.getCurrentAccount()
        
        // 切り替わった人の年齢を画面に出す
        ageTextField.text = account.age
        updateStatusLabel()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        saveCurrentUserData()
    }

    func saveCurrentUserData() {
        let name = nameTextField.text ?? ""
        if name.isEmpty { return }
        
        AccountManager.shared.currentUserName = name
        AccountManager.shared.updateAccount(age: ageTextField.text ?? "")
    }

    @objc private func pointsUpdated() {
        updateStatusLabel()
    }

    private func updateStatusLabel() {
        let account = AccountManager.shared.getCurrentAccount()
        let name = account.name.isEmpty ? "ゲスト" : account.name
        statusLabel.text = "\(name)さんは現在\(account.points)ポイントです"
    }

    @IBAction func addPointButtonTapped(_ sender: Any) {
        let name = nameTextField.text ?? ""
        if name.isEmpty { return }

        var account = AccountManager.shared.getCurrentAccount()
        account.points += 10
        AccountManager.shared.updateAccount(age: ageTextField.text ?? "", points: account.points)
        updateStatusLabel()
    }
    
    @IBAction func subtractPointButtonTapped(_ sender: Any) {
        let name = nameTextField.text ?? ""
        if name.isEmpty { return }

        var account = AccountManager.shared.getCurrentAccount()
        account.points = max(0, account.points - 10)
        AccountManager.shared.updateAccount(age: ageTextField.text ?? "", points: account.points)
        updateStatusLabel()
    }
    
    @IBAction func clearButtonTapped(_ sender: Any) {
        let name = nameTextField.text ?? ""
        if name.isEmpty { return }

        AccountManager.shared.updateAccount(age: ageTextField.text ?? "", points: 0)
        updateStatusLabel()
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
