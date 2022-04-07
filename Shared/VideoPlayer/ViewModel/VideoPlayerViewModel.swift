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
    var videoPath: String
    var subtitleURLList: [URL]?
    var selectedSubtitleURL: URL?
    
    var playerType: PlayerType
    var vlcPlayerView: VLCPlayerView?
    var avPlayerView: AVPlayerView?
    
    init(player: PlayerType, videoPath: String, subtitleURLList: [URL]?) {
        self.videoPath = videoPath
        self.subtitleURLList = subtitleURLList
        selectedSubtitleURL = subtitleURLList?.first ?? nil
        playerType = player
        
        switch playerType {
        case .VLC:
            vlcPlayerView = VLCPlayerView(urlPath: videoPath, subtitleURL: selectedSubtitleURL)
        case .AVPlayer:
            avPlayerView = AVPlayerView(videoURL: URL(fileURLWithPath: videoPath), subtitleURL: selectedSubtitleURL!)
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
