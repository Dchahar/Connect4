import Foundation

struct Connect4Board {
    let emptySlot: String = "◯"
    let rows: Int = 6
    let columns: Int = 7

    var grid: [[String]]

    init() {
        self.grid = Array(repeating: Array(repeating: emptySlot, count: columns), count: rows)
    }
}
