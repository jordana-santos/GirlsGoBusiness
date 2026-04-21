//
//  Keyboard.swift
//  GGB
//
//  Created by Jordana Lourenço Santos on 16/04/26.
//

import SwiftUI

public struct Keyboard: View {
    
    public var body: some View {
        ZStack{
            Rectangle()
                .frame(width: 350, height: 450)
                .foregroundColor(.gray)
                .cornerRadius(15)
            
            Text("teclado do enigma")
        }
    }
}
