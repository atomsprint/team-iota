import UIKit

class sdgsDetailsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!

    private var items = [String]()
    
    var iconName: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        print("iconName: \(iconName ?? "nil")")  // デバッグ出力
        if let iconName = iconName {
            iconImageView.image = UIImage(named: iconName)
        }
        items = SDGSDetailsData.items(for: iconName)
        
        setupTableView()
        tableView.reloadData()
    }

    // MARK: - テーブルビュー設定
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("\(items[indexPath.row]) が選択されました")
    }
}


