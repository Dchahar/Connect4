//
//  GameLauncher.swift
//  Connect4
//
//  Created by Dheeraj Chahar on 09/03/2026.
//

import Foundation

enum Player {
    case one
    case two

    var coin: String {
        switch self {
        case .one: return "🟡"
        case .two: return "🔴"
        }
    }

    var label: String {
        switch self {
        case .one: return "Player 1"
        case .two: return "Player 2"
        }
    }

    var next: Player {
        switch self {
        case .one: return .two
        case .two: return .one
        }
    }
}
