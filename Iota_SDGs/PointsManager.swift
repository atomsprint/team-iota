import Foundation

/// ポイント管理クラス
class PointsManager {
    static let shared = PointsManager()
    private init() {}
    
    /// 現在のポイント
    private(set) var points: Int = 0 {
        didSet {
            NotificationCenter.default.post(name: .pointsUpdated, object: nil)
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
