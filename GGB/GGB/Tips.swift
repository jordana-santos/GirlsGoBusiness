//
//  TipView.swift
//  GGB
//
//  Created by Jordana Lourenço Santos on 16/04/26.
//

import SwiftUI

struct Tips: View {
    @Binding var riddle: Int
    @Binding var counter: Int
    
    var body: some View {
        VStack{
            ZStack(){
                Rectangle()
                    .frame(width: 350, height: 400)
                    .foregroundColor(.gray)
                    .cornerRadius(15)
                    .padding(5)
                
                if riddle == 1{
                    Text(TipsRiddle1()[counter])
                        .padding(5)
                } else if riddle == 2{
                    Text(TipsRiddle2()[counter])
                        .padding(5)
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


