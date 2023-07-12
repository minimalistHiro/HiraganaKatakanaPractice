//
//  HiraganaDakuonArrowView.swift
//  HiraganaPractice
//
//  Created by 金子広樹 on 2023/07/11.
//

import SwiftUI

struct HiraganaSonantArrowView: View {
    let hiragana: String
    
    var body: some View {
        switch hiragana {
        case "が":
            Arrow(x: 15, y: 120, degree: 0, number: 1, buttonPosition: .top)
            Arrow(x: 140, y: 15, degree: 110, number: 2, buttonPosition: .right)
            Arrow(x: 170, y: 60, degree: 40, number: 3, buttonPosition: .top)
            Arrow(x: 190, y: 40, degree: 40, number: 4, buttonPosition: .top)
            Arrow(x: 210, y: 25, degree: 40, number: 5, buttonPosition: .top)
        case "ぎ":
            Arrow(x: 30, y: 70, degree: 30, number: 1, buttonPosition: .top)
            Arrow(x: 30, y: 110, degree: 30, number: 2, buttonPosition: .top)
            Arrow(x: 100, y: 15, degree: 60, number: 3, buttonPosition: .left)
            Arrow(x: 65, y: 180, degree: 60, number: 4, buttonPosition: .left)
            Arrow(x: 190, y: 40, degree: 40, number: 5, buttonPosition: .top)
            Arrow(x: 210, y: 25, degree: 40, number: 6, buttonPosition: .top)
        case "ぐ":
            Arrow(x: 210, y: 30, degree: 140, number: 1, buttonPosition: .top)
            Arrow(x: 190, y: 100, degree: 40, number: 2, buttonPosition: .bottom)
            Arrow(x: 240, y: 60, degree: 40, number: 3, buttonPosition: .top)
        case "げ":
            Arrow(x: 80, y: 20, degree: 90, number: 1, buttonPosition: .right)
            Arrow(x: 100, y: 85, degree: 45, number: 2, buttonPosition: .top)
            Arrow(x: 190, y: 15, degree: 90, number: 3, buttonPosition: .left)
            Arrow(x: 200, y: 30, degree: 40, number: 4, buttonPosition: .top)
            Arrow(x: 260, y: 25, degree: 40, number: 5, buttonPosition: .top)
        case "ご":
            Arrow(x: 60, y: 60, degree: 20, number: 1, buttonPosition: .top)
            Arrow(x: 55, y: 150, degree: 60, number: 2, buttonPosition: .top)
            Arrow(x: 190, y: 40, degree: 40, number: 3, buttonPosition: .top)
            Arrow(x: 210, y: 25, degree: 40, number: 4, buttonPosition: .top)
        case "ざ":
            Arrow(x: 40, y: 80, degree: 40, number: 1, buttonPosition: .top)
            Arrow(x: 110, y: 20, degree: 50, number: 2, buttonPosition: .left)
            Arrow(x: 80, y: 170, degree: 70, number: 3, buttonPosition: .left)
            Arrow(x: 190, y: 40, degree: 40, number: 4, buttonPosition: .top)
            Arrow(x: 210, y: 25, degree: 40, number: 5, buttonPosition: .top)
        case "じ":
            Arrow(x: 100, y: 20, degree: 90, number: 1, buttonPosition: .right)
            Arrow(x: 150, y: 60, degree: 40, number: 2, buttonPosition: .top)
            Arrow(x: 170, y: 40, degree: 40, number: 3, buttonPosition: .top)
        case "ず":
            Arrow(x: 15, y: 100, degree: 0, number: 1, buttonPosition: .top)
            Arrow(x: 160, y: 15, degree: 90, number: 2, buttonPosition: .right)
            Arrow(x: 200, y: 30, degree: 40, number: 3, buttonPosition: .top)
            Arrow(x: 260, y: 25, degree: 40, number: 4, buttonPosition: .top)
        case "ぜ":
            Arrow(x: 30, y: 110, degree: 0, number: 1, buttonPosition: .top)
            Arrow(x: 200, y: 20, degree: 90, number: 2, buttonPosition: .left)
            Arrow(x: 100, y: 30, degree: 90, number: 3, buttonPosition: .top)
            Arrow(x: 210, y: 30, degree: 40, number: 4, buttonPosition: .top)
            Arrow(x: 260, y: 25, degree: 40, number: 5, buttonPosition: .top)
        case "ぞ":
            Arrow(x: 50, y: 70, degree: 0, number: 1, buttonPosition: .top)
            Arrow(x: 190, y: 40, degree: 40, number: 2, buttonPosition: .top)
            Arrow(x: 210, y: 25, degree: 40, number: 3, buttonPosition: .top)
        case "だ":
            Arrow(x: 25, y: 100, degree: 0, number: 1, buttonPosition: .top)
            Arrow(x: 150, y: 20, degree: 110, number: 2, buttonPosition: .left)
            Arrow(x: 120, y: 160, degree: -20, number: 3, buttonPosition: .top)
            Arrow(x: 125, y: 180, degree: 55, number: 4, buttonPosition: .left)
            Arrow(x: 170, y: 50, degree: 40, number: 5, buttonPosition: .top)
            Arrow(x: 190, y: 35, degree: 40, number: 6, buttonPosition: .top)
        case "ぢ":
            Arrow(x: 30, y: 70, degree: 40, number: 1, buttonPosition: .top)
            Arrow(x: 110, y: 15, degree: 90, number: 2, buttonPosition: .right)
            Arrow(x: 170, y: 50, degree: 40, number: 3, buttonPosition: .top)
            Arrow(x: 190, y: 35, degree: 40, number: 4, buttonPosition: .top)
        case "づ":
            Arrow(x: 15, y: 130, degree: -20, number: 1, buttonPosition: .top)
            Arrow(x: 190, y: 40, degree: 40, number: 2, buttonPosition: .top)
            Arrow(x: 210, y: 25, degree: 40, number: 3, buttonPosition: .top)
        case "で":
            Arrow(x: 15, y: 100, degree: -10, number: 1, buttonPosition: .top)
            Arrow(x: 195, y: 140, degree: 40, number: 2, buttonPosition: .top)
            Arrow(x: 260, y: 100, degree: 40, number: 3, buttonPosition: .top)
        case "ど":
            Arrow(x: 100, y: 20, degree: 80, number: 1, buttonPosition: .right)
            Arrow(x: 200, y: 130, degree: 140, number: 2, buttonPosition: .right)
            Arrow(x: 180, y: 45, degree: 40, number: 3, buttonPosition: .top)
            Arrow(x: 200, y: 25, degree: 40, number: 4, buttonPosition: .top)
        case "ば":
            Arrow(x: 80, y: 20, degree: 90, number: 1, buttonPosition: .right)
            Arrow(x: 100, y: 85, degree: 45, number: 2, buttonPosition: .top)
            Arrow(x: 190, y: 15, degree: 90, number: 3, buttonPosition: .left)
            Arrow(x: 200, y: 30, degree: 40, number: 4, buttonPosition: .top)
            Arrow(x: 260, y: 25, degree: 40, number: 5, buttonPosition: .top)
        case "び":
            Arrow(x: 20, y: 105, degree: -20, number: 1, buttonPosition: .top)
            Arrow(x: 190, y: 30, degree: 40, number: 2, buttonPosition: .top)
            Arrow(x: 260, y: 25, degree: 40, number: 3, buttonPosition: .top)
        case "ぶ":
            Arrow(x: 90, y: 30, degree: 30, number: 1, buttonPosition: .top)
            Arrow(x: 110, y: 80, degree: 60, number: 2, buttonPosition: .left)
            Arrow(x: 50, y: 140, degree: 90, number: 3, buttonPosition: .right)
            Arrow(x: 170, y: 140, degree: 30, number: 4, buttonPosition: .top)
            Arrow(x: 180, y: 45, degree: 40, number: 5, buttonPosition: .top)
            Arrow(x: 200, y: 25, degree: 40, number: 6, buttonPosition: .top)
        case "べ":
            Arrow(x: 30, y: 210, degree: -50, number: 1, buttonPosition: .left)
            Arrow(x: 170, y: 60, degree: 40, number: 2, buttonPosition: .top)
            Arrow(x: 200, y: 40, degree: 40, number: 3, buttonPosition: .top)
        case "ぼ":
            Arrow(x: 80, y: 20, degree: 90, number: 1, buttonPosition: .right)
            Arrow(x: 105, y: 60, degree: 30, number: 2, buttonPosition: .top)
            Arrow(x: 100, y: 110, degree: 30, number: 3, buttonPosition: .top)
            Arrow(x: 190, y: 35, degree: 90, number: 4, buttonPosition: .left)
            Arrow(x: 200, y: 30, degree: 40, number: 5, buttonPosition: .top)
            Arrow(x: 260, y: 25, degree: 40, number: 6, buttonPosition: .top)
        case "ぱ":
            Arrow(x: 80, y: 20, degree: 90, number: 1, buttonPosition: .right)
            Arrow(x: 100, y: 85, degree: 45, number: 2, buttonPosition: .top)
            Arrow(x: 190, y: 15, degree: 90, number: 3, buttonPosition: .left)
            CurveArrow(x: 235, y: 20, number: 4)
        case "ぴ":
            Arrow(x: 20, y: 105, degree: -20, number: 1, buttonPosition: .top)
            CurveArrow(x: 225, y: 20, number: 2)
        case "ぷ":
            Arrow(x: 90, y: 30, degree: 30, number: 1, buttonPosition: .top)
            Arrow(x: 110, y: 80, degree: 60, number: 2, buttonPosition: .left)
            Arrow(x: 50, y: 140, degree: 90, number: 3, buttonPosition: .right)
            Arrow(x: 170, y: 140, degree: 30, number: 4, buttonPosition: .top)
            CurveArrow(x: 220, y: 35, number: 5)
        case "ぺ":
            Arrow(x: 30, y: 210, degree: -50, number: 1, buttonPosition: .left)
            CurveArrow(x: 210, y: 40, number: 2)
        case "ぽ":
            Arrow(x: 80, y: 20, degree: 90, number: 1, buttonPosition: .right)
            Arrow(x: 105, y: 60, degree: 30, number: 2, buttonPosition: .top)
            Arrow(x: 100, y: 110, degree: 30, number: 3, buttonPosition: .top)
            Arrow(x: 190, y: 35, degree: 90, number: 4, buttonPosition: .right)
            CurveArrow(x: 235, y: 20, number: 5)
        default:
            Arrow(x: 0, y: 0, degree: 0, number: 0, buttonPosition: .top)
        }
    }
}

struct HiraganaSonantArrowView_Previews: PreviewProvider {
    static var previews: some View {
        HiraganaSonantArrowView(hiragana: "が")
    }
}
