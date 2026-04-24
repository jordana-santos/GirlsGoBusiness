//
//  Timer.swift
//  GGB
//
//  Created by Jordana Lourenço Santos on 15/04/26.
//

import SwiftUI
import Combine

public struct CountdownTimer: View {
    let end: Date
    @Binding var timeRemaining: TimeInterval
    @Binding var timeout: Bool
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    public var body: some View {
        VStack(spacing: 20) {
            ZStack{
                Rectangle()
                    .frame(width: 380, height: 100)
                    .foregroundColor(.gray)
                    .cornerRadius(15)
                
                Text(timeString(from: timeRemaining))
                    .font(.system(size: 64, weight: .bold, design: .monospaced))
                    .foregroundColor(.black)
            }
        }
        .onReceive(timer) { _ in
            let remaining = end.timeIntervalSinceNow
            
            if remaining <= 0 {
                timeRemaining = 0
                timeout = true
            } else {
                timeRemaining = remaining
            }
        }
    }
    
    func timeString(from interval: TimeInterval) -> String {
        let minutes = Int(interval) / 60
        let seconds = Int(interval) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}
