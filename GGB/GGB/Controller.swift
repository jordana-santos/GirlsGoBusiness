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
    case solution
    case tip
}

extension Route {
    @MainActor
    @ViewBuilder
    func view(
        path: Binding<[Route]>
        
    ) -> some View {
        switch self {
        case .home:
            HomeView()
        case .manual:
            ManualView(path: path)
        case .intro:
            IntroView(path: path)
        case .game:
            GameView(path: path)
        case .end:
            EndingView(path: path)
        case .solution:
            SolutionView(path: path)
        case .tip:
            TipView(path: path)
        }
    }
}
