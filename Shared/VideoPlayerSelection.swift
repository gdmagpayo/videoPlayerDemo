//
//  SwiftUIView.swift
//  VLCTestDemo
//
//  Created by Glazel Magpayo on 4/5/22.
//

import SwiftUI

struct VideoPlayerSelection: View {
    let subtitleRemoteUrl = URL(string: "https://raw.githubusercontent.com/furkanhatipoglu/AVPlayerViewController-Subtitles/master/Example/AVPlayerViewController-Subtitles/trailer_720p.srt")
    let videoPath = Bundle.main.path(forResource: "trailer_720p", ofType: "mov")
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    NavigationLink(destination: DemoVideoPlayer(viewModel: VideoPlayerViewModel(videoPath: videoPath!, subtitleURLList: [subtitleRemoteUrl!], playerType: .AVPlayer))) {
                        Text("AVPlayer")
                    }
                    NavigationLink(destination: DemoVideoPlayer(viewModel: VideoPlayerViewModel(videoPath: videoPath!, subtitleURLList: [subtitleRemoteUrl!], playerType: .VLC))) {
                        Text("VLCKit")
                    }
                }
            }
            .navigationTitle("Select Video Player")
            .navigationBarTitleDisplayMode(.automatic)
            
        }
    }
}

struct VideoPlayerSelection_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayerSelection()
    }
}
