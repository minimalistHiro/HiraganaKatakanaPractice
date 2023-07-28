//
//  hiraganaDiphthongSonantArrowView.swift
//  HiraganaPractice
//
//  Created by 金子広樹 on 2023/07/12.
//

import SwiftUI

struct HiraganaDiphthongSonantArrowView: View {
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
        case "ぎ":
            Arrow(x: 40, y: 110, degree: -10, number: 1, buttonPosition: .top)
            Arrow(x: 60, y: 150, degree: -10, number: 2, buttonPosition: .top)
            Arrow(x: 110, y: 15, degree: 60, number: 3, buttonPosition: .left)
            Arrow(x: 85, y: 170, degree: 65, number: 4, buttonPosition: .left)
            Arrow(x: 190, y: 40, degree: 50, number: 5, buttonPosition: .top)
            Arrow(x: 210, y: 25, degree: 50, number: 6, buttonPosition: .top)
        case "じ":
            Arrow(x: 110, y: 20, degree: 90, number: 1, buttonPosition: .right)
            Arrow(x: 140, y: 70, degree: 40, number: 2, buttonPosition: .top)
            Arrow(x: 160, y: 50, degree: 40, number: 3, buttonPosition: .top)
        case "ぢ":
            Arrow(x: 30, y: 105, degree: 0, number: 1, buttonPosition: .top)
            Arrow(x: 140, y: 15, degree: 100, number: 2, buttonPosition: .right)
            Arrow(x: 190, y: 40, degree: 40, number: 3, buttonPosition: .top)
            Arrow(x: 210, y: 25, degree: 40, number: 4, buttonPosition: .top)
        case "び":
            Arrow(x: 20, y: 95, degree: -10, number: 1, buttonPosition: .top)
            Arrow(x: 195, y: 30, degree: 50, number: 2, buttonPosition: .top)
            Arrow(x: 260, y: 30, degree: 50, number: 3, buttonPosition: .top)
        case "ぴ":
            Arrow(x: 20, y: 95, degree: -10, number: 1, buttonPosition: .top)
            CurveArrow(x: 230, y: 20, number: 2)
        default:
            Arrow(x: 0, y: 0, degree: 0, number: 0, buttonPosition: .top)
        }
    }
}

struct HiraganaDiphthongSonantArrowView_Previews: PreviewProvider {
    static var previews: some View {
        HiraganaDiphthongSonantArrowView(hiragana: "ぎ")
    }
}
