//
//  GameView.swift
//  GGB
//
//  Created by Jordana Lourenço Santos on 15/04/26.
//

import SwiftUI

struct GameView: View {
    @Binding var path: [Route]
    @State private var endTime: Date = Date().addingTimeInterval(28 * 60)
    @State var timeout: Bool = false
    @State var showTip: Bool = false
    @State var showSolution: Bool = false
    @State var tipCounter: Int = -1
    @State var timeRemaining: TimeInterval = 28 * 60
    let totalTime: TimeInterval = 28 * 60
    @State var page: Int = 1
    @State var packageInfo = 1
    
    @State private var minigameAllFilled: Bool = false
    @State private var minigameCorrect: Bool = false
    @State private var triggerMinigameCheck: Bool = false
    
    var progress: Double {
        let remaining = max(timeRemaining, 0)
        let raw = 1.0 - (remaining / totalTime)
        let minLevel = 0.05
        return minLevel + (1 - minLevel) * raw
    }
    
    var body: some View {
        ZStack{
            WaterBackground(progress: progress)
            
            VStack{
                CountdownTimer(end: endTime, timeRemaining: $timeRemaining, timeout: $timeout)
                
                Text("tempo restante")
                    .font(.caption)
                    .padding(.bottom, 10)
                
                Spacer()
                
                if showTip {
                    Tips(riddle: $page, counter: $tipCounter)
                } else if showSolution {
                    Solution(riddle: $page)
                } else {
                    switch page {
                    case 1: MinigameView(allCorrect: $minigameCorrect,
                                         allFilled: $minigameAllFilled,
                                         shouldCheck: $triggerMinigameCheck)
                    case 2: PackageInfo(page: $page)
                    case 3: Riddle2(page: $page)
                    case 4: PackageInfo(page: $page)
                    default: EmptyView()
                    }
                }
                
                if (showTip || showSolution){
                    Button {
                        showTip = false
                        showSolution = false
                    } label: {
                        Rectangle()
                            .frame(width: 360, height: 50)
                            .cornerRadius(15)
                            .foregroundColor(Color.teal)
                            .overlay(
                                Text("ok")
                                    .foregroundColor(.black)
                                    .font(.system(size: 18))
                            )
                    }
                } else {
                    Footer(
                        tipCounter: $tipCounter,
                        page: $page,
                        showTip: $showTip,
                        showSolution: $showSolution,
                        okDisabled: page == 1 && !minigameAllFilled,
                        onOK: {
                            if page == 1 {
                                triggerMinigameCheck = true
                            } else {
                                page += 1
                            }
                        }
                    )
                }
            }
            .zIndex(1)
        }
        .onAppear {
            endTime = Date().addingTimeInterval(totalTime)
            timeRemaining = totalTime
        }
        .onChange(of: timeRemaining) {
            if timeRemaining == 0 {
                path.append(.end)
            }
        }
        .onChange(of: page){
            if page == 5{
                path.append(.end)
            }
            
            if page != 1 {
                minigameAllFilled = false
                minigameCorrect = false
                triggerMinigameCheck = false
            }
        }
        .onChange(of: minigameCorrect) {
            if minigameCorrect {
                page += 1
            }
        }
        
    }
}
