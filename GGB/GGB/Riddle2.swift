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
    ("grupo 1", "descricao grupo 1", .blue),
    ("grupo 2", "descricao grupo 1", .purple),
    ("grupo 3",  "descricao grupo 1", .brown),
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
    @Binding var riddle: Int

    public var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 350, height: 450)
                .foregroundColor(.gray)
                .cornerRadius(15)

            VStack(spacing: 12) {
                solvedBanners
                tilesGrid
            }
            .padding(16)
            .frame(width: 350)
        }
        .animation(.easeInOut, value: solvedIndices.count)
        .onChange(of: isComplete) {
            riddle += 1
        }
    }

    private var solvedBanners: some View {
        ForEach(solvedIndices, id: \.self) { idx in
            let info = groupInfo[idx]
            RoundedRectangle(cornerRadius: 12)
                .fill(info.color.opacity(0.5))
                .overlay(
                    VStack(alignment: .center) {
                        Text(info.title).bold()
                        Text(info.description).font(.caption).opacity(0.8)
                    }
                    .padding(.horizontal, 12)
                )
                .overlay(RoundedRectangle(cornerRadius: 12).stroke(info.color, lineWidth: 1.5))
                .frame(height: 80)
        }
    }

    private var tilesGrid: some View {
        LazyVGrid(columns: columns, spacing: 12) {
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
                .frame(width: 90, height: 60)
                .background(isSelected ? Color.accentColor.opacity(0.4) : Color.white.opacity(0.2))
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(isSelected ? Color.accentColor : Color.clear, lineWidth: 2)
                )
                .cornerRadius(12)
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
