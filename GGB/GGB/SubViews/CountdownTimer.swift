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
                    .fill(
                        EllipticalGradient(
                            stops: [
                                Gradient.Stop(color: Color("gradientStart"), location: 0.00),
                                Gradient.Stop(color: Color("gradientEnd"), location: 2.00),
                            ],
                            center: UnitPoint(x: 0.5, y: 0.5)
                        )
                    )
                    .frame(width: .infinity, height: 100)
                    .cornerRadius(20)
                    .padding(.horizontal)
                
                Text(timeString(from: timeRemaining))
                    .font(.system(size: 64, weight: .bold, design: .monospaced))
                    .foregroundColor(Color("red"))
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
