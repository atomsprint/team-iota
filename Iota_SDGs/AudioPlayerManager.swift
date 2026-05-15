import Foundation
import AVFoundation

final class AudioPlayerManager {

    private var audioPlayer: AVAudioPlayer?

    func load(fileName: String, fileExtension: String = "mp3") {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: fileExtension) else {
            print("音声ファイルが見つかりません: \(fileName).\(fileExtension)")
            return
        }

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.prepareToPlay()
        } catch {
            print("音声読み込みエラー: \(error)")
        }
    }

    func play(loop: Bool = true) {
        if loop {
            audioPlayer?.numberOfLoops = -1
        } else {
            audioPlayer?.numberOfLoops = 0
        }
        audioPlayer?.play()
    }

    func stop() {
        audioPlayer?.stop()
        audioPlayer?.currentTime = 0
    }

    func pause() {
        audioPlayer?.pause()
    }
}
