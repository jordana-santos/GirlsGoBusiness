//
//  WaterBackground.swift
//  GGB
//
//  Created by Jordana Lourenço Santos on 22/04/26.
//

import SwiftUI

struct WaterBackground: View {
    var progress: Double
    
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .bottom) {
                
                Color.white
                
                Rectangle()
                    .fill(
                        LinearGradient(
                            colors: [.blue, .cyan],
                            startPoint: .bottom,
                            endPoint: .top
                        )
                    )
                    .frame(height: geo.size.height * progress)
                    .animation(.linear(duration: 1), value: progress)
            }
        }
        .ignoresSafeArea()
    }
}
