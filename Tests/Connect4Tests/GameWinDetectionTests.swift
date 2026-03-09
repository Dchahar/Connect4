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
        let moves = buildAscendingDiagonalMoves(board)
        moves.forEach { board.dropCoin(column: $0.0, coin: $0.1) }
        XCTAssertTrue(board.hasDiagonalWin(board.player1Coin))
    }

    func testDescendingDiagonalWinWithFourCoins() {
        var board = Connect4Board()
        let moves = buildDescendingDiagonalMoves(board)
        moves.forEach { board.dropCoin(column: $0.0, coin: $0.1) }
        XCTAssertTrue(board.hasDiagonalWin(board.player1Coin))
    }

    private func buildAscendingDiagonalMoves(
        _ board: Connect4Board
    ) -> [(Int, String)] {
        let p1 = board.player1Coin
        let p2 = board.player2Coin
        return [
            (1, p1), (2, p2), (2, p1),
            (3, p2), (3, p2), (3, p1),
            (4, p2), (4, p2), (4, p2), (4, p1)
        ]
    }

    private func buildDescendingDiagonalMoves(
        _ board: Connect4Board
    ) -> [(Int, String)] {
        let p1 = board.player1Coin
        let p2 = board.player2Coin
        return [
            (4, p1), (3, p2), (3, p1),
            (2, p2), (2, p2), (2, p1),
            (1, p2), (1, p2), (1, p2), (1, p1)
        ]
    }
}
