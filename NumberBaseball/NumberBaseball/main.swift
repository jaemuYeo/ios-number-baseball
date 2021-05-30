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
    print(StringPrintContents.selectMenu, terminator: "")
}

func printInfo() {
    print(StringPrintContents.inputManual)
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

func userInputNumbers() -> [Int] {
    print(StringPrintContents.input, terminator: "")
    
    guard let inputNumber = readLine() else {
        print(StringPrintContents.inputErrorMessage)
        return userInputNumbers()
    }
    
    let input = inputNumber.components(separatedBy: " ").compactMap {
        Int($0)
    }
    let numbers = Set(input)
    let duplicateRemoved = Array(numbers)
    
    guard duplicateRemoved.count == 3 else {
        print(StringPrintContents.inputErrorMessage)
        return userInputNumbers()
    }
    return duplicateRemoved
}

func startGame() {
    let computer = generateRandomNumbers()
    var user: [Int]
    var chance = 9
    var strike: Int
    var ball: Int
    
    while chance > 0 {
        chance -= 1
        user = userInputNumbers()
        strike = countStrikeNumber(user: user, computer: computer)
        ball = countBallNumber(user: user, computer: computer) - strike
        if chance < 1 {
            print(StringPrintContents.lose)
        }
        print("\(strike)\(StringPrintContents.strike)\(ball)\(StringPrintContents.ball)")
        if strike == 3 {
            print(StringPrintContents.win)
            break
        }
        print("\(StringPrintContents.chance)\(chance)")
    }
}
