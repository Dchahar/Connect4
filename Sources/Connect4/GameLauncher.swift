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
    var currentPlayer: Player = .one

    public init() {
        instructions = GameInstructions()
        board = Connect4Board()
    }

    mutating func switchPlayer() {
        currentPlayer = currentPlayer.next
    }

    var currentCoin: String {
        return currentPlayer.coin
    }

    func displayInstructions() {
        let fullInstructions = instructions.completeInstructions
        print(fullInstructions)
    }

    func waitForUserToStart() -> Bool {
        return readLine() != nil
    }

    func parseColumnInput(_ input: String) -> Int? {
        return Int(input)
    }

    func validateColumnInput(_ input: String) -> Int? {
        guard let column = parseColumnInput(input) else { return nil }
        guard board.isValidColumn(column) else { return nil }
        return column
    }

    func promptForColumn() -> Int {
        print("Enter a column number (1-7):")
        let input = readLine() ?? ""
        guard let column = validateColumnInput(input) else {
            print("Invalid input. Please enter a number between 1 and 7.")
            return promptForColumn()
        }
        return column
    }

    public mutating func startGame() {
        displayInstructions()
        guard waitForUserToStart() else { return }
        runGameLoop()
    }

    mutating func runGameLoop() {
        displayCurrentBoard()
        let column = promptForColumn()
        handleCoinDrop(column)
        guard !checkForWin() else { return }
        switchPlayer()
        runGameLoop()
    }

    func checkForWin() -> Bool {
        guard board.hasHorizontalWin(currentCoin) else { return false }
        print(board.displayBoard())
        print("\(currentPlayer.label) wins!")
        return true
    }

    mutating func handleCoinDrop(_ column: Int) {
        guard board.dropCoin(column: column, coin: currentCoin) != nil else {
            print("Column \(column) is full")
            handleCoinDrop(promptForColumn())
            return
        }
    }

    func displayCurrentBoard() {
        print("\n")
        print(board.displayBoard())
        print("\n")
        print("\(currentPlayer.label)'s turn (\(currentCoin))")
    }
}
