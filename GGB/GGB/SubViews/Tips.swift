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
                    .foregroundColor(Color("purple"))
                    .cornerRadius(15)
                    .padding()
                
                if page == 1 {
                    Text(TipsRiddle1()[counter])
                        .padding(5)
                        .font(.custom("Grenze-Regular", size: 20))
                        .foregroundStyle(.black)
                } else if page == 3 {
                    Text(TipsRiddle2()[counter])
                        .padding(5)
                        .font(.custom("Grenze-Regular", size: 20))
                        .foregroundStyle(.black)
                }
            }
            Spacer()
        }
    }
    
    func TipsRiddle1() -> [String]{
        let t1 = """
                Dica 1
                """
        
        let t2 = """
                Dica 2
                """
        
        let t3 = """
                Dica 3
                """
        return [t1, t2, t3]
    }
    
    func TipsRiddle2() -> [String]{
        let t1 = """
                Dica 1
                """
        
        let t2 = """
                Dica 2
                """
        
        let t3 = """
                Dica 3
                """
        return [t1, t2, t3]
    }
}


