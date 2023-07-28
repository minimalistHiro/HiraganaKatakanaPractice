//
//  KatakanaArrowView.swift
//  HiraganaPractice
//
//  Created by 金子広樹 on 2023/07/12.
//

import SwiftUI

struct KatakanaArrowView: View {
    let katakana: String
    
    var body: some View {
        switch katakana {
        case "ア":
            Arrow(x: 20, y: 95, degree: -5, number: 1, buttonPosition: .top)
            Arrow(x: 130, y: 110, degree: 90, number: 2, buttonPosition: .left)
        case "イ":
            Arrow(x: 230, y: 30, degree: 130, number: 1, buttonPosition: .top)
            Arrow(x: 155, y: 75, degree: 90, number: 2, buttonPosition: .top)
        case "ウ":
            Arrow(x: 150, y: 15, degree: 90, number: 1, buttonPosition: .right)
            Arrow(x: 70, y: 60, degree: 85, number: 2, buttonPosition: .right)
            Arrow(x: 110, y: 120, degree: -5, number: 3, buttonPosition: .bottom)
        case "エ":
            Arrow(x: 50, y: 105, degree: -5, number: 1, buttonPosition: .top)
            Arrow(x: 150, y: 60, degree: 90, number: 2, buttonPosition: .right)
            Arrow(x: 15, y: 205, degree: -5, number: 3, buttonPosition: .top)
        case "オ":
            Arrow(x: 30, y: 110, degree: 0, number: 1, buttonPosition: .top)
            Arrow(x: 175, y: 20, degree: 90, number: 2, buttonPosition: .right)
            Arrow(x: 210, y: 70, degree: 130, number: 3, buttonPosition: .right)
        case "カ":
            Arrow(x: 30, y: 115, degree: 0, number: 1, buttonPosition: .top)
            Arrow(x: 160, y: 20, degree: 100, number: 2, buttonPosition: .right)
        case "キ":
            Arrow(x: 30, y: 120, degree: -15, number: 1, buttonPosition: .top)
            Arrow(x: 30, y: 190, degree: -15, number: 2, buttonPosition: .top)
            Arrow(x: 120, y: 20, degree: 70, number: 3, buttonPosition: .left)
        case "ク":
            Arrow(x: 160, y: 30, degree: 120, number: 1, buttonPosition: .top)
            Arrow(x: 95, y: 80, degree: 0, number: 2, buttonPosition: .top)
        case "ケ":
            Arrow(x: 130, y: 30, degree: 110, number: 1, buttonPosition: .top)
            Arrow(x: 50, y: 110, degree: 0, number: 2, buttonPosition: .top)
            Arrow(x: 185, y: 70, degree: 100, number: 3, buttonPosition: .top)
        case "コ":
            Arrow(x: 40, y: 105, degree: -5, number: 1, buttonPosition: .top)
            Arrow(x: 40, y: 215, degree: -5, number: 2, buttonPosition: .top)
        case "サ":
            Arrow(x: 15, y: 130, degree: -5, number: 1, buttonPosition: .top)
            Arrow(x: 110, y: 30, degree: 90, number: 2, buttonPosition: .right)
            Arrow(x: 195, y: 20, degree: 90, number: 3, buttonPosition: .right)
        case "シ":
            Arrow(x: 60, y: 50, degree: 30, number: 1, buttonPosition: .top)
            Arrow(x: 35, y: 100, degree: 30, number: 2, buttonPosition: .top)
            Arrow(x: 50, y: 250, degree: -30, number: 3, buttonPosition: .left)
        case "ス":
            Arrow(x: 50, y: 90, degree: -5, number: 1, buttonPosition: .top)
            Arrow(x: 120, y: 140, degree: 30, number: 2, buttonPosition: .top)
        case "セ":
            Arrow(x: 20, y: 150, degree: -10, number: 1, buttonPosition: .top)
            Arrow(x: 120, y: 30, degree: 90, number: 2, buttonPosition: .right)
        case "ソ":
            Arrow(x: 50, y: 50, degree: 50, number: 1, buttonPosition: .top)
            Arrow(x: 235, y: 40, degree: 110, number: 2, buttonPosition: .top)
        case "タ":
            Arrow(x: 170, y: 30, degree: 120, number: 1, buttonPosition: .top)
            Arrow(x: 100, y: 80, degree: 0, number: 2, buttonPosition: .top)
            Arrow(x: 85, y: 95, degree: 40, number: 3, buttonPosition: .left)
        case "チ":
            Arrow(x: 220, y: 40, degree: 150, number: 1, buttonPosition: .top)
            Arrow(x: 20, y: 150, degree: 0, number: 2, buttonPosition: .top)
            Arrow(x: 150, y: 40, degree: 90, number: 3, buttonPosition: .left)
        case "ツ":
            Arrow(x: 50, y: 50, degree: 60, number: 1, buttonPosition: .top)
            Arrow(x: 110, y: 35, degree: 60, number: 2, buttonPosition: .top)
            Arrow(x: 240, y: 40, degree: 110, number: 3, buttonPosition: .top)
        case "テ":
            Arrow(x: 50, y: 75, degree: -5, number: 1, buttonPosition: .top)
            Arrow(x: 20, y: 140, degree: -5, number: 2, buttonPosition: .top)
            Arrow(x: 155, y: 100, degree: 90, number: 3, buttonPosition: .left)
        case "ト":
            Arrow(x: 130, y: 20, degree: 90, number: 1, buttonPosition: .left)
            Arrow(x: 90, y: 110, degree: 30, number: 2, buttonPosition: .left)
        case "ナ":
            Arrow(x: 20, y: 130, degree: -5, number: 1, buttonPosition: .top)
            Arrow(x: 150, y: 20, degree: 90, number: 2, buttonPosition: .left)
        case "ニ":
            Arrow(x: 50, y: 105, degree: -5, number: 1, buttonPosition: .top)
            Arrow(x: 15, y: 200, degree: -5, number: 2, buttonPosition: .top)
        case "ヌ":
            Arrow(x: 60, y: 75, degree: 0, number: 1, buttonPosition: .top)
            Arrow(x: 80, y: 110, degree: 30, number: 2, buttonPosition: .left)
        case "ネ":
            Arrow(x: 140, y: 30, degree: 30, number: 1, buttonPosition: .top)
            Arrow(x: 55, y: 100, degree: 0, number: 2, buttonPosition: .top)
            Arrow(x: 150, y: 115, degree: 90, number: 3, buttonPosition: .left)
            Arrow(x: 200, y: 150, degree: 30, number: 4, buttonPosition: .top)
        case "ノ":
            Arrow(x: 205, y: 30, degree: 110, number: 1, buttonPosition: .top)
        case "ハ":
            Arrow(x: 125, y: 70, degree: 110, number: 1, buttonPosition: .top)
            Arrow(x: 165, y: 70, degree: 50, number: 2, buttonPosition: .top)
        case "ヒ":
            Arrow(x: 250, y: 90, degree: 150, number: 1, buttonPosition: .top)
            Arrow(x: 95, y: 25, degree: 90, number: 2, buttonPosition: .left)
        case "フ":
            Arrow(x: 30, y: 90, degree: -5, number: 1, buttonPosition: .top)
        case "ヘ":
            Arrow(x: 30, y: 195, degree: -50, number: 1, buttonPosition: .left)
        case "ホ":
            Arrow(x: 30, y: 115, degree: -5, number: 1, buttonPosition: .top)
            Arrow(x: 150, y: 20, degree: 90, number: 2, buttonPosition: .left)
            Arrow(x: 70, y: 160, degree: 130, number: 3, buttonPosition: .top)
            Arrow(x: 230, y: 160, degree: 50, number: 4, buttonPosition: .top)
        case "マ":
            Arrow(x: 20, y: 110, degree: -5, number: 1, buttonPosition: .top)
            Arrow(x: 90, y: 135, degree: 40, number: 2, buttonPosition: .left)
        case "ミ":
            Arrow(x: 70, y: 55, degree: 20, number: 1, buttonPosition: .top)
            Arrow(x: 80, y: 115, degree: 20, number: 2, buttonPosition: .top)
            Arrow(x: 70, y: 180, degree: 20, number: 3, buttonPosition: .top)
        case "ム":
            Arrow(x: 170, y: 35, degree: 120, number: 1, buttonPosition: .right)
            Arrow(x: 210, y: 140, degree: 50, number: 2, buttonPosition: .top)
        case "メ":
            Arrow(x: 215, y: 35, degree: 120, number: 1, buttonPosition: .top)
            Arrow(x: 75, y: 100, degree: 30, number: 2, buttonPosition: .top)
        case "モ":
            Arrow(x: 45, y: 85, degree: -5, number: 1, buttonPosition: .top)
            Arrow(x: 20, y: 155, degree: -5, number: 2, buttonPosition: .top)
            Arrow(x: 135, y: 40, degree: 90, number: 3, buttonPosition: .left)
        case "ヤ":
            Arrow(x: 25, y: 140, degree: -10, number: 1, buttonPosition: .top)
            Arrow(x: 105, y: 25, degree: 70, number: 2, buttonPosition: .left)
        case "ユ":
            Arrow(x: 50, y: 110, degree: -5, number: 1, buttonPosition: .top)
            Arrow(x: 15, y: 205, degree: -5, number: 2, buttonPosition: .top)
        case "ヨ":
            Arrow(x: 45, y: 95, degree: -5, number: 1, buttonPosition: .top)
            Arrow(x: 60, y: 150, degree: -5, number: 2, buttonPosition: .top)
            Arrow(x: 45, y: 215, degree: -5, number: 3, buttonPosition: .top)
        case "ラ":
            Arrow(x: 55, y: 80, degree: -5, number: 1, buttonPosition: .top)
            Arrow(x: 30, y: 135, degree: -5, number: 2, buttonPosition: .top)
        case "リ":
            Arrow(x: 105, y: 30, degree: 90, number: 1, buttonPosition: .left)
            Arrow(x: 190, y: 20, degree: 90, number: 2, buttonPosition: .left)
        case "ル":
            Arrow(x: 105, y: 50, degree: 90, number: 1, buttonPosition: .left)
            Arrow(x: 155, y: 30, degree: 90, number: 2, buttonPosition: .left)
        case "レ":
            Arrow(x: 105, y: 30, degree: 90, number: 1, buttonPosition: .left)
        case "ロ":
            Arrow(x: 70, y: 55, degree: 80, number: 1, buttonPosition: .left)
            Arrow(x: 110, y: 75, degree: -5, number: 2, buttonPosition: .top)
            Arrow(x: 45, y: 205, degree: -5, number: 3, buttonPosition: .top)
        case "ワ":
            Arrow(x: 70, y: 40, degree: 80, number: 1, buttonPosition: .right)
            Arrow(x: 120, y: 65, degree: -5, number: 2, buttonPosition: .top)
        case "ヲ":
            Arrow(x: 40, y: 90, degree: -5, number: 1, buttonPosition: .top)
            Arrow(x: 40, y: 150, degree: -5, number: 2, buttonPosition: .top)
        case "ン":
            Arrow(x: 50, y: 60, degree: 40, number: 1, buttonPosition: .top)
            Arrow(x: 50, y: 240, degree: -25, number: 2, buttonPosition: .left)
        default:
            Arrow(x: 0, y: 0, degree: 0, number: 0, buttonPosition: .top)
        }
    }
}

struct KatakanaArrowView_Previews: PreviewProvider {
    static var previews: some View {
        KatakanaArrowView(katakana: "ア")
    }
}
