//
//  AccountManager.swift
//  Iota_SDGs
//
//  Created by 永田　花道 on 2026/05/03.
//

import Foundation
import Foundation

// ユーザー一人のデータをまとめた箱
struct UserAccount: Codable {
    var name: String
    var age: String
    var points: Int
}

class AccountManager {
    static let shared = AccountManager()
    
    // 全ユーザーのデータを「名前」を鍵にして保存する辞書
    private var allAccounts: [String: UserAccount] = [:]
    
    // 現在操作中のユーザー名
    var currentUserName: String = "" {
        didSet {
            saveCurrentUserName()
        }
    }

    private let saveKey = "SavedAccounts"
    private let currentUserKey = "CurrentUserName"

    init() {
        loadFromDisk()
        loadCurrentUserName()
    }

    // 今の名前のユーザーデータを取得、なければ新規作成
    func getCurrentAccount() -> UserAccount {
        return allAccounts[currentUserName] ?? UserAccount(name: currentUserName, age: "", points: 0)
    }

    // データを更新して保存
    func updateAccount(age: String, points: Int? = nil) {
        var account = getCurrentAccount()
        let previousPoints = account.points
        account.age = age
        if let p = points { account.points = p }
        allAccounts[currentUserName] = account
        saveToDisk()
        if account.points != previousPoints {
            NotificationCenter.default.post(name: .pointsUpdated, object: nil)
        }
    }

    // スマホ本体に保存
    private func saveToDisk() {
        if let encoded = try? JSONEncoder().encode(allAccounts) {
            UserDefaults.standard.set(encoded, forKey: saveKey)
        }
    }

    private func saveCurrentUserName() {
        UserDefaults.standard.set(currentUserName, forKey: currentUserKey)
    }

    private func loadCurrentUserName() {
        if let savedName = UserDefaults.standard.string(forKey: currentUserKey), !savedName.isEmpty {
            currentUserName = savedName
        } else if let firstName = allAccounts.keys.first {
            currentUserName = firstName
        }
    }

    // スマホ本体から読み込み
    private func loadFromDisk() {
        if let data = UserDefaults.standard.data(forKey: saveKey),
           let decoded = try? JSONDecoder().decode([String: UserAccount].self, from: data) {
            allAccounts = decoded
        }
    }
}

// Notification.Nameの拡張で更新通知を定義
extension Notification.Name {
    static let pointsUpdated = Notification.Name("pointsUpdated")
}
