import SwiftUI

struct PuzzleRow: Identifiable {
    let id: Int
    let tiles: [String]
    let options: [String]
    let answerAsset: String
    let defaultSlotAsset: String
}


struct Riddle1: View {
    @Binding var allCorrect: Bool
    @Binding var allFilled: Bool
    @Binding var shouldCheck: Bool
    
    @State private var selectedRowID: Int? = nil
    @State private var answers: [Int: String] = [:]
    @State private var shuffledOptions: [Int: [String]] = [:]
    @State private var showTryAgain: Bool = false
    
    private let rows: [PuzzleRow] = [
       PuzzleRow(
           id: 0,
           tiles: ["r1left", "middle", "r1right"],
           options: ["tile1", "tile2", "tile3", "tile4", "tile5", "tile6"],
           answerAsset: "tile3",
           defaultSlotAsset: "answer"
       ),
       PuzzleRow(
           id: 1,
           tiles: ["r2left", "middle", "r2right"],
           options: ["tile1", "tile2", "tile3", "tile4", "tile5", "tile6"],
           answerAsset: "tile2",
           defaultSlotAsset: "answer"
       ),
    ]

    var body: some View {
        VStack(spacing: 16) {

            ForEach(rows) { row in
                VStack {
                    HStack {
                        ForEach(row.tiles, id: \.self) { asset in
                            Image(asset)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 64, height: 64)
                                .padding(5)
                        }

                        Spacer()

                        Image(answers[row.id] ?? "answer")
                            .resizable()
                            .scaledToFit()
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            .frame(width: 64, height: 64)
                    }
                    .padding(10)
                    .contentShape(Rectangle())
                    .onTapGesture { selectRow(row) }

                    if selectedRowID == row.id,
                       let keys = shuffledOptions[row.id] {
                        Divider().padding(.horizontal, 12)

                        LazyVGrid(
                            columns: Array(repeating: GridItem(.flexible(), spacing: 10), count: 3),
                            spacing: 10
                        ) {
                            ForEach(keys, id: \.self) { asset in
                                Image(asset)
                                    .resizable()
                                    .scaledToFit()
                                    .padding(5)
                                    .frame(height: 100)
                                    .contentShape(Rectangle())
                                    .onTapGesture {
                                        answers[row.id] = asset
                                        showTryAgain = false
                                        updateAllFilled()
                                    }
                            }
                        }
                        .padding(12)
                    }
                }
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color("purple"))
                )
            }

            Spacer()
            
            if showTryAgain {
                Text("Resposta incorreta, tente novamente.")
                    .font(.custom("Grenze-Regular", size: 20))
                    .foregroundColor(Color("red"))
                    .padding(.horizontal, 4)
            }
        }
        .padding()
        .animation(.easeInOut(duration: 0.5), value: selectedRowID)
        .onChange(of: shouldCheck) {
            if shouldCheck {
                shouldCheck = false
                confirmAnswer()
            }
        }
    }
    
    private func updateAllFilled() {
        allFilled = rows.allSatisfy { answers[$0.id] != nil }
    }
    
    private func selectRow(_ row: PuzzleRow) {
        if selectedRowID == row.id {
            selectedRowID = nil
        } else {
            selectedRowID = row.id
            shuffledOptions[row.id] = row.options.shuffled()
        }
    }

    func confirmAnswer() {
        guard allFilled else { return }
 
        let correct = rows.allSatisfy { answers[$0.id] == $0.answerAsset }
 
        if correct {
            allCorrect = true
        } else {
            showTryAgain = true
        }
    }
}
