//
//  GameInstructionsTests.swift
//  Connect4
//
//  Created by Dheeraj Chahar on 09/12/2025.
//

import XCTest
@testable import Connect4

final class GameInstructionsTests: XCTestCase {

    func testInstructionsShouldContainWelcomeMessage() {
        let instructions = GameInstructions()
        let welcomeMessage = instructions.welcomeMessage
        XCTAssertTrue(welcomeMessage.contains("WELCOME TO CONNECT 4"))
        XCTAssertTrue(welcomeMessage.contains("===="))
        XCTAssertFalse(welcomeMessage.isEmpty)
    }

    func testInstructionsShouldExplainBoardDimensions() {
        let instructions = GameInstructions()
        let rulesMessage = instructions.rulesMessage
        XCTAssertTrue(rulesMessage.contains("6 rows"))
        XCTAssertTrue(rulesMessage.contains("7 columns"))
        XCTAssertTrue(rulesMessage.contains("1 through 7"))
        XCTAssertTrue(rulesMessage.contains("42"))
    }

    func testInstructionsShouldExplainCoinDropMechanics() {
        let instructions = GameInstructions()
        let rulesMessage = instructions.rulesMessage
        XCTAssertTrue(rulesMessage.contains("select a column"))
        XCTAssertTrue(rulesMessage.contains("dropped"))
        XCTAssertTrue(rulesMessage.contains("gravity"))
        XCTAssertTrue(rulesMessage.contains("lowest available row"))
    }
}
