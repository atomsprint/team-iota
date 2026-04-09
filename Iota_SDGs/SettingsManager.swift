import Foundation

/// 設定管理クラス
class SettingsManager {
    static let shared = SettingsManager()
    private init() {}
    
    /// ユーザー名
    var userName: String = "" {
        didSet {
            saveSettings()
        }
    }
    
    /// 年齢
    var userAge: String = "" {
        didSet {
            saveSettings()
        }
    }
    
    private let settingsFileName = "settings.json"
    
    private func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    private func settingsFileURL() -> URL {
        return getDocumentsDirectory().appendingPathComponent(settingsFileName)
    }
    
    func saveSettings() {
        let settings = ["userName": userName, "userAge": userAge]
        do {
            let data = try JSONSerialization.data(withJSONObject: settings, options: [])
            try data.write(to: settingsFileURL())
        } catch {
            print("Failed to save settings: \(error)")
        }
    }
    
    func loadSettings() {
        do {
            let data = try Data(contentsOf: settingsFileURL())
            if let settings = try JSONSerialization.jsonObject(with: data, options: []) as? [String: String] {
                userName = settings["userName"] ?? ""
                userAge = settings["userAge"] ?? ""
            }
        } catch {
            print("Failed to load settings: \(error)")
        }
    }
}