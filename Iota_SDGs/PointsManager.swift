import Foundation

/// ポイント管理クラス
class PointsManager {
    static let shared = PointsManager()
    private init() {
        loadPoints()
    }
    
    /// 現在のポイント
    private(set) var points: Int = 0 {
        didSet {
            NotificationCenter.default.post(name: .pointsUpdated, object: nil)
            savePoints()
        }
    }
    
    private let pointsFileName = "points.json"
    
    private func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    private func pointsFileURL() -> URL {
        return getDocumentsDirectory().appendingPathComponent(pointsFileName)
    }
    
    func printPointsFilePath() {
        print("Points file path: \(pointsFileURL().path)")
    }
    
    func savePoints() {
        let pointsData = ["points": points]
        do {
            let data = try JSONSerialization.data(withJSONObject: pointsData, options: [])
            try data.write(to: pointsFileURL())
        } catch {
            print("Failed to save points: \(error)")
        }
    }
    
    func loadPoints() {
        do {
            let data = try Data(contentsOf: pointsFileURL())
            if let pointsData = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Int] {
                points = pointsData["points"] ?? 0
            }
        } catch {
            print("Failed to load points: \(error)")
        }
    }

    /// ポイントを追加する
    func add(_ amount: Int) {
        guard amount != 0 else { return }
        points += amount
        // 最大10000ポイントまで
        if points > 10000 {
            points = 10000
        }
        if points < 0 {
            points = 0
        }
    }

    /// ポイントを減らす
    func subtract(_ amount: Int) {
        guard amount > 0 else { return }
        add(-amount)
    }
    
    /// ポイントをリセットする
    func reset() {
        points = 0
    }
}

// Notification.Nameの拡張で更新通知を定義
extension Notification.Name {
    static let pointsUpdated = Notification.Name("pointsUpdated")
}
