import UIKit

class HelpDetailsViewController: UIViewController {
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var helpText: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        if let text = helpText {
            descriptionLabel.text = text
        }
    }
    
}
