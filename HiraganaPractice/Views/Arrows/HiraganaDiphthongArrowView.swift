//
//  hiraganaDiphthongArrowView.swift
//  HiraganaPractice
//
//  Created by 金子広樹 on 2023/07/12.
//

import SwiftUI

struct HiraganaDiphthongArrowView: View {
    let hiragana: String
    
    var body: some View {
        switch hiragana {
        case "ぁ":
            Arrow(x: 20, y: 185, degree: 20, number: 1, buttonPosition: .top)
            Arrow(x: 70, y: 145, degree: 90, number: 2, buttonPosition: .right)
            Arrow(x: 115, y: 190, degree: 140, number: 3, buttonPosition: .right)
        case "ぃ":
            Arrow(x: 25, y: 160, degree: 70, number: 1, buttonPosition: .top)
            Arrow(x: 80, y: 170, degree: 50, number: 2, buttonPosition: .top)
        case "ぇ":
            Arrow(x: 30, y: 165, degree: 20, number: 1, buttonPosition: .top)
            Arrow(x: 15, y: 220, degree: -20, number: 2, buttonPosition: .top)
        case "ぉ":
            Arrow(x: 5, y: 195, degree: 10, number: 1, buttonPosition: .top)
            Arrow(x: 50, y: 150, degree: 90, number: 2, buttonPosition: .left)
            Arrow(x: 80, y: 170, degree: 30, number: 3, buttonPosition: .top)
        case "ゃ":
            Arrow(x: 10, y: 235, degree: -20, number: 1, buttonPosition: .top)
            Arrow(x: 60, y: 160, degree: 30, number: 2, buttonPosition: .top)
            Arrow(x: 30, y: 160, degree: 60, number: 3, buttonPosition: .left)
        case "ゅ":
            Arrow(x: 40, y: 160, degree: 90, number: 1, buttonPosition: .right)
            Arrow(x: 75, y: 150, degree: 80, number: 2, buttonPosition: .right)
        case "ょ":
            Arrow(x: 30, y: 210, degree: 0, number: 1, buttonPosition: .top)
            Arrow(x: 70, y: 145, degree: 90, number: 2, buttonPosition: .right)
        case "き":
            Arrow(x: 30, y: 70, degree: 30, number: 1, buttonPosition: .top)
            Arrow(x: 30, y: 110, degree: 30, number: 2, buttonPosition: .top)
            Arrow(x: 100, y: 15, degree: 60, number: 3, buttonPosition: .left)
            Arrow(x: 65, y: 180, degree: 60, number: 4, buttonPosition: .left)
        case "し":
            Arrow(x: 100, y: 20, degree: 90, number: 1, buttonPosition: .right)
        case "ち":
            Arrow(x: 30, y: 70, degree: 40, number: 1, buttonPosition: .top)
            Arrow(x: 110, y: 15, degree: 90, number: 2, buttonPosition: .right)
        case "に":
            Arrow(x: 90, y: 25, degree: 100, number: 1, buttonPosition: .right)
            Arrow(x: 110, y: 70, degree: 20, number: 2, buttonPosition: .top)
            Arrow(x: 115, y: 160, degree: 60, number: 3, buttonPosition: .top)
        case "ひ":
            Arrow(x: 20, y: 105, degree: -20, number: 1, buttonPosition: .top)
        case "ふ":
            Arrow(x: 90, y: 30, degree: 30, number: 1, buttonPosition: .top)
            Arrow(x: 110, y: 80, degree: 60, number: 2, buttonPosition: .left)
            Arrow(x: 50, y: 140, degree: 90, number: 3, buttonPosition: .right)
            Arrow(x: 170, y: 140, degree: 30, number: 4, buttonPosition: .top)
        case "み":
            Arrow(x: 50, y: 90, degree: -20, number: 1, buttonPosition: .top)
            Arrow(x: 230, y: 90, degree: 100, number: 2, buttonPosition: .right)
        case "り":
            Arrow(x: 100, y: 30, degree: 90, number: 1, buttonPosition: .right)
            Arrow(x: 180, y: 20, degree: 80, number: 2, buttonPosition: .right)
        default:
            Arrow(x: 0, y: 0, degree: 0, number: 0, buttonPosition: .top)
        }
    }
}

struct HiraganaDiphthongArrowView_Previews: PreviewProvider {
    static var previews: some View {
        HiraganaDiphthongArrowView(hiragana: "き")
    }
}
