//
//  BoardStateTests.swift
//  Connect4
//
//  Created by Dheeraj Chahar on 09/03/2026.
//

import XCTest
@testable import Connect4

final class BoardStateTests: XCTestCase {

    func testEmptyBoardIsNotFull() {
        let board = Connect4Board()
        XCTAssertFalse(board.isFull)
    }

    func testBoardIsFullWhenAllSlotsFilled() {
        var board = Connect4Board()
        for column in 1...7 {
            for _ in 1...6 {
                board.dropCoin(column: column, coin: board.player1Coin)
            }
        }
        XCTAssertTrue(board.isFull)
    }

    func testPartiallyFilledBoardIsNotFull() {
        var board = Connect4Board()
        board.dropCoin(column: 1, coin: board.player1Coin)
        board.dropCoin(column: 4, coin: board.player2Coin)
        XCTAssertFalse(board.isFull)
    }

    func testResetBoardMakesBoardEmptyAgain() {
        var board = Connect4Board()
        board.dropCoin(column: 1, coin: board.player1Coin)
        board.dropCoin(column: 3, coin: board.player2Coin)
        board.resetBoard()
        XCTAssertTrue(board.isEmpty)
    }
}
