//
//  fourViewController.swift
//  Iota_SDGs
//
//  Created by 永田　花道 on 2025/11/10.
//

import UIKit

class SettingViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loadSettings()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        saveSettings()
    }

    func saveSettings() {
        SettingsManager.shared.userName = nameTextField.text ?? ""
        SettingsManager.shared.userAge = ageTextField.text ?? ""
    }

    func loadSettings() {
        SettingsManager.shared.loadSettings()
        nameTextField.text = SettingsManager.shared.userName
        ageTextField.text = SettingsManager.shared.userAge
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
