//
//  Info.swift
//  GGB
//
//  Created by Jordana Lourenço Santos on 26/04/26.
//

import SwiftUI

struct PackageInfo: View {
    @Binding var page: Int
    let texto1: String = """
        Parabéns, vocês estão chegando mais perto de encontrar a Professora!

        Vocês encontram algo no chão. (Pegue o pacote 4)

        Nas paredes do templo, mais um enigma os espera. (Pegue o pacote 5)
    """
    
    let texto2: String = ""
    
    var body: some View {
        VStack(alignment: .center){
            ZStack{
                Rectangle()
                    .frame(width: .infinity, height: 300)
                    .foregroundColor(Color("purple"))
                    .cornerRadius(12)
                    .padding()
                
                VStack(alignment: .center){
                    Text(texto1)
                        .font(.custom("Grenze-Regular", size: 20))
                        .foregroundStyle(.black)
                        .frame(width: 360, height: 300)
                        .multilineTextAlignment(.center)
                        .padding()
                }
            }
            Spacer()
        }
    }
}
