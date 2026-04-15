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
            VStack{
                Button {
                    path.append(.game)
                } label: {
                    Rectangle()
                        .frame(width: 200, height: 50)
                        .cornerRadius(10)
                        .foregroundColor(Color.teal)
                        .overlay(
                            Text("iniciar timer")
                                .foregroundColor(.black)
                                .font(.system(size: 18))
                        )
                }
            }
        }
    }
}
