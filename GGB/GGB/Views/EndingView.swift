//
//  EndingView.swift
//  GGB
//
//  Created by Jordana Lourenço Santos on 15/04/26.
//

import SwiftUI

struct EndingView: View {
    @Binding var path: [Route]
    @Binding var goodEnding: Bool
    @State private var page: Int = -1
    
    var body: some View {
        ZStack{
            Color("background")
                .ignoresSafeArea()
            
            if page == -1 {
                if goodEnding {
                    Image("goodEnding")
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
                    
                } else {
                    Image("badEnding")
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
                }
            } else {
                ZStack {
                    Rectangle()
                        .frame(width: .infinity, height: 650)
                        .foregroundColor(Color("textbg"))
                        .cornerRadius(15)
                        .padding()
                    
                    ScrollView(){
                        Text(EndingTexts()[page])
                            .padding()
                            .font(.custom("Grenze-Regular", size: 20))
                            .foregroundStyle(.black)
                    }
                    .frame(width: 380, height: 600)
                    .padding()
                }
            }

            VStack(){
                Spacer()
                Spacer()
                HStack(){
                    Spacer()
                    if page != 3 {
                        Button{ 
                            page += 1
                        } label: {
                            Rectangle()
                                .frame(width: 120, height: 50)
                                .cornerRadius(12)
                                .foregroundColor(Color("green"))
                                .overlay(
                                    Text("Próximo")
                                        .foregroundColor(.white)
                                        .font(.custom("Grenze-Regular", size: 20))
                                        .fontWeight(.bold)
                                )
                                .padding()
                        }
                        .padding()
                    } else {
                        Button{
                            path.removeAll()
                        } label: {
                            Rectangle()
                                .frame(width: 100, height: 50)
                                .cornerRadius(12)
                                .foregroundColor(Color("green"))
                                .overlay(
                                    Text("Início")
                                        .foregroundColor(.white)
                                        .font(.custom("Grenze-Regular", size: 20))
                                        .fontWeight(.bold)
                                )
                                .padding()
                        }
                        .padding()
                    }
                    
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

//#Preview {
//    @Previewable @State var path: [Route] = []
//    @Previewable @State var goodEnding: Bool = true
//    
//    NavigationStack(path: $path) {
//        EndingView(path: $path, goodEnding: $goodEnding)
//            .navigationDestination(for: Route.self) { route in
//                route.view(path: $path, goodEnding: .constant(true))
//            }
//    }
//}
