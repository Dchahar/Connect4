//
//  GameInstructions.swift
//  Connect4
//
//  Created by Dheeraj Chahar on 09/12/2025.
//

import Foundation

struct GameInstructions {

    let welcomeMessage: String = """
    ========================================
            WELCOME TO CONNECT 4!
    ========================================
    """

    let rulesMessage: String = """
    
    GAME RULES:
    
    1. THE BOARD
       - The game board has 6 rows and 7 columns
       - Columns are numbered 1 through 7 from left to right
       - Rows are numbered 1 through 6 from bottom to top
       - There are 42 total positions on the board
    
    2. HOW TO PLAY
       - On your turn, select a column number (1-7)
       - Your coin will be dropped into that column
       - The coin falls down due to gravity
       - The coin lands in the lowest available row in that column
    
    3. TURN ORDER
       - Player 1 goes first
       - After Player 1's turn, Player 2 takes their turn
       - Players continue to alternate turns
       - Each player drops one coin per turn
    
    4. HOW TO WIN
       - Connect 4 of your coins in a row to win
       - Four coins can be connected horizontally
       - Four coins can be connected vertically
       - Four coins can be connected diagonally
       - The first player to connect 4 coins wins the game
    
    5. DRAW CONDITION
       - If all 42 positions are filled with coins and no player has connected 4 in a row
    """

    let startMessage: String = """
    
    ========================================
    
    Press ENTER to start the game...
    
    """
}
