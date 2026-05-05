//
//  SolutionView.swift
//  GGB
//
//  Created by Jordana Lourenço Santos on 16/04/26.
//

import SwiftUI

struct Solution: View {
    @Binding var page: Int
    
    let solucao1: String = """
        Os símbolos do tabuleiro representam transformações hormonais: o círculo crescendo indica o amadurecimento do folículo, causado pelo FSH, e o triângulo engrossando indica o espessamento do endométrio, causado pelo estradiol.
        
        Selecione a imagem do FSH no campo 1 e do estradiol no campo 2. 
        """
    
    let solucao2: String = """
        Os grupos são formados por um sintoma/sinal do corpo (cartas com prefixo Yara) e dois cuidados correspondentes. 
        
        Grupo 1: cólica (Yara-dori) → gengibre (Orakali) + compressa quente (Ixamorni)
        
        Grupo 2: fadiga (Yara-pes) → alongamento (Ixaflu) + descanso (Orarepo)
        
        Grupo 3: menstruação (Yara-ini) → coletor menstrual (Ixacole) + absorvente (Orabve)
        """
    
    var body: some View {
        VStack{
            ZStack(){
                Rectangle()
                    .frame(width: .infinity, height: 400)
                    .foregroundColor(Color("textbg"))
                    .cornerRadius(15)
                    .padding()
                    .overlay(
                        ScrollView{
                            if page == 1 {
                                Text(solucao1)
                                    .font(.custom("Grenze-Regular", size: 20))
                                    .foregroundStyle(.black)
                                    .padding()
                                
                            } else {
                                Text(solucao2)
                                    .font(.custom("Grenze-Regular", size: 20))
                                    .foregroundStyle(.black)
                                    .padding()
                            }
                        }
                            .padding()
                    )
            }
            Spacer()
        }
    }
}
