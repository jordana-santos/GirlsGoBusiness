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
        VStack {
            ZStack {
                Rectangle()
                    .frame(width: 360, height: 600)
                    .foregroundColor(.gray)
                    .cornerRadius(15)
                    .padding(5)
                
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
                    .frame(width: 360, height: 50)
                    .cornerRadius(15)
                    .foregroundColor(Color.teal)
                    .overlay(
                        Text("iniciar timer")
                            .foregroundColor(.black)
                            .font(.system(size: 18))
                    )
                    .padding(5)
            }
        }
    }
}
