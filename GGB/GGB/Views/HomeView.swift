//
//  HomeView.swift
//  GGB
//
//  Created by Jordana Lourenço Santos on 15/04/26.
//

import SwiftUI

struct HomeView: View {
    @State private var path: [Route] = []
    
    var body: some View {
        NavigationStack(path: $path){
            ZStack{
                Color("background")
                    .ignoresSafeArea()
                
                VStack{
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
                                    .font(.custom("Grenze-Regular", size: 20))
                                    .fontWeight(.bold)
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
                    .padding(5)
                }
            }
            .navigationDestination(for: Route.self) { page in
                page.view(
                    path: $path
                )
            }
        }
    }
}
