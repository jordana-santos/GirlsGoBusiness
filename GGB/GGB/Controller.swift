//
//  Controller.swift
//  GGB
//
//  Created by Jordana Lourenço Santos on 15/04/26.
//

import Foundation
import SwiftUI

enum Route: String, Hashable, Codable, RawRepresentable {
    case home
    case manual
    case intro
    case game
    case end
    case instructions
}

extension Route {
    @MainActor
    @ViewBuilder
    func view(
        path: Binding<[Route]>,
        goodEnding: Binding<Bool>,
        whichInstructions: Binding<InstructionSection>
    ) -> some View {
        switch self {
        case .home:
            HomeView()
        case .manual:
            ManualView(path: path, whichInstructions: whichInstructions)
        case .intro:
            IntroView(path: path)
        case .game:
            GameView(path: path, goodEnding: goodEnding)
        case .end:
            EndingView(path: path, goodEnding: goodEnding)
        case .instructions:
            InstructionsView(path: path, whichInstructions: whichInstructions)
        }
    }
}
