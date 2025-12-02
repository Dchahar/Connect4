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
}
