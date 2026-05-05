//
//  InstructionsView.swift
//  GGB
//
//  Created by Jordana Lourenço Santos on 30/04/26.
//

import SwiftUI

struct InstructionsView: View {
    @Binding var path: [Route]
    @Binding var whichInstructions: InstructionSection
    
    var body: some View {
        
        ZStack{
            Color("background")
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                Text(whichInstructions.title)
                    .font(.custom("Grenze-Regular", size: 24))
                    .foregroundColor(.black)
                
                ZStack(alignment: .topLeading) {
                    Rectangle()
                        .frame(height: 600)
                        .foregroundColor(Color("textbg"))
                        .cornerRadius(15)
                        .padding()
                        .padding(.horizontal, 10)
                    
                    ScrollView(){
                        Text(whichInstructions.content)
                            .padding()
                            .font(Font.custom("Grenze-Regular", size: 20))
                            .foregroundColor(.black)
                    }
                    .frame(width: 380, height: 600)
                    .padding()
                }
                
                Spacer()
                
                Button {
                    path.append(.intro)
                } label: {
                    Rectangle()
                        .frame(width: 360, height: 50)
                        .cornerRadius(15)
                        .foregroundColor(Color("green"))
                        .overlay(
                            Text("Iniciar jogo")
                                .foregroundColor(.white)
                                .font(.custom("Grenze-Regular", size: 20))
                        )
                        .padding()
                }
                .padding()
            }
        }
    }
}
