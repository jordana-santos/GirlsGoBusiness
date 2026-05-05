//
//  TipView.swift
//  GGB
//
//  Created by Jordana Lourenço Santos on 16/04/26.
//

import SwiftUI

struct Tips: View {
    @Binding var page: Int
    @Binding var counter: Int
    
    var body: some View {
        VStack{
            ZStack(){
                Rectangle()
                    .frame(width: .infinity, height: 350)
                    .foregroundColor(Color("textbg"))
                    .cornerRadius(15)
                    .padding()
                
                if page == 1 {
                    Text(TipsRiddle1()[counter])
                        .padding()
                        .font(.custom("Grenze-Regular", size: 20))
                        .foregroundStyle(.black)
                        .multilineTextAlignment(.center)
                    
                } else if page == 3 {
                    Text(TipsRiddle2()[counter])
                        .padding()
                        .font(.custom("Grenze-Regular", size: 20))
                        .foregroundStyle(.black)
                        .multilineTextAlignment(.center)
                }
            }
            Spacer()
        }
    }
    
    func TipsRiddle1() -> [String]{
        let t1 = """
                O diário descreve o que cada transformador faz.
                """
        
        let t2 = """
                A função de cada símbolo descreve a transformação causada.
                """
        
        let t3 = """
                Uma transformação ocorre no folículo. Outra, no endométrio. Quem são os responsáveis?
                """
        return [t1, t2, t3]
    }
    
    func TipsRiddle2() -> [String]{
        let t1 = """
                Cada grupo possui uma palavra com um prefixo diferente.
                """
        
        let t2 = """
                 Há cartas que descrevem o que o corpo sente, e cartas que dizem o que se fazer em resposta.
                """
        
        let t3 = """
                Em cada grupo, há 3 cartas: uma carta nomeia algo que acontece no corpo e as outras duas são o que fazer em cada caso.
                """
        return [t1, t2, t3]
    }
}


