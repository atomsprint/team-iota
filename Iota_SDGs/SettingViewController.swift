import UIKit

class SettingViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!


    override func viewDidLoad() {
        super.viewDidLoad()

        nameTextField.addTarget(self, action: #selector(nameDidChange), for: .editingChanged)
    }

    @objc func nameDidChange(_ textField: UITextField) {
        let name = textField.text ?? ""
        if name.isEmpty { return }
        AccountManager.shared.currentUserName = name
        let account = AccountManager.shared.getCurrentAccount()
        
        // 切り替わった人の年齢を画面に出す
        ageTextField.text = account.age
        

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

    @IBAction func addPointButtonTapped(_ sender: Any) {
        let name = nameTextField.text ?? ""
        if name.isEmpty { return }

        var account = AccountManager.shared.getCurrentAccount()
        account.points += 10
        AccountManager.shared.updateAccount(age: ageTextField.text ?? "", points: account.points)

    }

}
