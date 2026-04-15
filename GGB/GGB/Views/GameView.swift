//
//  GameView.swift
//  GGB
//
//  Created by Jordana Lourenço Santos on 15/04/26.
//

import SwiftUI

struct GameView: View {
    @Binding var path: [Route]
    @State private var endTime: Date = Date().addingTimeInterval(28 * 60)
    
    var body: some View {
        VStack{
            CountdownTimer(end: endTime)
        }
    }
}
