//
//  enumInstructions.swift
//  GGB
//
//  Created by Jordana Lourenço Santos on 04/05/26.
//

import SwiftUI

enum InstructionSection: CaseIterable {
    case visaoGeral
    case antesDecomecar
    case comoJogar
    case dicasSolucoes
    case sobreTempo
    case componentes
    case objetivoEducativo

    var title: String {
        switch self {
        case .visaoGeral:
            return "Visão Geral"
        case .antesDecomecar:
            return "Antes de Começar"
        case .comoJogar:
            return "Como Jogar"
        case .dicasSolucoes:
            return "Dicas e Soluções"
        case .sobreTempo:
            return "Sobre o Tempo"
        case .componentes:
            return "Componentes"
        case .objetivoEducativo:
            return "Objetivo Educativo"
        }
    }

    var content: String {
        switch self {
        case .visaoGeral:
            return """
                Tipo: Jogo híbrido (tabuleiro físico + aplicativo)
                Jogadores: 4 pessoas
                Faixa etária: 12+
                Tempo de jogo: 28 minutos

                ⚠️  Este jogo só pode ser jogado com o tabuleiro físico e o aplicativo simultaneamente. Não é possível jogar utilizando apenas uma das partes.
            """
        case .antesDecomecar:
            return """
                Escolha uma superfície plana com espaço suficiente para o tabuleiro e os pacotes. Garanta boa iluminação, pois as cartas têm textos que precisam ser lidos com clareza.

                Decidam entre os dois modos de jogo antes de começar:

                Sem mediador:
                • Apenas os 4 jogadores.
                • As informações do aplicativo e do jogo devem ser lidas em voz alta para que todos ouçam. As decisões (respostas, dicas, soluções) devem ser tomadas em consenso.

                Com mediador:
                • 4 jogadores + 1 mediador.
                • O mediador lê as informações do aplicativo, seleciona as respostas escolhidas pelo grupo e gerencia dicas e soluções. O mediador não pode ajudar com as respostas dos enigmas, pois o aprendizado acontece no processo de descoberta.
            """
        case .comoJogar:
            return """
                Baixe e abra o aplicativo. Certifique-se de que todos estão próximos e conseguem ver ou ouvir o que está na tela.
            
                Leia a introdução em voz alta. É importante que todos conheçam a história antes de começar. O mediador ou um dos jogadores deve ler para o grupo.
            
                Durante a introdução, será indicado quais pacotes pegar. Separe-os, mas não os abra ainda.
            
                Após passar por toda a introdução, o jogo iniciará e o timer será ativado automaticamente. O jogo começa. Abra os pacotes.
            
                Resolva os enigmas. Há 2 enigmas nesta demo. As respostas são testadas no aplicativo.
            """
        case .dicasSolucoes:
            return """
                O aplicativo disponibiliza dicas para cada enigma. Se o grupo ficar mais de 8 minutos sem avançar, considere pedir uma dica.

                As soluções também estão disponíveis no aplicativo. Por ser um jogo educativo, recomendamos que o mediador seja o responsável por acessá-las e que sejam usadas apenas quando necessário.

                Dica de uso: mesmo que a solução seja usada, incentive o grupo a entender o porquê da resposta, não apenas anotá-la e seguir em frente.
            """
        case .sobreTempo:
            return """
                O timer de 28 minutos faz parte da narrativa do jogo, representando o ciclo sagrado da civilização. 

                Caso o jogo não seja concluído antes do tempo, há a opção de continuar sem contar o tempo. Recomendamos essa opção para não interromper o aprendizado. As dicas e soluções permanecem disponíveis mesmo após o tempo se esgotar.
            """
        case .componentes:
            return """
                Jogo físico:
            
                • Pacote 1: um folheto (diário de arqueologia)
                • Pacote 2: 1 tabuleiro 
                • Pacote 3: composto por 9 cartas de jogo e 1 carta enigma
                • Pacote 4: composto por 6 cartas de jogo e 1 carta enigma
                • Pacote 5: composto por 2 folhas escritas (glossário)

                Aplicativo:
            
                • Introdução do jogo
                • Timer de 28 minutos
                • Espaço para testar as respostas
                • Dicas para cada enigma
                • Soluções de cada enigma (recomendado para o mediador)

                Verifique se todos os pacotes estão presentes antes de começar. Os pacotes são numerados. Não os abra antes do momento indicado no aplicativo.
            """
        case .objetivoEducativo:
            return """
                Este jogo foi desenvolvido para que o aprendizado sobre ciclo menstrual aconteça de forma ativa e engajante. Os enigmas são construídos de forma que seja necessário compreender o conteúdo para resolvê-los, Assim, a resposta correta é consequência do entendimento.

                É importante evitar chutes as cegas diretamente no aplicativo, para que não comprometa a experiência e o aprendizado.
            """
        }
    }
}
