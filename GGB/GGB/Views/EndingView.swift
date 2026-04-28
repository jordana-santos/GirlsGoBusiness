//
//  EndingView.swift
//  GGB
//
//  Created by Jordana Lourenço Santos on 15/04/26.
//

import SwiftUI

struct EndingView: View {
    @Binding var path: [Route]
    
    var body: some View {
        ZStack{
            Color("background")
                .ignoresSafeArea()
            
            VStack(){
                Text("EndingView")
                    .font(.custom("Grenze-Regular", size: 20))
            }
        }
    }
}
