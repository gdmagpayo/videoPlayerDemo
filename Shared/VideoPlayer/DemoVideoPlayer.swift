//
//  ContentView.swift
//  Shared
//
//  Created by Glazel Magpayo on 4/4/22.
//

import SwiftUI
import MobileVLCKit
import AVKit

struct DemoVideoPlayer: View {
    
    @ObservedObject var viewModel: VideoPlayerViewModel
    
    var body: some View {
        VStack {
            switch viewModel.playerType {
            case .AVPlayer:
                viewModel.avPlayerView
                    .transition(.move(edge: .bottom))
                    .edgesIgnoringSafeArea(.all)

            default:
                viewModel.playerView
                    .onTapGesture {
                        viewModel.playerView!.play()
                    }
            }
            
            HStack {
                Button {
                    guard viewModel.playerType == .VLC else {
                        return
                    }
                    
                    let impactMed = UIImpactFeedbackGenerator(style: .medium)
                    impactMed.impactOccurred()
                    
                    viewModel.playerView!.takeScreenshot()
                    
                } label: {
                    Text("Take a screenshot")
                        .padding()
                }
                
                Button {
                    guard viewModel.playerType == .AVPlayer else {
                        return
                    }
                    let impactMed = UIImpactFeedbackGenerator(style: .medium)
                    impactMed.impactOccurred()
                    
                } label: {
                    Text("Lock controls")
                        .padding()
                }
            }
        }.onDisappear {
            switch viewModel.playerType {
            case .AVPlayer:
                print("Stop")
            case .VLC:
                viewModel.playerView!.stop()
            }
        }
    }
    
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        DemoVideoPlayer()
//    }
//}
