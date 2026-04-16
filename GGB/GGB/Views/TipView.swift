//
//  TipView.swift
//  GGB
//
//  Created by Jordana Lourenço Santos on 16/04/26.
//

import SwiftUI

struct TipView: View {
    @Binding var path: [Route]
    @State private var endTime: Date = Date().addingTimeInterval(28 * 60)
    @State var timeout: Bool = false
    
    var body: some View {
        VStack {
            CountdownTimer(end: endTime, timeout: $timeout)
            Spacer()
        }
        
    }
}
