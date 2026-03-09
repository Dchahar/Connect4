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

    public func startGame() {
        displayInstructions()
        let userReady = waitForUserToStart()
        if userReady {
            let boardDisplay = board.displayBoard()
            print("\n")
            print(boardDisplay)
            print("\n")
            print("Game started! Player 1's turn.")
        }
    }
}
