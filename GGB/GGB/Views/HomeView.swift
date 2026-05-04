//
//  HomeView.swift
//  GGB
//
//  Created by Jordana Lourenço Santos on 15/04/26.
//

import SwiftUI

struct HomeView: View {
    @State private var path: [Route] = []
    @State var goodEnding: Bool = true
    @State var whichInstructions: InstructionSection = .visaoGeral
    
    var body: some View {
        NavigationStack(path: $path){
            ZStack{
                Color("background")
                    .ignoresSafeArea()
                
                VStack{
                    Spacer()
                    
                    Image("icon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                        .cornerRadius(20)
                        .padding()
                        
                    
                    Text("Carmesim")
                        .padding()
                        .foregroundColor(.black)
                        .font(.custom("Grenze-Regular", size: 42))
                        
                    
                    Spacer()
                    Button {
                        path.append(.intro)
                    } label: {
                        Rectangle()
                            .frame(width: 350, height: 50)
                            .cornerRadius(12)
                            .foregroundColor(Color("group1"))
                            .overlay(
                                Text("Iniciar jogo")
                                    .foregroundColor(.white)
                                    .font(.custom("Grenze-Bold", size: 20))
                            )
                    }
                    
                    Button {
                        path.append(.manual)
                    } label: {
                        Rectangle()
                            .frame(width: 350, height: 45)
                            .cornerRadius(12)
                            .foregroundColor(Color("blueButton"))
                            .overlay(
                                Text("Como jogar")
                                    .foregroundColor(.white)
                                    .font(.custom("Grenze-Regular", size: 18))
                            )
                    }
                    .padding()
                }
            }
            .navigationDestination(for: Route.self) { page in
                page.view(
                    path: $path,
                    goodEnding: $goodEnding,
                    whichInstructions: $whichInstructions
                )
            }
        }
    }
}

#Preview {
    HomeView()
}
