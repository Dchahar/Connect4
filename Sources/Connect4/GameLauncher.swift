//
//  GameLauncher.swift
//  Connect4
//
//  Created by Dheeraj Chahar on 09/12/2025.
//

import Foundation

public struct GameLauncher {

    let instructions: GameInstructions
    var board: Connect4Board

    public init() {
        instructions = GameInstructions()
        board = Connect4Board()
    }

    func displayInstructions() {
        let fullInstructions = instructions.completeInstructions
        print(fullInstructions)
    }

    func waitForUserToStart() -> Bool {
        let input = readLine()
        if input != nil { return true }
        return false
    }

    func validateColumnInput(_ input: String) -> Int? {
        guard let column = board.parseColumnInput(input) else { return nil }
        guard board.isValidColumn(column) else { return nil }
        return column
    }

    func promptForColumn() -> Int {
        print("Enter a column number (1-7):")
        let input = readLine() ?? ""
        let column = validateColumnInput(input)
        if column != nil { return column! }
        print("Invalid input. Please enter a number between 1 and 7.")
        return promptForColumn()
    }

    public mutating func startGame() {
        displayInstructions()
        let userReady = waitForUserToStart()
        guard userReady else { return }
        runGameLoop()
    }

    mutating func runGameLoop() {
        var gameOver = false
        while !gameOver {
            print("\n")
            print(board.displayBoard())
            print("\n")
            print("Player 1's turn (\(board.player1Coin))")
            let column = promptForColumn()
            print("Column \(column) selected.")
            gameOver = true
        }
    }
}
