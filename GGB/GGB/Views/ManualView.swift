//
//  ManualView.swift
//  GGB
//
//  Created by Jordana Lourenço Santos on 15/04/26.
//

import SwiftUI

struct ManualView: View {
    @Binding var path: [Route]
    let text = """
        Este manual acompanha a demo da Fase 1 do jogo. O jogo completo conta com mais fases, câmaras e conteúdo.
        """
    @Binding var whichInstructions: InstructionSection
    
    
    var body: some View {
        ZStack{
            Color("background")
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                Text("Instruções")
                    .font(.custom("Grenze-Regular", size: 24))
                    .foregroundColor(.black)
                
                ZStack (alignment: .topLeading) {
                    Rectangle()
                        .frame(height: 600)
                        .foregroundColor(Color("textbg"))
                        .cornerRadius(15)
                        .padding()
                        
                    VStack (alignment: .center) {
                        Text(text)
                            .padding()
                            .foregroundColor(.black)
                            .font(.custom("Grenze-Regular", size: 20))
                        
                        ForEach(InstructionSection.allCases, id: \.self) { section in
                            ButtonManual(instructions: section)
                        }
                        
                    }
                    .padding()
                }
                
                
                Button {
                    path.append(.intro)
                } label: {
                    Rectangle()
                        .frame(height: 50)
                        .cornerRadius(15)
                        .foregroundColor(Color("green"))
                        .overlay(
                            Text("Jogar")
                                .foregroundColor(.white)
                                .font(.custom("Grenze-Regular", size: 20))
                        )
                        .padding()
                }
                .padding()
            }
        }
    }
    
    
    func ButtonManual(instructions: InstructionSection) -> some View {
            Button {
                whichInstructions = instructions
                path.append(.instructions)
            } label: {
                Rectangle()
                    .frame(height: 50)
                    .cornerRadius(12)
                    .foregroundColor(Color("purpleButton"))
                    .overlay(
                        Text(instructions.title)  
                            .foregroundColor(.black)
                            .font(.custom("Grenze-Regular", size: 20))
                    )
                    .padding(.horizontal)
                    .padding(.vertical, 3)
            }
        }
    
}

//#Preview {
//    @Previewable @State var path: [Route] = []
//    @Previewable @State var whichInstructions: Int
//    
//    NavigationStack(path: $path) {
//        ManualView(path: $path, whichInstructions: $whichInstructions)
//            .navigationDestination(for: Route.self) { route in
//                route.view(path: $path, goodEnding: .constant(true))
//            }
//    }
//}
