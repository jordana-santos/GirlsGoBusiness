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
    
    var body: some View {
        VStack{

            CountdownTimer(end: endTime, timeout: $timeout)
            
            Text("tempo restante")
                .font(.caption)
                .padding(5)
                .padding(.bottom, 10)
            
            Spacer()
            
            Keyboard()
            
            HStack(){
                Button{
                    path.append(.tip)
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
            }
        }
    }
}
