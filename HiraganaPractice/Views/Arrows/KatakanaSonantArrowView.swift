//
//  KatakanaSonantArrowView.swift
//  HiraganaPractice
//
//  Created by 金子広樹 on 2023/07/12.
//

import SwiftUI

struct KatakanaSonantArrowView: View {
    let katakana: String
    
    var body: some View {
        switch katakana {
        case "ガ":
            Arrow(x: 30, y: 115, degree: 0, number: 1, buttonPosition: .top)
            Arrow(x: 160, y: 20, degree: 100, number: 2, buttonPosition: .right)
            Arrow(x: 190, y: 40, degree: 40, number: 3, buttonPosition: .top)
            Arrow(x: 210, y: 25, degree: 40, number: 4, buttonPosition: .top)
        case "ギ":
            Arrow(x: 30, y: 120, degree: -15, number: 1, buttonPosition: .top)
            Arrow(x: 30, y: 190, degree: -15, number: 2, buttonPosition: .top)
            Arrow(x: 120, y: 20, degree: 70, number: 3, buttonPosition: .left)
            Arrow(x: 190, y: 40, degree: 40, number: 4, buttonPosition: .top)
            Arrow(x: 210, y: 25, degree: 40, number: 5, buttonPosition: .top)
        case "グ":
            Arrow(x: 160, y: 30, degree: 120, number: 1, buttonPosition: .top)
            Arrow(x: 85, y: 80, degree: 0, number: 2, buttonPosition: .top)
            Arrow(x: 200, y: 30, degree: 40, number: 3, buttonPosition: .top)
            Arrow(x: 260, y: 25, degree: 40, number: 4, buttonPosition: .top)
        case "ゲ":
            Arrow(x: 130, y: 30, degree: 110, number: 1, buttonPosition: .top)
            Arrow(x: 50, y: 110, degree: 0, number: 2, buttonPosition: .top)
            Arrow(x: 185, y: 70, degree: 100, number: 3, buttonPosition: .top)
            Arrow(x: 190, y: 30, degree: 40, number: 4, buttonPosition: .top)
            Arrow(x: 260, y: 25, degree: 40, number: 5, buttonPosition: .top)
        case "ゴ":
            Arrow(x: 40, y: 105, degree: -5, number: 1, buttonPosition: .top)
            Arrow(x: 40, y: 215, degree: -5, number: 2, buttonPosition: .top)
            Arrow(x: 190, y: 40, degree: 40, number: 3, buttonPosition: .top)
            Arrow(x: 210, y: 25, degree: 40, number: 4, buttonPosition: .top)
        case "ザ":
            Arrow(x: 15, y: 130, degree: -5, number: 1, buttonPosition: .top)
            Arrow(x: 110, y: 30, degree: 90, number: 2, buttonPosition: .right)
            Arrow(x: 195, y: 20, degree: 90, number: 3, buttonPosition: .right)
            Arrow(x: 215, y: 70, degree: 50, number: 4, buttonPosition: .bottom)
            Arrow(x: 260, y: 25, degree: 40, number: 5, buttonPosition: .top)
        case "ジ":
            Arrow(x: 60, y: 50, degree: 30, number: 1, buttonPosition: .top)
            Arrow(x: 35, y: 110, degree: 30, number: 2, buttonPosition: .top)
            Arrow(x: 55, y: 250, degree: -30, number: 3, buttonPosition: .left)
            Arrow(x: 185, y: 30, degree: 40, number: 4, buttonPosition: .top)
            Arrow(x: 250, y: 25, degree: 40, number: 5, buttonPosition: .top)
        case "ズ":
            Arrow(x: 50, y: 90, degree: -5, number: 1, buttonPosition: .top)
            Arrow(x: 120, y: 140, degree: 30, number: 2, buttonPosition: .top)
            Arrow(x: 190, y: 40, degree: 40, number: 3, buttonPosition: .top)
            Arrow(x: 210, y: 25, degree: 40, number: 4, buttonPosition: .top)
        case "ゼ":
            Arrow(x: 20, y: 150, degree: -10, number: 1, buttonPosition: .top)
            Arrow(x: 120, y: 30, degree: 90, number: 2, buttonPosition: .right)
            Arrow(x: 195, y: 35, degree: 40, number: 3, buttonPosition: .top)
            Arrow(x: 260, y: 30, degree: 40, number: 4, buttonPosition: .top)
        case "ゾ":
            Arrow(x: 50, y: 50, degree: 50, number: 1, buttonPosition: .top)
            Arrow(x: 185, y: 90, degree: 110, number: 2, buttonPosition: .top)
            Arrow(x: 195, y: 30, degree: 40, number: 3, buttonPosition: .left)
            Arrow(x: 260, y: 25, degree: 40, number: 4, buttonPosition: .top)
        case "ダ":
            Arrow(x: 160, y: 30, degree: 120, number: 1, buttonPosition: .top)
            Arrow(x: 90, y: 80, degree: 0, number: 2, buttonPosition: .top)
            Arrow(x: 75, y: 95, degree: 40, number: 3, buttonPosition: .left)
            Arrow(x: 200, y: 30, degree: 40, number: 4, buttonPosition: .top)
            Arrow(x: 260, y: 25, degree: 40, number: 5, buttonPosition: .top)
        case "ヂ":
            Arrow(x: 190, y: 80, degree: 150, number: 1, buttonPosition: .bottom)
            Arrow(x: 20, y: 150, degree: 0, number: 2, buttonPosition: .top)
            Arrow(x: 150, y: 40, degree: 90, number: 3, buttonPosition: .left)
            Arrow(x: 200, y: 40, degree: 40, number: 4, buttonPosition: .top)
            Arrow(x: 220, y: 25, degree: 40, number: 5, buttonPosition: .top)
        case "ヅ":
            Arrow(x: 50, y: 50, degree: 60, number: 1, buttonPosition: .top)
            Arrow(x: 110, y: 35, degree: 60, number: 2, buttonPosition: .top)
            Arrow(x: 240, y: 120, degree: 110, number: 3, buttonPosition: .top)
            Arrow(x: 195, y: 30, degree: 40, number: 4, buttonPosition: .left)
            Arrow(x: 260, y: 25, degree: 40, number: 5, buttonPosition: .top)
        case "デ":
            Arrow(x: 50, y: 75, degree: -5, number: 1, buttonPosition: .top)
            Arrow(x: 20, y: 140, degree: -5, number: 2, buttonPosition: .top)
            Arrow(x: 155, y: 100, degree: 90, number: 3, buttonPosition: .left)
            Arrow(x: 200, y: 30, degree: 40, number: 4, buttonPosition: .top)
            Arrow(x: 260, y: 25, degree: 40, number: 5, buttonPosition: .top)
        case "ド":
            Arrow(x: 130, y: 20, degree: 90, number: 1, buttonPosition: .left)
            Arrow(x: 90, y: 110, degree: 30, number: 2, buttonPosition: .left)
            Arrow(x: 170, y: 55, degree: 40, number: 3, buttonPosition: .top)
            Arrow(x: 190, y: 40, degree: 40, number: 4, buttonPosition: .top)
        case "バ":
            Arrow(x: 125, y: 70, degree: 110, number: 1, buttonPosition: .top)
            Arrow(x: 165, y: 70, degree: 50, number: 2, buttonPosition: .top)
            Arrow(x: 185, y: 45, degree: 40, number: 3, buttonPosition: .top)
            Arrow(x: 210, y: 30, degree: 40, number: 4, buttonPosition: .top)
        case "ビ":
            Arrow(x: 180, y: 90, degree: 160, number: 1, buttonPosition: .top)
            Arrow(x: 95, y: 30, degree: 90, number: 2, buttonPosition: .left)
            Arrow(x: 185, y: 40, degree: 40, number: 3, buttonPosition: .top)
            Arrow(x: 210, y: 25, degree: 40, number: 4, buttonPosition: .top)
        case "ブ":
            Arrow(x: 30, y: 100, degree: -5, number: 1, buttonPosition: .top)
            Arrow(x: 195, y: 30, degree: 40, number: 2, buttonPosition: .left)
            Arrow(x: 260, y: 25, degree: 40, number: 3, buttonPosition: .top)
        case "ベ":
            Arrow(x: 30, y: 195, degree: -50, number: 1, buttonPosition: .left)
            Arrow(x: 155, y: 55, degree: 40, number: 2, buttonPosition: .top)
            Arrow(x: 185, y: 40, degree: 40, number: 3, buttonPosition: .top)
        case "ボ":
            Arrow(x: 30, y: 115, degree: -5, number: 1, buttonPosition: .top)
            Arrow(x: 150, y: 20, degree: 90, number: 2, buttonPosition: .left)
            Arrow(x: 70, y: 160, degree: 130, number: 3, buttonPosition: .top)
            Arrow(x: 230, y: 160, degree: 50, number: 4, buttonPosition: .top)
            Arrow(x: 190, y: 30, degree: 40, number: 5, buttonPosition: .left)
            Arrow(x: 260, y: 25, degree: 40, number: 6, buttonPosition: .top)
        case "パ":
            Arrow(x: 125, y: 70, degree: 110, number: 1, buttonPosition: .top)
            Arrow(x: 165, y: 70, degree: 50, number: 2, buttonPosition: .top)
            CurveArrow(x: 225, y: 30, number: 3)
        case "ピ":
            Arrow(x: 180, y: 90, degree: 160, number: 1, buttonPosition: .top)
            Arrow(x: 95, y: 30, degree: 90, number: 2, buttonPosition: .left)
            CurveArrow(x: 230, y: 30, number: 3)
        case "プ":
            Arrow(x: 30, y: 100, degree: -5, number: 1, buttonPosition: .top)
            CurveArrow(x: 235, y: 20, number: 2)
        case "ペ":
            Arrow(x: 30, y: 195, degree: -50, number: 1, buttonPosition: .left)
            CurveArrow(x: 200, y: 40, number: 2)
        case "ポ":
            Arrow(x: 30, y: 115, degree: -5, number: 1, buttonPosition: .top)
            Arrow(x: 150, y: 20, degree: 90, number: 2, buttonPosition: .left)
            Arrow(x: 70, y: 160, degree: 130, number: 3, buttonPosition: .top)
            Arrow(x: 230, y: 160, degree: 50, number: 4, buttonPosition: .top)
            CurveArrow(x: 230, y: 20, number: 5)
        default:
            Arrow(x: 0, y: 0, degree: 0, number: 0, buttonPosition: .top)
        }
    }
}

struct KatakanaSonantArrowView_Previews: PreviewProvider {
    static var previews: some View {
        KatakanaSonantArrowView(katakana: "ガ")
    }
}
