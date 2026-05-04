//
//  IntroView.swift
//  GGB
//
//  Created by Jordana Lourenço Santos on 15/04/26.
//

import SwiftUI

struct IntroView: View {
    @Binding var path: [Route]
    @State private var page: Int = 0
    
    var body: some View {
        ZStack{
            Color("background")
                .ignoresSafeArea()
            
            VStack {
                ZStack {
                    Rectangle()
                        .frame(width: .infinity, height: 600)
                        .foregroundColor(Color("textbg"))
                        .cornerRadius(15)
                        .padding()
                    
                    ScrollView(){
                        if page == 2{
                            Text("Atenção: só abra os pacotes após o tempo começar a correr!")
                                .bold()
                                .padding()
                                .font(.custom("Grenze-Regular", size: 20))
                                .foregroundStyle(.black)
                        }
                        
                        Text(Texts()[page])
                            .padding()
                            .font(.custom("Grenze-Regular", size: 20))
                            .foregroundStyle(.black)
                    }
                    .frame(width: 380, height: 600)
                    .padding()
                }
                
                if page == 2 {
                    Button {
                        path.append(.game)
                    } label: {
                        Rectangle()
                            .frame(width: 350, height: 50)
                            .cornerRadius(12)
                            .foregroundColor(Color("green"))
                            .overlay(
                                Text("Iniciar timer")
                                    .foregroundColor(.white)
                                    .font(.custom("Grenze-Regular", size: 20))
                            )
                            .padding(5)
                    }
                } else {
                    Button {
                        page += 1
                    } label: {
                        Rectangle()
                            .frame(width: 350, height: 50)
                            .cornerRadius(15)
                            .foregroundColor(Color("green"))
                            .overlay(
                                Text("Continuar")
                                    .foregroundColor(.white)
                                    .font(.custom("Grenze-Regular", size: 20))
                            )
                            .padding(5)
                    }
                }
                
            }
        }
    }
    
    func Texts() -> [String]{
        let t1 = """
                Vocês vão jogar um jogo que aborda temas relacionados ao ciclo menstrual. 
                
                O conhecimento externo que vocês tiverem pode ajudar, mas vocês conseguem resolver só com mas informações do jogo.
                """
        
        let t2 = """
                Vocês são estudantes de arqueologia em expedição com sua Professora, especialista em civilizações antigas.
                
                Vocês estão no Templo de uma civilização matriarcal há milênios desaparecida, cujas ruínas emergem da água apenas durante o dia. À noite, o templo submerge completamente.
                
                Hoje, a Professora entrou para explorar sozinha. O sol está quase se pondo. Ela não voltou.
                
                Vocês têm 28 minutos para resgatá-la antes que o templo afunde!
                """
        
        let t3 = """
                Vocês entraram no templo e a porta se fechou. 
                
                Ao olhar pelo templo, vocês encontram o diário da arqueóloga. (pegue o pacote 1)
                
                Vocês olham para as paredes e é isso que vocês veem. (pegue o pacote 2)
                
                Vocês também encontram mais alguma coisa no chão. (pegue o pacote 3)
                
                Após tentar cumprir os enigmas, coloque a resposta no app. Dicas estarão disponíveis. Boa sorte!
                """
        return [t1, t2, t3]
    }
}


//#Preview {
//    @Previewable @State var path: [Route] = []
//    
//    NavigationStack(path: $path) {
//        IntroView(path: $path)
//            .navigationDestination(for: Route.self) { route in
//                route.view(path: $path, goodEnding: .constant(true))
//            }
//    }
//}
