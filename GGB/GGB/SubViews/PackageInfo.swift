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
                            .font(.custom("Grenze-Bold", size: 28))
                            .foregroundStyle(.black)
                        
                        Text("Pegue o pacote 4 para iniciar o próximo enigma.")
                            .font(.custom("Grenze-Regular", size: 20))
                            .foregroundStyle(.black)
                            .multilineTextAlignment(.center)
                        
                    } else if page == 4 {
                        Text("Parabens!")
                            .font(.custom("Grenze-Bold", size: 28))
                            .foregroundStyle(.black)
                        
                        Text("Você conseguiu escapar e salvar a arqueóloga!")
                            .font(.custom("Grenze-Regular", size: 20))
                            .foregroundStyle(.black)
                            .multilineTextAlignment(.center)
                    }
                }
            }
            Spacer()
        }
    }
}
