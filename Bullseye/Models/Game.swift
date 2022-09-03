//
//  Game.swift
//  Bullseye
//
//  Created by Mohak Tamhane on 8/22/22.
//

import Foundation

struct LeaderboardEntry {
    var score: Int
    var date: Date
}

struct Game {
    var target: Int = Int.random(in: 1 ... 100)
    var score: Int = 0
    var round: Int = 1
    var leaderboardEntries: [LeaderboardEntry] = []
    
    init(loadTestData: Bool = false) {
        if loadTestData {
            leaderboardEntries.append(LeaderboardEntry(score: 100, date: Date()))
            leaderboardEntries.append(LeaderboardEntry(score: 80, date: Date()))
            leaderboardEntries.append(LeaderboardEntry(score: 200, date: Date()))
            leaderboardEntries.append(LeaderboardEntry(score: 50, date: Date()))
            leaderboardEntries.append(LeaderboardEntry(score: 20, date: Date()))
        }
    }
    
    func points(sliderValue: Int) -> Int {
        let difference: Int = abs(sliderValue - self.target)
        let bonus: Int
        if difference == 0 {
            bonus = 100
        } else if difference <= 2 {
            bonus = 50
        } else {
            bonus = 0
        }
        return 100 - difference + bonus
    }
    
    mutating func startNewRound(points: Int) {
        score += points
        round += 1
        target = Int.random(in: 1 ... 100)
        addToLeaderboard(points: points)
    }
    
    mutating func restart() {
        score = 0
        round = 1
        target = Int.random(in: 1 ... 100)
    }
    
    mutating func addToLeaderboard(points: Int) {
        leaderboardEntries.append(LeaderboardEntry(score: points, date: Date()))
        leaderboardEntries.sort{$0.score > $1.score}
    }
}
