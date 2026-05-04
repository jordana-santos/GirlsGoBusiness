//
//  EndingView.swift
//  GGB
//
//  Created by Jordana Lourenço Santos on 15/04/26.
//

import SwiftUI

struct EndingView: View {
    @Binding var path: [Route]
    @Binding var goodEnding: Bool
    
    var body: some View {
        ZStack{
            Color("background")
                .ignoresSafeArea()
            
            VStack(){
                Spacer()
                if goodEnding {
                    Text("Parabéns!")
                        .font(.custom("Grenze-Regular", size: 24))
                        .fontWeight(.bold)
                        .padding()
                    
                    Text("Você conseguiu escapar a tempo e salvar a arqueóloga!")
                        .font(.custom("Grenze-Regular", size: 20))
                        .padding()
                    
                } else {
                    Text("O tempo passa rápido e a maré nunca tardia. A água do mar cobre as paredes do templo e não há mais escapatória.")
                        .font(.custom("Grenze-Regular", size: 20))
                        .padding()
                }
                
                Spacer()
                
                Button{
                    path.removeAll()
                } label: {
                    Rectangle()
                        .frame(width: 350, height: 50)
                        .cornerRadius(12)
                        .foregroundColor(Color("group1"))
                        .overlay(
                            Text("Voltar para o início")
                                .foregroundColor(.white)
                                .font(.custom("Grenze-Regular", size: 20))
                                .fontWeight(.bold)
                        )
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

//#Preview {
//    @Previewable @State var path: [Route] = []
//    @Previewable @State var goodEnding: Bool = true
//    
//    NavigationStack(path: $path) {
//        EndingView(path: $path, goodEnding: $goodEnding)
//            .navigationDestination(for: Route.self) { route in
//                route.view(path: $path, goodEnding: .constant(true))
//            }
//    }
//}
