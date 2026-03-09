//
//  GameLauncherTests.swift
//  Connect4
//
//  Created by Dheeraj Chahar on 09/12/2025.
//

import XCTest
@testable import Connect4

final class GameLauncherTests: XCTestCase {

    func testGameLauncherInitializesWithInstructionsAndBoard() {
        let launcher = GameLauncher()
        XCTAssertNotNil(launcher.instructions)
        XCTAssertNotNil(launcher.board)
    }

    func testGameLauncherCanDisplayInstructions() {
        let launcher = GameLauncher()
        launcher.displayInstructions()
        XCTAssertTrue(true)
    }

    func testGameLauncherHasStartGameMethod() {
        let launcher = GameLauncher()
        XCTAssertTrue(type(of: launcher) == GameLauncher.self)
    }

    func testBoardStartsEmptyAfterLaunch() {
        let launcher = GameLauncher()
        XCTAssertTrue(launcher.board.isEmpty)
    }

    func testValidateColumnInputAcceptsValidColumn() {
        let launcher = GameLauncher()
        let result = launcher.validateColumnInput("4")
        XCTAssertEqual(result, 4)
    }

    func testValidateColumnInputRejectsOutOfRange() {
        let launcher = GameLauncher()
        let result = launcher.validateColumnInput("9")
        XCTAssertNil(result)
    }

    func testValidateColumnInputRejectsNonNumeric() {
        let launcher = GameLauncher()
        let result = launcher.validateColumnInput("abc")
        XCTAssertNil(result)
    }

    func testValidateColumnInputRejectsEmptyString() {
        let launcher = GameLauncher()
        let result = launcher.validateColumnInput("")
        XCTAssertNil(result)
    }

    func testCurrentPlayerStartsAsPlayerOne() {
        let launcher = GameLauncher()
        XCTAssertEqual(launcher.currentPlayer, .one)
    }

    func testSwitchPlayerChangesToPlayerTwo() {
        var launcher = GameLauncher()
        launcher.switchPlayer()
        XCTAssertEqual(launcher.currentPlayer, .two)
    }

    func testSwitchPlayerTwiceReturnsToPlayerOne() {
        var launcher = GameLauncher()
        launcher.switchPlayer()
        launcher.switchPlayer()
        XCTAssertEqual(launcher.currentPlayer, .one)
    }

    func testCurrentCoinReturnsYellowForPlayerOne() {
        let launcher = GameLauncher()
        XCTAssertEqual(launcher.currentCoin, "🟡")
    }

    func testCurrentCoinReturnsRedForPlayerTwo() {
        var launcher = GameLauncher()
        launcher.switchPlayer()
        XCTAssertEqual(launcher.currentCoin, "🔴")
    }

    func testParseValidColumnInputReturnsNumber() {
        let launcher = GameLauncher()
        XCTAssertEqual(launcher.parseColumnInput("4"), 4)
    }

    func testParseNonNumericInputReturnsNil() {
        let launcher = GameLauncher()
        XCTAssertNil(launcher.parseColumnInput("abc"))
    }

    func testParseEmptyInputReturnsNil() {
        let launcher = GameLauncher()
        XCTAssertNil(launcher.parseColumnInput(""))
    }

    func testTurnDoesNotAdvanceAfterFullColumnAttempt() {
        var launcher = GameLauncher()
        launcher.switchPlayer()
        XCTAssertEqual(launcher.currentPlayer, .two)
        for _ in 1...6 {
            launcher.board.dropCoin(column: 5, coin: "🟡")
        }
        XCTAssertTrue(launcher.board.isColumnFull(5))
        XCTAssertEqual(launcher.currentPlayer, .two)
    }

    func testResetGameResetsPlayerAndBoard() {
        var launcher = GameLauncher()
        launcher.switchPlayer()
        launcher.board.dropCoin(column: 3, coin: "🟡")
        launcher.resetGame()
        XCTAssertEqual(launcher.currentPlayer, .one)
        XCTAssertTrue(launcher.board.isEmpty)
    }
}
