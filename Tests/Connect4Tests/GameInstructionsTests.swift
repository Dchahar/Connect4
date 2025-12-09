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
}
