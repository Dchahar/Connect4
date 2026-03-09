//
//  GameOutcomeTests.swift
//  Connect4
//
//  Created by Dheeraj Chahar on 09/03/2026.
//

import XCTest
@testable import Connect4

final class GameOutcomeTests: XCTestCase {

    func testWinOutcomeMessageIncludesPlayerLabel() {
        let outcome = GameOutcome.win(Player.one)
        XCTAssertEqual(outcome.message, "Player 1 wins!")
    }

    func testDrawOutcomeMessage() {
        let outcome = GameOutcome.draw
        XCTAssertEqual(outcome.message, "It's a draw!")
    }
}
