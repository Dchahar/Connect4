import XCTest
@testable import Connect4

final class Connect4Tests: XCTestCase {

    func testShouldCreateABoardWithSixRowsAndSevenColumns() {
        let board = Connect4Board()
        XCTAssertEqual(board.grid.count, 6)
        for row in board.grid {
            XCTAssertEqual(row.count, 7)
        }
    }

    func testBoardStartsEmpty() {
        let board = Connect4Board()
        XCTAssertTrue(board.isEmpty)
    }

    func testDisplayBoardShowsLabelsAndEmptySlots() {
        let board = Connect4Board()
        let output = board.displayBoard()
        let lines = output.components(separatedBy: "\n")
        XCTAssertEqual(lines.count, 6 + 1)
        XCTAssertEqual(lines.first, "  1 2 3 4 5 6 7")
        XCTAssertTrue(lines[1].hasPrefix("6 "))
        XCTAssertTrue(lines.last!.hasPrefix("1 "))
    }
}
