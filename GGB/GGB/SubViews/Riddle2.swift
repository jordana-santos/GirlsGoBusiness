//
//  Keyboard.swift
//  GGB
//
//  Created by Jordana Lourenço Santos on 16/04/26.
//

import SwiftUI

struct Tile: Identifiable {
    let id = UUID()
    let label: String
    let groupIndex: Int
}

private let groupInfo: [(title: String, description: String, color: Color)] = [
    ("Menstruação", "Sangramento, Pano absorvente externo, Recipiente de coleta interno", Color("group1")),
    ("Cansaço", "Fadiga, Movimento do corpo, Descanso intencional", Color("group2")),
    ("Cólica",  "Dor ou contração, Raiz de gengibre, Calor aplicado", Color("group3")),
]

private let allItems: [Tile] = [
    Tile(label: "YARA-INI", groupIndex: 0),
    Tile(label: "ORABVE", groupIndex: 0),
    Tile(label: "IXACOLE", groupIndex: 0),
    Tile(label: "YARA-PES", groupIndex: 1),
    Tile(label: "IXAFLU", groupIndex: 1),
    Tile(label: "ORAREPO", groupIndex: 1),
    Tile(label: "YARA-DORI", groupIndex: 2),
    Tile(label: "ORAKALI", groupIndex: 2),
    Tile(label: "IXAMORNI", groupIndex: 2),
]

public struct Riddle2: View {
    @State private var items: [Tile] = allItems.shuffled()
    @State private var selected: Set<UUID> = []
    @State private var solvedIndices: [Int] = []
    @State private var shaking = false
    private let columns = Array(repeating: GridItem(.flexible(), spacing: 12), count: 3)
    var isComplete: Bool { solvedIndices.count == groupInfo.count }
    @Binding var showOk: Bool

    public var body: some View {
        VStack{
            ZStack {
                Rectangle()
                    .frame(width: .infinity, height: 340)
                    .foregroundColor(Color("purple"))
                    .cornerRadius(15)
                    .padding(10)

                VStack() {
                    solvedBanners
                    tilesGrid
                }
                .padding(15)
            }
            .animation(.easeInOut, value: solvedIndices.count)
            .onChange(of: isComplete) {
                showOk = true
            }
            Spacer()
        }
    }

    private var solvedBanners: some View {
        ForEach(solvedIndices, id: \.self) { idx in
            let info = groupInfo[idx]
            RoundedRectangle(cornerRadius: 12)
                .fill(info.color)
                .frame(height: 100)
                .overlay(
                    VStack(alignment: .center) {
                        Text(info.title)
                            .font(.custom("Grenze-Bold", size: 24))
                            .foregroundColor(.white)
                        
                        Text(info.description)
                            .font(.custom("Grenze-Regular", size: 20))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                    }
                    .padding(.horizontal, 12)
                )
        }
    }

    private var tilesGrid: some View {
        LazyVGrid(columns: columns, spacing: 8) {
            ForEach(items) { item in
                TileCell(label: item.label, isSelected: selected.contains(item.id))
                    .onTapGesture { toggle(item) }
                    .id("\(item.id)-\(selected.contains(item.id))")
            }
        }
        .offset(x: shaking ? 12 : 0)
        .animation(
            shaking
                ? .spring(response: 0.15, dampingFraction: 0.2).repeatCount(4, autoreverses: true)
                : .default,
            value: shaking
        )
    }

    private struct TileCell: View {
        let label: String
        let isSelected: Bool

        var body: some View {
            Text(label)
                .font(.custom("ShadowsIntoLightTwo-Regular", size: 20))
                .foregroundStyle(.black)
                .multilineTextAlignment(.center)
                .frame(width: 110, height: 90)
                .background(Color("cardGreen"))
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(isSelected ? Color("purpleSelected") : Color.clear, lineWidth: 8)
                )
                .cornerRadius(10)
        }
    }

    private func toggle(_ item: Tile) {
        if selected.contains(item.id) {
            selected.remove(item.id)
        } else if selected.count < 3 {
            selected.insert(item.id)
        }
        if selected.count == 3 { verify() }
    }

    private func verify() {
        let picked = items.filter { selected.contains($0.id) }
        let groupIdx = picked[0].groupIndex
        let allMatch = picked.allSatisfy { $0.groupIndex == groupIdx }

        if allMatch {
            items.removeAll { selected.contains($0.id) }
            solvedIndices.append(groupIdx)
            selected.removeAll()
        } else {
            shaking = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.shaking = false
                withAnimation(nil) {
                    self.selected.removeAll()
                }
            }
        }
    }
    
}
