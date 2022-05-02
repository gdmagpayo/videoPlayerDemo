//
//  VLCPlayerTopBarViewModel.swift
//  VLCTestDemo
//
//  Created by Glazel Magpayo on 4/8/22.
//

import Foundation

final class VLCPlayerTopBarViewModel: NSObject, ObservableObject {
    var videoTitle: String
    var closeIconName: String
    
    init(videoTitle: String, closeIconName: String = "xmark") {
        self.videoTitle = videoTitle
        self.closeIconName = closeIconName
    }
}
