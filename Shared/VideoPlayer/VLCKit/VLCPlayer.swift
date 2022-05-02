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
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject var viewModel: VideoPlayerViewModel
    
    var body: some View {
        ZStack {
            
            Color.white.ignoresSafeArea()

            VLCPlayerTopBar(viewModel: VLCPlayerTopBarViewModel(videoTitle: viewModel.video.name)) {
                self.dismiss()
            }
            .ignoresSafeArea()
            .zIndex(1)
            
            viewModel.vlcPlayerView
                .onTapGesture {
                    viewModel.vlcPlayerView!.play()
                }.zIndex(0)
        }
        .ignoresSafeArea()
        .navigationBarHidden(true)
        .onDisappear {
            viewModel.stopPlaying()
        }
    }
    
    func dismiss() {
        self.presentationMode.wrappedValue.dismiss()
    }
}

struct VLCPlayer_Previews: PreviewProvider {
    static var previews: some View {
        VLCPlayer(viewModel: VideoPlayerViewModel(player: .VLC, video: VideoResource.getVideo()))
    }
}
