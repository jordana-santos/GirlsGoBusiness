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
    @State private var timeRemaining: TimeInterval = 28 * 60
    @State private var isFinished: Bool = false
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    public var body: some View {
        VStack(spacing: 20) {
            Text(timeString(from: timeRemaining))
                .font(.system(size: 64, weight: .bold, design: .monospaced))
                .foregroundColor(isFinished ? .red : .black)

            if isFinished {
                Text("Time's up!")
                    .font(.title)
                    .foregroundColor(.red)
            }
        }
        .onReceive(timer) { _ in
            let remaining = end.timeIntervalSinceNow
            if remaining <= 0 {
                timeRemaining = 0
                isFinished = true
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
