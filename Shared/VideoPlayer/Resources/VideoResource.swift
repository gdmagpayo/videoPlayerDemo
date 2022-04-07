//
//  File.swift
//  VLCTestDemo
//
//  Created by Glazel Magpayo on 4/7/22.
//

import Foundation

struct VideoResource {
    static let videoPath = Bundle.main.path(forResource: "trailer_720p", ofType: "mov")
    static let subtitleURL = URL(string: "https://raw.githubusercontent.com/furkanhatipoglu/AVPlayerViewController-Subtitles/master/Example/AVPlayerViewController-Subtitles/trailer_720p.srt")
}
