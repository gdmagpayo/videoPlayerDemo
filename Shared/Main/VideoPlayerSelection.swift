//
//  SwiftUIView.swift
//  VLCTestDemo
//
//  Created by Glazel Magpayo on 4/5/22.
//

import SwiftUI

struct VideoPlayerSelection: View {
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    
                    VideoPlayerOption(title: "AVPlayer") {
                        AVNativePlayer(viewModel: VideoPlayerViewModel(player: .AVPlayer, video: VideoResource.getVideo()))
                    }
                    
                    VideoPlayerOption(title: "VLCKit") {
                        VLCPlayer(viewModel: VideoPlayerViewModel(player: .VLC, video: VideoResource.getVideo()))
                    }

                }
            }
            .navigationTitle("Select Video Player")
            .navigationBarTitleDisplayMode(.automatic)
            
        }
    }
}

struct VideoPlayerOption<Content: View>: View {
    var title: String
    @ViewBuilder var destination: Content
    
    var body: some View {
        NavigationLink(destination: destination) {
            Text(title)
        }
    }
}

struct VideoPlayerSelection_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayerSelection()
    }
}
