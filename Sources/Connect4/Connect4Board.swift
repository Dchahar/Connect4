import Foundation

struct Connect4Board {
    let emptySlot: String = "◯"
    let player1Coin: String = "🟡"
    let player2Coin: String = "🔴"
    let rows: Int = 6
    let columns: Int = 7

    var grid: [[String]]

    init() {
        self.grid = Array(repeating: Array(repeating: emptySlot, count: columns), count: rows)
    }

    var isEmpty: Bool {
        return grid.allSatisfy { row in
            row.allSatisfy { column in
                column == emptySlot
            }
        }
    }

    func isValidColumn(_ column: Int) -> Bool {
        return (1...columns).contains(column)
    }

    func isColumnFull(_ column: Int) -> Bool {
        return findLowestEmptyRow(column) == nil
    }

    func parseColumnInput(_ input: String) -> Int? {
        return Int(input)
    }

    @discardableResult
    mutating func dropCoin(column: Int, coin: String) -> Int? {
        guard let internalRow = findLowestEmptyRow(column) else { return nil }
        grid[internalRow][column - 1] = coin
        return rows - internalRow
    }

    private func findLowestEmptyRow(_ column: Int) -> Int? {
        let internalColumn = column - 1
        for internalRow in stride(from: rows - 1, through: 0, by: -1) {
            guard grid[internalRow][internalColumn] == emptySlot else { continue }
            return internalRow
        }
        return nil
    }

    func displayBoard() -> String {
        let columnSeparator = " "
        let columnNumbers = (1...columns).map { String($0) }
        let header = "  " + columnNumbers.joined(separator: columnSeparator)
        let lines = grid.enumerated().map { (internalIndex, row) -> String in
            let displayRowLabel = rows - internalIndex
            let rowContent = row.joined(separator: columnSeparator)
            return "\(displayRowLabel) \(rowContent)"
        }
        let allLines = [header] + lines
        return allLines.joined(separator: "\n")
    }
}
