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
                            .cornerRadius(15)
                            .foregroundColor(Color("green"))
                            .overlay(
                                Text("Iniciar jogo")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18))
                            )
                            .padding(5)
                    }
                    
                    Button {
                        path.append(.manual)
                    } label: {
                        Text("como jogar?")
                            .foregroundColor(.black)
                            .font(.callout)
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
