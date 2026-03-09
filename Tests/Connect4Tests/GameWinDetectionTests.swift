//
//  GameWinDetectionTests.swift
//  Connect4
//
//  Created by Dheeraj Chahar on 09/03/2026.
//

import XCTest
@testable import Connect4

final class GameWinDetectionTests: XCTestCase {

    func testNoHorizontalWinOnEmptyBoard() {
        let board = Connect4Board()
        XCTAssertFalse(board.hasHorizontalWin(board.player1Coin))
    }

    func testHorizontalWinWithFourConsecutiveCoins() {
        var board = Connect4Board()
        board.dropCoin(column: 3, coin: board.player1Coin)
        board.dropCoin(column: 4, coin: board.player1Coin)
        board.dropCoin(column: 5, coin: board.player1Coin)
        board.dropCoin(column: 6, coin: board.player1Coin)
        XCTAssertTrue(board.hasHorizontalWin(board.player1Coin))
    }

    func testThreeInARowDoesNotTriggerHorizontalWin() {
        var board = Connect4Board()
        board.dropCoin(column: 3, coin: board.player1Coin)
        board.dropCoin(column: 4, coin: board.player1Coin)
        board.dropCoin(column: 5, coin: board.player1Coin)
        XCTAssertFalse(board.hasHorizontalWin(board.player1Coin))
    }

    func testNoVerticalWinOnEmptyBoard() {
        let board = Connect4Board()
        XCTAssertFalse(board.hasVerticalWin(board.player1Coin))
    }

    func testVerticalWinWithFourStackedCoins() {
        var board = Connect4Board()
        board.dropCoin(column: 3, coin: board.player1Coin)
        board.dropCoin(column: 3, coin: board.player1Coin)
        board.dropCoin(column: 3, coin: board.player1Coin)
        board.dropCoin(column: 3, coin: board.player1Coin)
        XCTAssertTrue(board.hasVerticalWin(board.player1Coin))
    }

    func testThreeStackedDoesNotTriggerVerticalWin() {
        var board = Connect4Board()
        board.dropCoin(column: 3, coin: board.player1Coin)
        board.dropCoin(column: 3, coin: board.player1Coin)
        board.dropCoin(column: 3, coin: board.player1Coin)
        XCTAssertFalse(board.hasVerticalWin(board.player1Coin))
    }

    func testNoDiagonalWinOnEmptyBoard() {
        let board = Connect4Board()
        XCTAssertFalse(board.hasDiagonalWin(board.player1Coin))
    }

    func testAscendingDiagonalWinWithFourCoins() {
        var board = Connect4Board()
        board.dropCoin(column: 1, coin: board.player1Coin)
        board.dropCoin(column: 2, coin: board.player2Coin)
        board.dropCoin(column: 2, coin: board.player1Coin)
        board.dropCoin(column: 3, coin: board.player2Coin)
        board.dropCoin(column: 3, coin: board.player2Coin)
        board.dropCoin(column: 3, coin: board.player1Coin)
        board.dropCoin(column: 4, coin: board.player2Coin)
        board.dropCoin(column: 4, coin: board.player2Coin)
        board.dropCoin(column: 4, coin: board.player2Coin)
        board.dropCoin(column: 4, coin: board.player1Coin)
        XCTAssertTrue(board.hasDiagonalWin(board.player1Coin))
    }
}
