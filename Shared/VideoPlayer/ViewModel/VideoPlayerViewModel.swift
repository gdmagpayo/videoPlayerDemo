//
//  VideoPlayerViewModel.swift
//  VLCTestDemo
//
//  Created by Glazel Magpayo on 4/5/22.
//

import Foundation
import AVKit

enum PlayerType {
    case VLC, AVPlayer
}

final class VideoPlayerViewModel: NSObject, ObservableObject {
    var video: Video
    var selectedSubtitleURL: URL?
    
    var playerType: PlayerType
    var vlcPlayerView: VLCPlayerView?
    var avPlayerView: AVPlayerView?
    
    init(player: PlayerType, video: Video) {
        self.video = video
        selectedSubtitleURL = self.video.subTitleList?.first ?? nil
        playerType = player
        
        switch playerType {
        case .VLC:
            vlcPlayerView = VLCPlayerView(urlPath: video.path, subtitleURL: selectedSubtitleURL)
        case .AVPlayer:
            avPlayerView = AVPlayerView(videoURL: URL(fileURLWithPath: video.path), subtitleURL: selectedSubtitleURL!)
        }
    }
    
    func stopPlaying() {
        switch playerType {
        case .VLC:
            vlcPlayerView?.stop()
        case .AVPlayer:
            print("Add Stop")
            //ADD STOP here
        }
    }
}
