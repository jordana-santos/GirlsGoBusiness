//
//  SolutionView.swift
//  GGB
//
//  Created by Jordana Lourenço Santos on 16/04/26.
//

import SwiftUI

struct Solution: View {
    @Binding var riddle: Int
    
    var body: some View {
        VStack{
            ZStack(){
                Rectangle()
                    .frame(width: 350, height: 400)
                    .foregroundColor(.gray)
                    .cornerRadius(15)
                    .padding(5)
                if riddle == 1 {
                    Text("solucao 1")
                        .padding(5)
                } else if riddle == 2 {
                    Text("solucao 2")
                        .padding(5)
                }
            }
            Spacer()
        }
    }
}
