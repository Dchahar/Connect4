//
//  Connect4Board.swift
//  Connect4
//
//  Created by Dheeraj Chahar on 09/12/2025.
//

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

    func hasHorizontalWin(_ coin: String) -> Bool {
        return grid.contains { row in
            containsFourConsecutive(row, coin)
        }
    }

    func hasVerticalWin(_ coin: String) -> Bool {
        return (0..<columns).contains { column in
            let columnSlice = grid.map { $0[column] }
            return containsFourConsecutive(columnSlice, coin)
        }
    }

    func hasDiagonalWin(_ coin: String) -> Bool {
        return false
    }

    private func containsFourConsecutive(
        _ slots: [String],
        _ coin: String
    ) -> Bool {
        var count = 0
        for slot in slots {
            count = (slot == coin) ? count + 1 : 0
            guard count < 4 else { return true }
        }
        return false
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
        let header = buildHeader()
        let rows = buildRows()
        return ([header] + rows).joined(separator: "\n")
    }

    private func buildHeader() -> String {
        let columnNumbers = (1...columns).map { String($0) }
        return "  " + columnNumbers.joined(separator: " ")
    }

    private func buildRows() -> [String] {
        return grid.enumerated().map { (index, row) in
            let label = rows - index
            return "\(label) \(row.joined(separator: " "))"
        }
    }
}
