//
//  VLCPlayerTopBar.swift
//  VLCTestDemo
//
//  Created by Glazel Magpayo on 4/7/22.
//

import SwiftUI

struct VLCPlayerTopBar: View {
    @ObservedObject var viewModel: VLCPlayerTopBarViewModel
    var dismissPlayerView: () -> Void //Where to add this
    
    var body: some View {
        
        VStack {
            ZStack {
                Rectangle()
                    .fill(
                        LinearGradient(colors: [.black, .clear], startPoint: .top, endPoint: .bottom)
                    )
                
                HStack {
                    Button {
                        dismissPlayerView()
                    } label: {
                        Image(systemName: viewModel.closeIconName)
                    }
                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 5))
                    .foregroundColor(.white)

                    Text(viewModel.videoTitle)
                        .foregroundColor(.white)
                    
                    Spacer()
                }
                .padding()
                .tint(.white)
            
            }
            .frame(height: UIScreen.main.bounds.height * 0.15)
            
            Spacer()
        }

    }
}


struct VLCPlayerTopBar_Previews: PreviewProvider {
    static var previews: some View {
        VLCPlayerTopBar(viewModel: VLCPlayerTopBarViewModel(videoTitle: "My test video name")) {
            print("Hello")
        }
        .previewLayout(.sizeThatFits)
        .previewInterfaceOrientation(.portraitUpsideDown)
    }
}
