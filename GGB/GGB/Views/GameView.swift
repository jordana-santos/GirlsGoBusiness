//
//  GameView.swift
//  GGB
//
//  Created by Jordana Lourenço Santos on 15/04/26.
//

import SwiftUI

struct GameView: View {
    @Binding var path: [Route]
    @State private var endTime: Date = Date().addingTimeInterval(2 * 60)
    @State var timeout: Bool = false
    @State var showTip: Bool = false
    @State var showSolution: Bool = false
    @State var tipCounter: Int = -1
    @State var timeRemaining: TimeInterval = 2 * 60
    let totalTime: TimeInterval = 2 * 60
    @State var page: Int = 1
    @State var packageInfo = 1
    @State var allFilled: Bool = false
    @State var isCorrect: Bool = false
    @State var triggerCheck: Bool = false
    @State var showOk: Bool = true
    
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
                    .font(.custom("Grenze-Regular", size: 18))
                    .foregroundStyle(.black)
                
                Spacer()
                
                if showTip {
                    Tips(page: $page, counter: $tipCounter)
                } else if showSolution {
                    Solution(page: $page)
                } else {
                    switch page {
                    case 1: Riddle1(allCorrect: $isCorrect,
                                         allFilled: $allFilled,
                                         shouldCheck: $triggerCheck)
                    case 2: PackageInfo(page: $page)
                    case 3: Riddle2(showOk: $showOk)
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
                            .foregroundColor(Color("green"))
                            .overlay(
                                Text("ok")
                                    .foregroundColor(.black)
                                    .font(.custom("Grenze-Regular", size: 20))
                            )
                    }
                } else {
                    Footer(
                        tipCounter: $tipCounter,
                        page: $page,
                        showTip: $showTip,
                        showSolution: $showSolution,
                        okDisabled: page == 1 && !allFilled,
                        onOK: {
                            if page == 1 {
                                triggerCheck = true
                            } else {
                                page += 1
                            }
                        },
                        showOk: $showOk
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
                allFilled = false
                isCorrect = false
                triggerCheck = false
            }
            if page == 3 {
                showOk = false
            }
        }
        .onChange(of: isCorrect) {
            if isCorrect {
                page += 1
            }
        }
        
    }
}
