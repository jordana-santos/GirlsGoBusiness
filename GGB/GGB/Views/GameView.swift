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
    @State var tipCounter: Int = 0
    @State var timeRemaining: TimeInterval = 2 * 60
    let totalTime: TimeInterval = 2 * 60
    
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
                    .padding(5)
                    .padding(.bottom, 10)
                
                Spacer()
                
                if (showTip){
                    Tips()
                } else if (showSolution){
                    Solution()
                } else {
                    Keyboard()
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
                            .padding(5)
                    }
                } else {
                    HStack(){
                        Button{
                            showTip = true
                            tipCounter += 1
                        }label: {
                            Circle()
                                .frame(width: 60, height: 60)
                                .padding(.horizontal, 35)
                                .padding(.vertical, 15)
                                .foregroundColor(.gray)
                                .overlay(
                                    Image(systemName: "lightbulb.max")
                                        .foregroundColor(.black)
                                )
                        }
                        
                        Spacer()
                        Button{
                            showSolution = true
                        } label: {
                            Rectangle()
                                .frame(width: 150, height: 50)
                                .foregroundColor(.gray)
                                .cornerRadius(15)
                                .overlay(
                                    Text("Solução")
                                        .foregroundColor(.black)
                                )
                                .padding(.horizontal, 35)
                                .padding(.vertical, 15)
                        }
                        .disabled(tipCounter == 0)
                        .opacity(tipCounter == 0 ? 0.5 : 1.0)
                    }
                }
            }
            .zIndex(1)
        }
        .onAppear {
            endTime = Date().addingTimeInterval(totalTime)
            timeRemaining = totalTime
        }
    }
}
