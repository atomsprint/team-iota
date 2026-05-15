import UIKit

class sdgsViewController: UIViewController {

    let iconNames = [
        "sdg_icon_01_ja_2",
        "sdg_icon_02_ja_2",
        "sdg_icon_03_ja_2",
        "sdg_icon_04_ja_2",
        "sdg_icon_05_ja_2",
        "sdg_icon_06_ja_2",
        "sdg_icon_07_ja_2",
        "sdg_icon_08_ja_2",
        "sdg_icon_09_ja_2",
        "sdg_icon_10_ja_3",
        "sdg_icon_11_ja_2",
        "sdg_icon_12_ja_2",
        "sdg_icon_13_ja_2",
        "sdg_icon_14_ja_2",
        "sdg_icon_15_ja_2",
        "sdg_icon_16_ja_2",
        "sdg_icon_17_ja_2"
    ]

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToDetails" {
            if let destination = segue.destination as? sdgsDetailsViewController,
               let button = sender as? UIButton {
                let tag = button.tag
                if tag >= 1 && tag <= iconNames.count {
                    destination.iconName = iconNames[tag - 1]
                }
            }
        }
    }
}


