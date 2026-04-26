//
//  IntroView.swift
//  GGB
//
//  Created by Jordana Lourenço Santos on 15/04/26.
//

import SwiftUI

struct IntroView: View {
    @Binding var path: [Route]
    
    var body: some View {
        ZStack{
            Color("background")
                .ignoresSafeArea()
            
            VStack {
                ZStack {
                    Rectangle()
                        .frame(width: .infinity, height: 600)
                        .foregroundColor(Color("purple"))
                        .cornerRadius(15)
                        .padding()
                    
                    ScrollView(){
                        Text("introdução")
                            .padding()
                    }
                    .frame(width: 380, height: 600)
                    .padding(5)
                }
                
                Button {
                    path.append(.game)
                } label: {
                    Rectangle()
                        .frame(width: 350, height: 50)
                        .cornerRadius(15)
                        .foregroundColor(Color("green"))
                        .overlay(
                            Text("Iniciar timer")
                                .foregroundColor(.white)
                                .font(.system(size: 18))
                        )
                        .padding(5)
                }
            }
        }
    }
}
