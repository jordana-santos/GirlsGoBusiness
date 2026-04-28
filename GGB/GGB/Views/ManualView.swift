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
        ZStack{
            Color("background")
                .ignoresSafeArea()
            
            VStack {
                ZStack {
                    Rectangle()
                        .frame(width: .infinity, height: 600)
                        .foregroundColor(Color("purple"))
                        .cornerRadius(15)
                        .padding()
                        
                    
                    ScrollView(){
                        Text("conteudo do manual")
                            .padding()
                            .font(.custom("Grenze-Regular", size: 20))
                    }
                    .frame(width: 380, height: 600)
                    .padding(5)
                }
            }
        }
    }
}
