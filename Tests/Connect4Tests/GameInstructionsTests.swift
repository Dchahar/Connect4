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

    func testInstructionsExplainBoardDimensions() {
        let instructions = GameInstructions()
        let rulesMessage = instructions.rulesMessage
        XCTAssertTrue(rulesMessage.contains("6 rows"))
        XCTAssertTrue(rulesMessage.contains("7 columns"))
        XCTAssertTrue(rulesMessage.contains("1 through 7"))
        XCTAssertTrue(rulesMessage.contains("42"))
    }
}
