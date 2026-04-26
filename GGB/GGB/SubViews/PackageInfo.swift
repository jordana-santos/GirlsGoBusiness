//
//  Info.swift
//  GGB
//
//  Created by Jordana Lourenço Santos on 26/04/26.
//

import SwiftUI

struct PackageInfo: View {
    @Binding var page: Int
    
    var body: some View {
        VStack(alignment: .center){
            ZStack{
                Rectangle()
                    .frame(width: .infinity, height: 200)
                    .foregroundColor(Color("purple"))
                    .cornerRadius(15)
                    .padding()
                
                VStack{
                    if page == 2 {
                        Text("Parabens!")
                            .font(Font.title.bold())
                        Text("Pegue o pacote x para iniciar o próximo enigma.")
                            .padding(5)
                        
                    } else if page == 4 {
                        Text("Parabens!")
                            .font(Font.title.bold())
                        Text("Você conseguiu escapar e salvar a arqueóloga!")
                            .padding(5)
                    }
                }
            }
            Spacer()
        }
    }
}
