//
//  VLCPlayer.swift
//  VLCTestDemo
//
//  Created by Glazel Magpayo on 4/7/22.
//

import SwiftUI
import MobileVLCKit
import AVKit

struct VLCPlayer: View {
    @ObservedObject var viewModel: VideoPlayerViewModel
    
    var body: some View {
        VStack {
            viewModel.vlcPlayerView
                .onTapGesture {
                    viewModel.vlcPlayerView!.play()
                }
            
            Button {
                let impactMed = UIImpactFeedbackGenerator(style: .medium)
                impactMed.impactOccurred()

                viewModel.vlcPlayerView!.takeScreenshot()

            } label: {
                Text("Take a screenshot")
                    .padding()
            }
        }.onDisappear {
            viewModel.stopPlaying()
        }
    }
}

struct VLCPlayer_Previews: PreviewProvider {
    static var previews: some View {
        VLCPlayer(viewModel: VideoPlayerViewModel(player: .VLC, videoPath: VideoResource.videoPath!, subtitleURLList: nil))
    }
}
