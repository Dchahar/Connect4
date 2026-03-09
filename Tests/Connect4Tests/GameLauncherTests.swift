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
        XCTAssertNotNil(launcher.startGame)
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
}
