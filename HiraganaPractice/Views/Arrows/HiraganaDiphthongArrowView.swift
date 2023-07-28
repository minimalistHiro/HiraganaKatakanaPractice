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
        case "ゃ":
            Arrow(x: 10, y: 250, degree: -20, number: 1, buttonPosition: .top)
            Arrow(x: 60, y: 180, degree: 30, number: 2, buttonPosition: .top)
            Arrow(x: 40, y: 180, degree: 60, number: 3, buttonPosition: .left)
        case "ゅ":
            Arrow(x: 40, y: 180, degree: 90, number: 1, buttonPosition: .right)
            Arrow(x: 75, y: 165, degree: 80, number: 2, buttonPosition: .right)
        case "ょ":
            Arrow(x: 45, y: 220, degree: 0, number: 1, buttonPosition: .top)
            Arrow(x: 75, y: 170, degree: 90, number: 2, buttonPosition: .right)
        case "き":
            Arrow(x: 40, y: 110, degree: -15, number: 1, buttonPosition: .top)
            Arrow(x: 60, y: 150, degree: -15, number: 2, buttonPosition: .top)
            Arrow(x: 120, y: 15, degree: 60, number: 3, buttonPosition: .left)
            Arrow(x: 90, y: 170, degree: 70, number: 4, buttonPosition: .left)
        case "し":
            Arrow(x: 110, y: 20, degree: 90, number: 1, buttonPosition: .right)
        case "ち":
            Arrow(x: 30, y: 105, degree: -5, number: 1, buttonPosition: .top)
            Arrow(x: 145, y: 15, degree: 100, number: 2, buttonPosition: .right)
        case "に":
            Arrow(x: 85, y: 25, degree: 95, number: 1, buttonPosition: .right)
            Arrow(x: 110, y: 120, degree: -20, number: 2, buttonPosition: .top)
            Arrow(x: 125, y: 160, degree: 50, number: 3, buttonPosition: .top)
        case "ひ":
            Arrow(x: 20, y: 100, degree: -15, number: 1, buttonPosition: .top)
        case "み":
            Arrow(x: 50, y: 80, degree: -5, number: 1, buttonPosition: .top)
            Arrow(x: 230, y: 95, degree: 95, number: 2, buttonPosition: .right)
        case "り":
            Arrow(x: 105, y: 20, degree: 90, number: 1, buttonPosition: .right)
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
