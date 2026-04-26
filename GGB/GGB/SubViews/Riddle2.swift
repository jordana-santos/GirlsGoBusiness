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
    ("grupo 1", "descricao grupo 1", Color("group1")),
    ("grupo 2", "descricao grupo 1", Color("group2")),
    ("grupo 3",  "descricao grupo 1", Color("group3")),
]

private let allItems: [Tile] = [
    Tile(label: "g1", groupIndex: 0),
    Tile(label: "g1", groupIndex: 0),
    Tile(label: "g1",   groupIndex: 0),
    Tile(label: "g2",  groupIndex: 1),
    Tile(label: "g2",   groupIndex: 1),
    Tile(label: "g2",    groupIndex: 1),
    Tile(label: "g3",   groupIndex: 2),
    Tile(label: "g3",    groupIndex: 2),
    Tile(label: "g3",    groupIndex: 2),
]

public struct Riddle2: View {
    @State private var items: [Tile] = allItems.shuffled()
    @State private var selected: Set<UUID> = []
    @State private var solvedIndices: [Int] = []
    @State private var shaking = false
    private let columns = Array(repeating: GridItem(.flexible(), spacing: 12), count: 3)
    var isComplete: Bool { solvedIndices.count == groupInfo.count }
    @Binding var page: Int

    public var body: some View {
        VStack{
            ZStack {
                Rectangle()
                    .frame(width: .infinity, height: 350)
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
                page += 1
            }
            Spacer()
        }
    }

    private var solvedBanners: some View {
        ForEach(solvedIndices, id: \.self) { idx in
            let info = groupInfo[idx]
            RoundedRectangle(cornerRadius: 12)
                .fill(info.color)
                .frame(height: 80)
                .overlay(
                    VStack(alignment: .center) {
                        Text(info.title)
                            .bold()
                            .foregroundColor(.white)
                        
                        Text(info.description)
                            .font(.caption)
                            .foregroundColor(.white)
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
                .font(.headline)
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

    // MARK: - Logic
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
        } else {
            shaking = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { shaking = false }
        }
        selected.removeAll()
    }
}
