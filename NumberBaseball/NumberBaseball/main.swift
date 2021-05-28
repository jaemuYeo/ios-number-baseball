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

func printMenu() {
    print(StringPrintContents.menu)
    print(StringPrintContents.input, terminator: "")
}

func selectMenu() {
    printMenu()
    guard let input = readLine() else {
        return
    }
    switch input {
    case "1":
        startGame()
    case "2":
        break
    default:
        print(StringPrintContents.inputErrorMessage)
        selectMenu()
    }
}

func startGame() {
    let computer = generateRandomNumbers()
    var chance = 9
    var strike: Int
    var ball: Int
    
    
}
