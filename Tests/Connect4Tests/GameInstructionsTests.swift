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

    func testInstructionsShouldExplainTurnOrder() {
        let instructions = GameInstructions()
        let rulesMessage = instructions.rulesMessage
        XCTAssertTrue(rulesMessage.contains("Player 1 goes first"))
        XCTAssertTrue(rulesMessage.contains("alternate"))
        XCTAssertTrue(rulesMessage.contains("Player 2"))
    }

    func testInstructionsShouldExplainWinCondition() {
        let instructions = GameInstructions()
        let rulesMessage = instructions.rulesMessage
        XCTAssertTrue(rulesMessage.contains("4"))
        XCTAssertTrue(rulesMessage.contains("horizontally"))
        XCTAssertTrue(rulesMessage.contains("vertically"))
        XCTAssertTrue(rulesMessage.contains("diagonally"))
        XCTAssertTrue(rulesMessage.contains("win"))
    }

    func testInstructionsShouldExplainDrawCondition() {
        let instructions = GameInstructions()
        let rulesMessage = instructions.rulesMessage
        XCTAssertTrue(rulesMessage.contains("filled"))
        XCTAssertTrue(rulesMessage.contains("no player"))
    }

    func testInstructionsShouldExplainColumnSelection() {
        let instructions = GameInstructions()
        let rulesMessage = instructions.rulesMessage
        XCTAssertTrue(rulesMessage.contains("column number"))
        XCTAssertTrue(rulesMessage.contains("1-7"))
    }

    func testInstructionsShouldProvideStartMessage() {
        let instructions = GameInstructions()
        let startMessage = instructions.startMessage
        XCTAssertTrue(startMessage.contains("Press"))
        XCTAssertTrue(startMessage.contains("ENTER"))
        XCTAssertTrue(startMessage.contains("start"))
        XCTAssertFalse(startMessage.isEmpty)
    }

    func testFullInstructionsShouldIncludeAllComponents() {
        let instructions = GameInstructions()
        let completeInstructions = instructions.completeInstructions
        XCTAssertTrue(completeInstructions.contains("WELCOME TO CONNECT 4"))
        XCTAssertTrue(completeInstructions.contains("6 rows"))
        XCTAssertTrue(completeInstructions.contains("gravity"))
        XCTAssertTrue(completeInstructions.contains("Player 1 goes first"))
        XCTAssertTrue(completeInstructions.contains("horizontally"))
        XCTAssertTrue(completeInstructions.contains("filled"))
        XCTAssertTrue(completeInstructions.contains("Press ENTER"))
    }
}
