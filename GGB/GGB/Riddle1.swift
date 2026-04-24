//
//  Riddle1.swift
//  GGB
//
//  Created by Jordana Lourenço Santos on 24/04/26.
//

import SwiftUI

struct TileR1: Identifiable {
    let id = UUID()
    let label: String
    let groupIndex: Int
}

private let allItems: [TileR1] = [
    TileR1(label: "g1", groupIndex: 0),
    TileR1(label: "g1", groupIndex: 0),
    TileR1(label: "g1",   groupIndex: 0),
    TileR1(label: "g2",  groupIndex: 1),
    TileR1(label: "g2",   groupIndex: 1),
    TileR1(label: "g2",    groupIndex: 1),
]

struct Riddle1: View {
    var isComplete: Bool = false
    @Binding var riddle: Int
    
    var body: some View {
        VStack{
            ZStack {
                Rectangle()
                    .frame(width: 380, height: 100)
                    .foregroundColor(.teal)
                    .cornerRadius(15)
                

                HStack() {
                    Rectangle()
                        .frame(width: 65, height: 65)
                        .foregroundColor(.gray)
                        .cornerRadius(15)
                        .padding(5)
                    
                    Rectangle()
                        .frame(width: 65, height: 65)
                        .foregroundColor(.gray)
                        .cornerRadius(15)
                        .padding(5)
                    
                    Rectangle()
                        .frame(width: 65, height: 65)
                        .foregroundColor(.gray)
                        .cornerRadius(15)
                        .padding(5)
                    
                    Spacer()
                    
                    Rectangle() //caixa de resposta
                        .frame(width: 65, height: 65)
                        .foregroundColor(.gray)
                        .cornerRadius(15)
                        .padding(5)
                    
                }
                .frame(width: 350, height: 150)
            }
            Spacer()
        }
        .onChange(of: isComplete) { riddle += 1 }
    }
}
