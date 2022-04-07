import SwiftUI
import MobileVLCKit
import AVKit

struct VLCPlayerView: UIViewRepresentable {
    
    public var urlPath: String
    public var subtitleURL: URL?
    
    private let mediaPlayer = VLCMediaPlayer()

    func makeUIView(context: Context) -> UIView {
        
        let view = UIView()
        mediaPlayer.drawable = view
        let media = VLCMedia(path: urlPath)
        mediaPlayer.media = media
        
        if let subtitleURL = subtitleURL {
            mediaPlayer.addPlaybackSlave(subtitleURL, type: .subtitle, enforce: true)
        }
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<VLCPlayerView>) {
    }
    
}

//MARK: - Controls
extension VLCPlayerView {
    
    func play() {
        guard !mediaPlayer.isPlaying else {
            mediaPlayer.pause()
            return
        }
        
        mediaPlayer.play()
    }
    
    func stop() {
        mediaPlayer.stop()
    }
    
    func takeScreenshot() {
        print("TAKE SCREENSHOT! - \(urlPath)")
        
        guard let drawable = mediaPlayer.drawable as? UIView else {
            return
        }
        
        let size = drawable.frame.size
        
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
        
        let rec = drawable.frame
        drawable.drawHierarchy(in: rec, afterScreenUpdates: false)
        
        let image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        guard let image = image else {
            return
        }
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
    }
}
