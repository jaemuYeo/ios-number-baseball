//
//  Contents.swift
//  NumberBaseball
//
//  Created by 김태영 on 2021/05/27.
//

import Foundation

struct StringPrintContents {
    static let menu = """
        1. 게임시작
        2. 게임종료
        """
    static let selectMenu = "원하는 기능을 선택해주세요 :"
    static let inputManual = """
        숫자 3개를 띄어쓰기로 구분하여 입력해주세요.
        중복 숫자는 허용하지 않습니다.
        """
    static let input = "입력 : "
    static let strike = " 스트라이크, "
    static let ball = " 볼"
    static let win = "사용자승리!!"
    static let lose = "컴퓨터승리...!"
    static let chance = "남은 기회 : "
    static let inputErrorMessage = "입력이 잘못되었습니다"
}
