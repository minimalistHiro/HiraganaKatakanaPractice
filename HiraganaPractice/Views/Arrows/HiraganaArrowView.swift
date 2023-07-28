//
//  HiraganaArrowView.swift
//  HiraganaPractice
//
//  Created by 金子広樹 on 2023/07/11.
//

import SwiftUI

struct HiraganaArrowView: View {
    let hiragana: String
    
    var body: some View {
        switch hiragana {
        case "あ":
            Arrow(x: 50, y: 90, degree: 0, number: 1, buttonPosition: .top)
            Arrow(x: 140, y: 20, degree: 100, number: 2, buttonPosition: .right)
            Arrow(x: 190, y: 85, degree: 110, number: 3, buttonPosition: .right)
        case "い":
            Arrow(x: 60, y: 50, degree: 80, number: 1, buttonPosition: .top)
            Arrow(x: 180, y: 55, degree: 60, number: 2, buttonPosition: .top)
        case "う":
            Arrow(x: 90, y: 40, degree: 20, number: 1, buttonPosition: .top)
            Arrow(x: 50, y: 140, degree: -20, number: 2, buttonPosition: .top)
        case "え":
            Arrow(x: 90, y: 45, degree: 20, number: 1, buttonPosition: .top)
            Arrow(x: 45, y: 130, degree: -10, number: 2, buttonPosition: .top)
        case "お":
            Arrow(x: 30, y: 120, degree: -15, number: 1, buttonPosition: .top)
            Arrow(x: 110, y: 20, degree: 90, number: 2, buttonPosition: .right)
            Arrow(x: 160, y: 50, degree: 30, number: 3, buttonPosition: .top)
        case "か":
            Arrow(x: 15, y: 120, degree: 0, number: 1, buttonPosition: .top)
            Arrow(x: 140, y: 25, degree: 110, number: 2, buttonPosition: .right)
            Arrow(x: 185, y: 80, degree: 50, number: 3, buttonPosition: .top)
        case "き":
            Arrow(x: 40, y: 110, degree: -15, number: 1, buttonPosition: .top)
            Arrow(x: 60, y: 150, degree: -15, number: 2, buttonPosition: .top)
            Arrow(x: 120, y: 15, degree: 60, number: 3, buttonPosition: .left)
            Arrow(x: 90, y: 170, degree: 70, number: 4, buttonPosition: .left)
        case "く":
            Arrow(x: 210, y: 30, degree: 130, number: 1, buttonPosition: .right)
        case "け":
            Arrow(x: 85, y: 30, degree: 90, number: 1, buttonPosition: .right)
            Arrow(x: 100, y: 125, degree: -5, number: 2, buttonPosition: .top)
            Arrow(x: 200, y: 25, degree: 90, number: 3, buttonPosition: .right)
        case "こ":
            Arrow(x: 60, y: 80, degree: 0, number: 1, buttonPosition: .top)
            Arrow(x: 75, y: 150, degree: 70, number: 2, buttonPosition: .top)
        case "さ":
            Arrow(x: 30, y: 130, degree: -10, number: 1, buttonPosition: .top)
            Arrow(x: 115, y: 20, degree: 60, number: 2, buttonPosition: .left)
            Arrow(x: 105, y: 155, degree: 90, number: 3, buttonPosition: .left)
        case "し":
            Arrow(x: 110, y: 20, degree: 90, number: 1, buttonPosition: .right)
        case "す":
            Arrow(x: 15, y: 110, degree: -10, number: 1, buttonPosition: .top)
            Arrow(x: 165, y: 15, degree: 90, number: 2, buttonPosition: .right)
        case "せ":
            Arrow(x: 10, y: 150, degree: -15, number: 1, buttonPosition: .top)
            Arrow(x: 200, y: 15, degree: 90, number: 2, buttonPosition: .right)
            Arrow(x: 105, y: 35, degree: 90, number: 3, buttonPosition: .right)
        case "そ":
            Arrow(x: 60, y: 70, degree: 0, number: 1, buttonPosition: .top)
        case "た":
            Arrow(x: 25, y: 105, degree: 0, number: 1, buttonPosition: .top)
            Arrow(x: 140, y: 20, degree: 110, number: 2, buttonPosition: .right)
            Arrow(x: 120, y: 160, degree: -20, number: 3, buttonPosition: .top)
            Arrow(x: 130, y: 180, degree: 55, number: 4, buttonPosition: .left)
        case "ち":
            Arrow(x: 30, y: 105, degree: -5, number: 1, buttonPosition: .top)
            Arrow(x: 145, y: 15, degree: 100, number: 2, buttonPosition: .right)
        case "つ":
            Arrow(x: 15, y: 125, degree: -10, number: 1, buttonPosition: .top)
        case "て":
            Arrow(x: 20, y: 100, degree: -10, number: 1, buttonPosition: .top)
        case "と":
            Arrow(x: 90, y: 20, degree: 80, number: 1, buttonPosition: .right)
            Arrow(x: 245, y: 75, degree: 140, number: 2, buttonPosition: .right)
        case "な":
            Arrow(x: 20, y: 100, degree: -5, number: 1, buttonPosition: .top)
            Arrow(x: 130, y: 20, degree: 110, number: 2, buttonPosition: .right)
            Arrow(x: 160, y: 80, degree: 30, number: 3, buttonPosition: .top)
            Arrow(x: 170, y: 110, degree: 90, number: 4, buttonPosition: .left)
        case "に":
            Arrow(x: 85, y: 25, degree: 95, number: 1, buttonPosition: .right)
            Arrow(x: 110, y: 120, degree: -20, number: 2, buttonPosition: .top)
            Arrow(x: 125, y: 160, degree: 50, number: 3, buttonPosition: .top)
        case "ぬ":
            Arrow(x: 70, y: 40, degree: 75, number: 1, buttonPosition: .right)
            Arrow(x: 170, y: 20, degree: 100, number: 2, buttonPosition: .right)
        case "ね":
            Arrow(x: 105, y: 20, degree: 90, number: 1, buttonPosition: .right)
            Arrow(x: 20, y: 130, degree: -15, number: 2, buttonPosition: .top)
        case "の":
            Arrow(x: 160, y: 40, degree: 100, number: 1, buttonPosition: .right)
        case "は":
            Arrow(x: 85, y: 30, degree: 95, number: 1, buttonPosition: .right)
            Arrow(x: 95, y: 115, degree: -5, number: 2, buttonPosition: .top)
            Arrow(x: 195, y: 25, degree: 90, number: 3, buttonPosition: .right)
        case "ひ":
            Arrow(x: 20, y: 100, degree: -15, number: 1, buttonPosition: .top)
        case "ふ":
            Arrow(x: 95, y: 40, degree: 30, number: 1, buttonPosition: .top)
            Arrow(x: 110, y: 120, degree: 40, number: 2, buttonPosition: .left)
            Arrow(x: 45, y: 140, degree: 80, number: 3, buttonPosition: .right)
            Arrow(x: 195, y: 135, degree: 50, number: 4, buttonPosition: .top)
        case "へ":
            Arrow(x: 30, y: 190, degree: -50, number: 1, buttonPosition: .left)
        case "ほ":
            Arrow(x: 80, y: 30, degree: 95, number: 1, buttonPosition: .right)
            Arrow(x: 95, y: 80, degree: -5, number: 2, buttonPosition: .top)
            Arrow(x: 100, y: 130, degree: 0, number: 3, buttonPosition: .top)
            Arrow(x: 195, y: 35, degree: 90, number: 4, buttonPosition: .right)
        case "ま":
            Arrow(x: 40, y: 105, degree: -5, number: 1, buttonPosition: .top)
            Arrow(x: 50, y: 145, degree: 0, number: 2, buttonPosition: .top)
            Arrow(x: 160, y: 15, degree: 90, number: 3, buttonPosition: .right)
        case "み":
            Arrow(x: 50, y: 80, degree: -5, number: 1, buttonPosition: .top)
            Arrow(x: 230, y: 95, degree: 95, number: 2, buttonPosition: .right)
        case "む":
            Arrow(x: 30, y: 115, degree: -5, number: 1, buttonPosition: .top)
            Arrow(x: 120, y: 15, degree: 90, number: 2, buttonPosition: .right)
            Arrow(x: 175, y: 55, degree: 40, number: 3, buttonPosition: .top)
        case "め":
            Arrow(x: 75, y: 40, degree: 75, number: 1, buttonPosition: .right)
            Arrow(x: 185, y: 20, degree: 100, number: 2, buttonPosition: .right)
        case "も":
            Arrow(x: 150, y: 15, degree: 100, number: 1, buttonPosition: .right)
            Arrow(x: 40, y: 100, degree: 0, number: 2, buttonPosition: .top)
            Arrow(x: 40, y: 165, degree: 0, number: 3, buttonPosition: .top)
        case "や":
            Arrow(x: 15, y: 165, degree: -20, number: 1, buttonPosition: .top)
            Arrow(x: 115, y: 35, degree: 30, number: 2, buttonPosition: .left)
            Arrow(x: 70, y: 40, degree: 60, number: 3, buttonPosition: .left)
        case "ゆ":
            Arrow(x: 60, y: 45, degree: 85, number: 1, buttonPosition: .right)
            Arrow(x: 165, y: 15, degree: 85, number: 2, buttonPosition: .right)
        case "よ":
            Arrow(x: 110, y: 110, degree: -5, number: 1, buttonPosition: .top)
            Arrow(x: 150, y: 20, degree: 90, number: 2, buttonPosition: .right)
        case "ら":
            Arrow(x: 100, y: 30, degree: 30, number: 1, buttonPosition: .top)
            Arrow(x: 120, y: 70, degree: 100, number: 2, buttonPosition: .left)
        case "り":
            Arrow(x: 105, y: 20, degree: 90, number: 1, buttonPosition: .right)
            Arrow(x: 180, y: 20, degree: 80, number: 2, buttonPosition: .right)
        case "る":
            Arrow(x: 60, y: 80, degree: -5, number: 1, buttonPosition: .top)
        case "れ":
            Arrow(x: 105, y: 20, degree: 90, number: 1, buttonPosition: .right)
            Arrow(x: 20, y: 130, degree: -20, number: 2, buttonPosition: .top)
        case "ろ":
            Arrow(x: 60, y: 75, degree: -5, number: 1, buttonPosition: .top)
        case "わ":
            Arrow(x: 110, y: 20, degree: 90, number: 1, buttonPosition: .right)
            Arrow(x: 20, y: 130, degree: -20, number: 2, buttonPosition: .top)
        case "を":
            Arrow(x: 35, y: 90, degree: 0, number: 1, buttonPosition: .top)
            Arrow(x: 160, y: 15, degree: 115, number: 2, buttonPosition: .right)
            Arrow(x: 260, y: 110, degree: 140, number: 3, buttonPosition: .right)
        case "ん":
            Arrow(x: 165, y: 25, degree: 120, number: 1, buttonPosition: .right)
        default:
            Arrow(x: 0, y: 0, degree: 0, number: 0, buttonPosition: .top)
        }
    }
}

struct HiraganaArrowView_Previews: PreviewProvider {
    static var previews: some View {
        HiraganaArrowView(hiragana: "あ")
    }
}
