//
//  Connect4Board+WinDetection.swift
//  Connect4
//
//  Created by Dheeraj Chahar on 09/03/2026.
//

extension Connect4Board {

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
        let allDiagonals = ascendingDiagonals() + descendingDiagonals()
        return allDiagonals.contains { diagonal in
            containsFourConsecutive(diagonal, coin)
        }
    }

    private func ascendingDiagonals() -> [[String]] {
        return (0..<(rows + columns - 1)).map { sum in
            stride(from: rows - 1, through: 0, by: -1).compactMap { row in
                let col = sum - row
                guard (0..<columns).contains(col) else { return nil }
                return grid[row][col]
            }
        }
    }

    private func descendingDiagonals() -> [[String]] {
        return (-(columns - 1)..<rows).map { diff in
            (0..<rows).compactMap { row in
                let col = row - diff
                guard (0..<columns).contains(col) else { return nil }
                return grid[row][col]
            }
        }
    }

    func containsFourConsecutive(
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
}
