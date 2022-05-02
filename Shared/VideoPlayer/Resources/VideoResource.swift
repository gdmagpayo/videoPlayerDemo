//
//  File.swift
//  VLCTestDemo
//
//  Created by Glazel Magpayo on 4/7/22.
//

import Foundation

struct Video {
    var name: String
    var path: String
    var subTitleList: [URL]?
}

struct VideoResource {
    static let videoPath = Bundle.main.path(forResource: "trailer_720p", ofType: "mov")
//    static let videoPath = Bundle.main.path(forResource: "testvideo2", ofType: "MP4")
//    static let videoPath = Bundle.main.path(forResource: "test", ofType: "MP4")
    static let subtitleURL = URL(string: "https://raw.githubusercontent.com/furkanhatipoglu/AVPlayerViewController-Subtitles/master/Example/AVPlayerViewController-Subtitles/trailer_720p.srt")
    static let subtitleURLPath = Bundle.main.path(forResource: "trailer_720p", ofType: "srt")
    
    static func getVideo() -> Video {
        Video(name: "This is test video player!",
              path: VideoResource.videoPath!,
              subTitleList: [VideoResource.subtitleURL!])
    }
}
