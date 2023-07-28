//
//  KatakanaDiphthongSonantArrowView.swift
//  HiraganaPractice
//
//  Created by 金子広樹 on 2023/07/12.
//

import SwiftUI

struct KatakanaDiphthongSonantArrowView: View {
    let katakana: String
    
    var body: some View {
        switch katakana {
        case "ャ":
            Arrow(x: 10, y: 235, degree: -10, number: 1, buttonPosition: .top)
            Arrow(x: 50, y: 175, degree: 70, number: 2, buttonPosition: .left)
        case "ュ":
            Arrow(x: 20, y: 220, degree: -5, number: 1, buttonPosition: .top)
            Arrow(x: 5, y: 260, degree: -5, number: 2, buttonPosition: .top)
        case "ョ":
            Arrow(x: 20, y: 220, degree: -5, number: 1, buttonPosition: .top)
            Arrow(x: 20, y: 240, degree: -5, number: 2, buttonPosition: .top)
            Arrow(x: 15, y: 265, degree: -5, number: 3, buttonPosition: .top)
        case "ギ":
            Arrow(x: 30, y: 120, degree: -15, number: 1, buttonPosition: .top)
            Arrow(x: 30, y: 190, degree: -15, number: 2, buttonPosition: .top)
            Arrow(x: 120, y: 20, degree: 70, number: 3, buttonPosition: .left)
            Arrow(x: 190, y: 40, degree: 40, number: 4, buttonPosition: .top)
            Arrow(x: 210, y: 25, degree: 40, number: 5, buttonPosition: .top)
        case "ジ":
            Arrow(x: 60, y: 50, degree: 30, number: 1, buttonPosition: .top)
            Arrow(x: 35, y: 110, degree: 30, number: 2, buttonPosition: .top)
            Arrow(x: 55, y: 250, degree: -30, number: 3, buttonPosition: .left)
            Arrow(x: 185, y: 30, degree: 40, number: 4, buttonPosition: .top)
            Arrow(x: 250, y: 25, degree: 40, number: 5, buttonPosition: .top)
        case "ヂ":
            Arrow(x: 190, y: 80, degree: 150, number: 1, buttonPosition: .bottom)
            Arrow(x: 20, y: 150, degree: 0, number: 2, buttonPosition: .top)
            Arrow(x: 150, y: 40, degree: 90, number: 3, buttonPosition: .left)
            Arrow(x: 200, y: 40, degree: 40, number: 4, buttonPosition: .top)
            Arrow(x: 220, y: 25, degree: 40, number: 5, buttonPosition: .top)
        case "ビ":
            Arrow(x: 180, y: 90, degree: 160, number: 1, buttonPosition: .top)
            Arrow(x: 95, y: 30, degree: 90, number: 2, buttonPosition: .left)
            Arrow(x: 185, y: 40, degree: 40, number: 3, buttonPosition: .top)
            Arrow(x: 210, y: 25, degree: 40, number: 4, buttonPosition: .top)
        case "ピ":
            Arrow(x: 180, y: 90, degree: 160, number: 1, buttonPosition: .top)
            Arrow(x: 95, y: 30, degree: 90, number: 2, buttonPosition: .left)
            CurveArrow(x: 230, y: 30, number: 3)
        default:
            Arrow(x: 0, y: 0, degree: 0, number: 0, buttonPosition: .top)
        }
    }
}

struct KatakanaDiphthongSonantArrowView_Previews: PreviewProvider {
    static var previews: some View {
        KatakanaDiphthongSonantArrowView(katakana: "ギ")
    }
}
