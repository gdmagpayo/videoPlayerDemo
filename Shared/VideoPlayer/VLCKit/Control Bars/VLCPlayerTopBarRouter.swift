//
//  VLCPlayerTopBarRouter.swift
//  VLCTestDemo
//
//  Created by Glazel Magpayo on 4/8/22.
//

import SwiftUI
import Combine

protocol VLCPlayerTopBarRouting {
    
}

struct VLCPlayerTopBarRouter: VLCPlayerTopBarRouting {
    var dismissPlayerView: () -> Void
    
}
