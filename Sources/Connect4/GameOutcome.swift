//
//  GameOutcome.swift
//  Connect4
//
//  Created by Dheeraj Chahar on 09/03/2026.
//

enum GameOutcome {
    case win(Player)

    var message: String {
        switch self {
        case .win(let player):
            return "\(player.label) wins!"
        }
    }
}
