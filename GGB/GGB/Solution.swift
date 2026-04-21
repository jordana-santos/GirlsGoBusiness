//
//  SolutionView.swift
//  GGB
//
//  Created by Jordana Lourenço Santos on 16/04/26.
//

import SwiftUI

struct Solution: View {
    
    var body: some View {
        VStack{
            ZStack(){
                Rectangle()
                    .frame(width: 350, height: 400)
                    .foregroundColor(.gray)
                    .cornerRadius(15)
                    .padding(5)
                
                Text("solucao")
                    .padding(5)
            }
            Spacer()
        }
    }
}
