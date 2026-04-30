//
//  Footer.swift
//  GGB
//
//  Created by Jordana Lourenço Santos on 26/04/26.
//

import SwiftUI

struct Footer: View {
    @Binding var tipCounter: Int
    @Binding var page: Int
    @Binding var showTip: Bool
    @Binding var showSolution: Bool
    var okDisabled : Bool = false
    var onOK: () -> Void = {}
    @Binding var showOk: Bool
    
    var body: some View {
        HStack(){
            if (showTip || showSolution){
                Button {
                    showTip = false
                    showSolution = false
                } label: {
                    Rectangle()
                        .frame(width: .infinity, height: 50)
                        .cornerRadius(15)
                        .foregroundColor(Color("green"))
                        .overlay(
                            Text("ok")
                                .foregroundColor(.white)
                                .font(.custom("Grenze-Regular", size: 24))
                        )
                        .padding()
                }
            } else if page == 2{
                Button {
                    page += 1
                } label: {
                    Rectangle()
                        .frame(width: .infinity, height: 50)
                        .cornerRadius(15)
                        .foregroundColor(Color("green"))
                        .overlay(
                            Text("Próximo")
                                .foregroundColor(.white)
                                .font(.custom("Grenze-Regular", size: 24))
                        )
                        .padding()
                }
            } else {
                Button{
                    showTip = true
                    tipCounter += 1
                }label: {
                    Circle()
                        .frame(width: 60, height: 60)
                        .padding()
                        .foregroundColor(Color("yellow"))
                        .overlay(
                            Image(systemName: "lightbulb.max.fill")
                                .foregroundColor(Color("brown"))
                        )
                }
                .disabled(tipCounter >= 2)
                .opacity(tipCounter >= 2 ? 0.5 : 1.0)
                .onChange(of: page){
                    if page == 3 { tipCounter = -1 }
                }
                
                Button{
                    showSolution = true
                } label: {
                    Rectangle()
                        .frame(width: 120, height: 40)
                        .foregroundColor(Color("blue"))
                        .cornerRadius(10)
                        .overlay(
                            Text("Solução")
                                .foregroundColor(.white)
                                .font(.custom("Grenze-Regular", size: 24))
                        )
                }
                .disabled(tipCounter > 2)
                .opacity(tipCounter == -1 ? 0.5 : 1.0)
                
                Spacer()
                
                if showOk {
                    Button {
                        onOK()
                    } label: {
                        Rectangle()
                            .frame(width: 60, height: 40)
                            .foregroundColor(okDisabled ? .gray : Color("green"))
                            .cornerRadius(10)
                            .overlay(
                                Text("OK")
                                    .foregroundColor(.white)
                                    .font(.custom("Grenze-Regular", size: 24))
                            )
                            .padding()
                    }
                    .disabled(okDisabled)
                }
            }

        }
    }
}
