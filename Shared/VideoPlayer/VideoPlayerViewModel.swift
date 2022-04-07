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
    var subtitleURLList: [URL]
    var selectedSubtitleURL: URL?
    var playerType: PlayerType
    var playerView: VLCPlayerView?
    var avPlayerView: AVPlayerView?
    
    init(videoPath: String, subtitleURLList: [URL], playerType: PlayerType) {
        self.videoPath = videoPath
        self.subtitleURLList = subtitleURLList
        self.selectedSubtitleURL = subtitleURLList.first
        self.playerType = playerType
        
        switch playerType {
        case .VLC:
            self.playerView = VLCPlayerView(urlPath: videoPath, subtitleURL: selectedSubtitleURL)
        case .AVPlayer:
            self.avPlayerView = AVPlayerView(videoURL: URL(fileURLWithPath: videoPath), subtitleURL: selectedSubtitleURL!)
        }
    }
}
