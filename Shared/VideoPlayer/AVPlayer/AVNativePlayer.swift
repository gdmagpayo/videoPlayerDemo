//
//  AVNativePlayer.swift
//  VLCTestDemo
//
//  Created by Glazel Magpayo on 4/7/22.
//

import SwiftUI
import MobileVLCKit
import AVKit

struct AVNativePlayer: View {
    @ObservedObject var viewModel: VideoPlayerViewModel
    
    var body: some View {
        VStack {
            
            viewModel.avPlayerView
            
        }.onDisappear {
            viewModel.stopPlaying()
        }
    }
}

struct AVNativePlayer_Previews: PreviewProvider {
    static var previews: some View {
        AVNativePlayer(viewModel: VideoPlayerViewModel(player: .AVPlayer, videoPath: VideoResource.videoPath!, subtitleURLList: nil))
    }
}
