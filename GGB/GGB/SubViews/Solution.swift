//
//  SolutionView.swift
//  GGB
//
//  Created by Jordana Lourenço Santos on 16/04/26.
//

import SwiftUI

struct Solution: View {
    @Binding var page: Int
    
    var body: some View {
        VStack{
            ZStack(){
                Rectangle()
                    .frame(width: .infinity, height: 350)
                    .foregroundColor(Color("purple"))
                    .cornerRadius(15)
                    .padding()
                
                if page == 1 {
                    Text("solucao 1")
                        .padding(5)
                        .font(.custom("Grenze-Regular", size: 20))
                        .foregroundStyle(.black)
                    
                } else if page == 2 {
                    Text("solucao 2")
                        .padding(5)
                        .font(.custom("Grenze-Regular", size: 20))
                        .foregroundStyle(.black)
                }
            }
            Spacer()
        }
    }
}
