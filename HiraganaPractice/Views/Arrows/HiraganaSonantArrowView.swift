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
            Arrow(x: 15, y: 125, degree: 0, number: 1, buttonPosition: .top)
            Arrow(x: 135, y: 25, degree: 110, number: 2, buttonPosition: .right)
            Arrow(x: 180, y: 75, degree: 50, number: 3, buttonPosition: .top)
            Arrow(x: 200, y: 50, degree: 50, number: 4, buttonPosition: .top)
            Arrow(x: 220, y: 35, degree: 50, number: 5, buttonPosition: .top)
        case "ぎ":
            Arrow(x: 40, y: 110, degree: -10, number: 1, buttonPosition: .top)
            Arrow(x: 60, y: 150, degree: -10, number: 2, buttonPosition: .top)
            Arrow(x: 110, y: 15, degree: 60, number: 3, buttonPosition: .left)
            Arrow(x: 85, y: 170, degree: 65, number: 4, buttonPosition: .left)
            Arrow(x: 190, y: 40, degree: 50, number: 5, buttonPosition: .top)
            Arrow(x: 210, y: 25, degree: 50, number: 6, buttonPosition: .top)
        case "ぐ":
            Arrow(x: 210, y: 30, degree: 140, number: 1, buttonPosition: .top)
            Arrow(x: 200, y: 100, degree: 50, number: 2, buttonPosition: .bottom)
            Arrow(x: 255, y: 50, degree: 40, number: 3, buttonPosition: .top)
        case "げ":
            Arrow(x: 85, y: 30, degree: 90, number: 1, buttonPosition: .right)
            Arrow(x: 100, y: 125, degree: -5, number: 2, buttonPosition: .top)
            Arrow(x: 190, y: 25, degree: 90, number: 3, buttonPosition: .left)
            Arrow(x: 210, y: 30, degree: 40, number: 4, buttonPosition: .top)
            Arrow(x: 260, y: 25, degree: 40, number: 5, buttonPosition: .top)
        case "ご":
            Arrow(x: 50, y: 85, degree: 0, number: 1, buttonPosition: .top)
            Arrow(x: 75, y: 150, degree: 70, number: 2, buttonPosition: .top)
            Arrow(x: 195, y: 45, degree: 50, number: 3, buttonPosition: .top)
            Arrow(x: 215, y: 30, degree: 50, number: 4, buttonPosition: .top)
        case "ざ":
            Arrow(x: 30, y: 130, degree: -15, number: 1, buttonPosition: .top)
            Arrow(x: 115, y: 20, degree: 60, number: 2, buttonPosition: .left)
            Arrow(x: 90, y: 160, degree: 70, number: 3, buttonPosition: .left)
            Arrow(x: 190, y: 40, degree: 50, number: 4, buttonPosition: .top)
            Arrow(x: 210, y: 25, degree: 50, number: 5, buttonPosition: .top)
        case "じ":
            Arrow(x: 110, y: 20, degree: 90, number: 1, buttonPosition: .right)
            Arrow(x: 140, y: 70, degree: 40, number: 2, buttonPosition: .top)
            Arrow(x: 160, y: 50, degree: 40, number: 3, buttonPosition: .top)
        case "ず":
            Arrow(x: 15, y: 110, degree: -5, number: 1, buttonPosition: .top)
            Arrow(x: 165, y: 15, degree: 90, number: 2, buttonPosition: .right)
            Arrow(x: 215, y: 30, degree: 40, number: 3, buttonPosition: .top)
            Arrow(x: 260, y: 25, degree: 40, number: 4, buttonPosition: .top)
        case "ぜ":
            Arrow(x: 15, y: 150, degree: -20, number: 1, buttonPosition: .top)
            Arrow(x: 195, y: 20, degree: 90, number: 2, buttonPosition: .left)
            Arrow(x: 100, y: 40, degree: 85, number: 3, buttonPosition: .top)
            Arrow(x: 215, y: 30, degree: 40, number: 4, buttonPosition: .top)
            Arrow(x: 260, y: 25, degree: 40, number: 5, buttonPosition: .top)
        case "ぞ":
            Arrow(x: 60, y: 70, degree: 0, number: 1, buttonPosition: .top)
            Arrow(x: 190, y: 40, degree: 40, number: 2, buttonPosition: .top)
            Arrow(x: 210, y: 25, degree: 40, number: 3, buttonPosition: .top)
        case "だ":
            Arrow(x: 25, y: 105, degree: 0, number: 1, buttonPosition: .top)
            Arrow(x: 140, y: 20, degree: 105, number: 2, buttonPosition: .left)
            Arrow(x: 120, y: 160, degree: -20, number: 3, buttonPosition: .top)
            Arrow(x: 135, y: 180, degree: 55, number: 4, buttonPosition: .left)
            Arrow(x: 180, y: 40, degree: 40, number: 5, buttonPosition: .top)
            Arrow(x: 200, y: 25, degree: 40, number: 6, buttonPosition: .top)
        case "ぢ":
            Arrow(x: 30, y: 105, degree: 0, number: 1, buttonPosition: .top)
            Arrow(x: 140, y: 15, degree: 100, number: 2, buttonPosition: .right)
            Arrow(x: 190, y: 40, degree: 40, number: 3, buttonPosition: .top)
            Arrow(x: 210, y: 25, degree: 40, number: 4, buttonPosition: .top)
        case "づ":
            Arrow(x: 15, y: 130, degree: -10, number: 1, buttonPosition: .top)
            Arrow(x: 180, y: 35, degree: 40, number: 2, buttonPosition: .top)
            Arrow(x: 210, y: 25, degree: 40, number: 3, buttonPosition: .top)
        case "で":
            Arrow(x: 15, y: 110, degree: -10, number: 1, buttonPosition: .top)
            Arrow(x: 200, y: 30, degree: 50, number: 2, buttonPosition: .top)
            Arrow(x: 260, y: 30, degree: 50, number: 3, buttonPosition: .top)
        case "ど":
            Arrow(x: 90, y: 20, degree: 80, number: 1, buttonPosition: .right)
            Arrow(x: 200, y: 130, degree: 150, number: 2, buttonPosition: .right)
            Arrow(x: 195, y: 40, degree: 50, number: 3, buttonPosition: .top)
            Arrow(x: 220, y: 25, degree: 50, number: 4, buttonPosition: .top)
        case "ば":
            Arrow(x: 80, y: 30, degree: 90, number: 1, buttonPosition: .right)
            Arrow(x: 95, y: 115, degree: 0, number: 2, buttonPosition: .top)
            Arrow(x: 195, y: 30, degree: 90, number: 3, buttonPosition: .left)
            Arrow(x: 200, y: 30, degree: 40, number: 4, buttonPosition: .top)
            Arrow(x: 250, y: 25, degree: 40, number: 5, buttonPosition: .top)
        case "び":
            Arrow(x: 20, y: 95, degree: -10, number: 1, buttonPosition: .top)
            Arrow(x: 195, y: 30, degree: 50, number: 2, buttonPosition: .top)
            Arrow(x: 260, y: 30, degree: 50, number: 3, buttonPosition: .top)
        case "ぶ":
            Arrow(x: 95, y: 40, degree: 30, number: 1, buttonPosition: .top)
            Arrow(x: 110, y: 120, degree: 40, number: 2, buttonPosition: .left)
            Arrow(x: 45, y: 140, degree: 80, number: 3, buttonPosition: .right)
            Arrow(x: 195, y: 135, degree: 50, number: 4, buttonPosition: .top)
            Arrow(x: 185, y: 55, degree: 40, number: 5, buttonPosition: .top)
            Arrow(x: 205, y: 35, degree: 40, number: 6, buttonPosition: .top)
        case "べ":
            Arrow(x: 30, y: 190, degree: -50, number: 1, buttonPosition: .left)
            Arrow(x: 160, y: 55, degree: 50, number: 2, buttonPosition: .top)
            Arrow(x: 185, y: 40, degree: 50, number: 3, buttonPosition: .top)
        case "ぼ":
            Arrow(x: 80, y: 35, degree: 95, number: 1, buttonPosition: .right)
            Arrow(x: 95, y: 85, degree: -5, number: 2, buttonPosition: .top)
            Arrow(x: 100, y: 135, degree: 0, number: 3, buttonPosition: .top)
            Arrow(x: 195, y: 40, degree: 90, number: 4, buttonPosition: .left)
            Arrow(x: 195, y: 25, degree: 40, number: 5, buttonPosition: .top)
            Arrow(x: 260, y: 25, degree: 40, number: 6, buttonPosition: .top)
        case "ぱ":
            Arrow(x: 80, y: 30, degree: 90, number: 1, buttonPosition: .right)
            Arrow(x: 95, y: 115, degree: 0, number: 2, buttonPosition: .top)
            Arrow(x: 195, y: 30, degree: 90, number: 3, buttonPosition: .left)
            CurveArrow(x: 235, y: 20, number: 4)
        case "ぴ":
            Arrow(x: 20, y: 95, degree: -10, number: 1, buttonPosition: .top)
            CurveArrow(x: 230, y: 20, number: 2)
        case "ぷ":
            Arrow(x: 95, y: 40, degree: 30, number: 1, buttonPosition: .top)
            Arrow(x: 110, y: 120, degree: 40, number: 2, buttonPosition: .left)
            Arrow(x: 45, y: 140, degree: 80, number: 3, buttonPosition: .right)
            Arrow(x: 195, y: 135, degree: 50, number: 4, buttonPosition: .top)
            CurveArrow(x: 220, y: 45, number: 5)
        case "ぺ":
            Arrow(x: 30, y: 190, degree: -50, number: 1, buttonPosition: .left)
            CurveArrow(x: 200, y: 50, number: 2)
        case "ぽ":
            Arrow(x: 80, y: 35, degree: 95, number: 1, buttonPosition: .right)
            Arrow(x: 95, y: 85, degree: -5, number: 2, buttonPosition: .top)
            Arrow(x: 100, y: 135, degree: 0, number: 3, buttonPosition: .top)
            Arrow(x: 195, y: 40, degree: 90, number: 4, buttonPosition: .left)
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
