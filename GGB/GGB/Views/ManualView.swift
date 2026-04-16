//
//  ManualView.swift
//  GGB
//
//  Created by Jordana Lourenço Santos on 15/04/26.
//

import SwiftUI

struct ManualView: View {
    @Binding var path: [Route]
    
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .frame(width: 360, height: 600)
                    .foregroundColor(.gray)
                    .cornerRadius(15)
                    .padding(5)
                    
                
                ScrollView(){
                    Text("conteudo do manual")
                        .padding()
                }
                .frame(width: 360, height: 600)
                .padding(5)
            }
        }
    }
}
