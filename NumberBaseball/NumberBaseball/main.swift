//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func generateRandomNumbers() -> [Int] {
    var numbers: Set<Int> = []
    
    while numbers.count < 3 {
        let number = Int.random(in: 1...9)
        numbers.insert(number)
    }
    return Array(numbers)
}

func countStrikeNumber(user: [Int], computer: [Int]) -> Int {
    var count = 0
    
    for number in 0...2 {
        if user[number] == computer[number] {
            count += 1
        }
    }
    return count
}

func countBallNumber(user: [Int], computer: [Int]) -> Int {
    var count = 0
    
    for computerNumber in computer {
            if user.contains(computerNumber) {
                count += 1
            }
        }
    return count
}

func startGame() {
    let computerNumbers = generateRandomNumbers()
    var userNumbers: [Int]
    var chance = 9
    var strike: Int
    var ball: Int
    
    while chance != 0 {
        chance -= 1
        userNumbers = generateRandomNumbers()
        print("\(StringPrintContents.randomNumber)\(userNumbers[0]) \(userNumbers[1]) \(userNumbers[2])")
        strike = countStrikeNumber(user: userNumbers, computer: computerNumbers)
        ball = countBallNumber(user: userNumbers, computer: computerNumbers) - strike
        if chance < 1 {
            print("\(StringPrintContents.lose)")
        }
        print("\(strike)\(StringPrintContents.strike)\(ball)\(StringPrintContents.ball)")
        if strike == 3 {
            print("\(StringPrintContents.win)")
            break
        }
        print("\(StringPrintContents.chance)\(chance)")
    }
}

startGame()
