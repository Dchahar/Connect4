//
//  Connect4Tests.swift
//  Connect4
//
//  Created by Dheeraj Chahar on 09/12/2025.
//

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
        XCTAssertEqual(lines.first, "  1  2  3  4  5  6  7")
        XCTAssertTrue(lines[1].hasPrefix("6 "))
        XCTAssertTrue(lines[6].hasPrefix("1 "))
    }

    func testEmptySlotSymbolIsHollowCircle() {
        let board = Connect4Board()
        XCTAssertEqual(board.emptySlot, "⚪")
    }

    func testPlayer1CoinSymbolIsYellowCircle() {
        let board = Connect4Board()
        XCTAssertEqual(board.player1Coin, "🟡")
    }

    func testPlayer2CoinSymbolIsRedCircle() {
        let board = Connect4Board()
        XCTAssertEqual(board.player2Coin, "🔴")
    }

    func testValidColumnNumberIsAccepted() {
        let board = Connect4Board()
        XCTAssertTrue(board.isValidColumn(4))
    }

    func testColumnZeroIsRejected() {
        let board = Connect4Board()
        XCTAssertFalse(board.isValidColumn(0))
    }

    func testColumnEightIsRejected() {
        let board = Connect4Board()
        XCTAssertFalse(board.isValidColumn(8))
    }

    func testNegativeColumnIsRejected() {
        let board = Connect4Board()
        XCTAssertFalse(board.isValidColumn(-1))
    }

    func testDropCoinPlacesCoinAtBottomOfEmptyColumn() {
        var board = Connect4Board()
        let landedRow = board.dropCoin(column: 3, coin: board.player1Coin)
        XCTAssertEqual(landedRow, 1)
        XCTAssertEqual(board.grid[5][2], board.player1Coin)
    }

    func testSecondCoinStacksOnTopOfFirstInSameColumn() {
        var board = Connect4Board()
        board.dropCoin(column: 3, coin: board.player1Coin)
        let landedRow = board.dropCoin(column: 3, coin: board.player2Coin)
        XCTAssertEqual(landedRow, 2)
        XCTAssertEqual(board.grid[4][2], board.player2Coin)
    }

    func testEmptyColumnIsNotFull() {
        let board = Connect4Board()
        XCTAssertFalse(board.isColumnFull(3))
    }

    func testColumnWithSixCoinsIsFull() {
        var board = Connect4Board()
        for _ in 1...6 {
            board.dropCoin(column: 3, coin: board.player1Coin)
        }
        XCTAssertTrue(board.isColumnFull(3))
    }

    func testDropCoinReturnsNilForFullColumn() {
        var board = Connect4Board()
        for _ in 1...6 {
            board.dropCoin(column: 3, coin: board.player1Coin)
        }
        let result = board.dropCoin(column: 3, coin: board.player2Coin)
        XCTAssertNil(result)
    }
}
