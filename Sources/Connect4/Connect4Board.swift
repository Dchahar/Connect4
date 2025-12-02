import Foundation

struct Connect4Board {
    let emptySlot: String = "◯"
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
