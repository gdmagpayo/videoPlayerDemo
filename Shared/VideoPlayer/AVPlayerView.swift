import AVKit
import SwiftUI

struct AVPlayerView: UIViewControllerRepresentable {

    var videoURL: URL
    var subtitleURL: URL

    private var player: AVPlayer {
        return AVPlayer(url: videoURL)
    }

    func updateUIViewController(_ playerController: AVPlayerViewController, context: Context) {
        playerController.player = player
        
        do {
            try playerController.open(fileFromLocal: subtitleURL, encoding: .utf8)
        } catch {
            print("Errorr")
        }
        
        playerController.addSubtitles()
        playerController.subtitleLabel?.textColor = UIColor.yellow
        playerController.allowsPictureInPicturePlayback = true
        
        playerController.player?.play()
    }

    func makeUIViewController(context: Context) -> AVPlayerViewController {
        return AVPlayerViewController()
    }
}
