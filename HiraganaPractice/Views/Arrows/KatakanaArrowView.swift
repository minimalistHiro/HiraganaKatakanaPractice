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
            Arrow(x: 20, y: 70, degree: 0, number: 1, buttonPosition: .top)
            Arrow(x: 140, y: 85, degree: 90, number: 2, buttonPosition: .left)
        case "イ":
            Arrow(x: 240, y: 30, degree: 130, number: 1, buttonPosition: .top)
            Arrow(x: 165, y: 75, degree: 90, number: 2, buttonPosition: .top)
        case "ウ":
            Arrow(x: 140, y: 15, degree: 90, number: 1, buttonPosition: .right)
            Arrow(x: 80, y: 60, degree: 90, number: 2, buttonPosition: .right)
            Arrow(x: 110, y: 110, degree: 0, number: 3, buttonPosition: .bottom)
        case "エ":
            Arrow(x: 30, y: 95, degree: 0, number: 1, buttonPosition: .top)
            Arrow(x: 150, y: 50, degree: 90, number: 2, buttonPosition: .right)
            Arrow(x: 15, y: 200, degree: 0, number: 3, buttonPosition: .top)
        case "オ":
            Arrow(x: 30, y: 110, degree: 0, number: 1, buttonPosition: .top)
            Arrow(x: 180, y: 20, degree: 90, number: 2, buttonPosition: .right)
            Arrow(x: 210, y: 70, degree: 130, number: 3, buttonPosition: .right)
        case "カ":
            Arrow(x: 30, y: 110, degree: 0, number: 1, buttonPosition: .top)
            Arrow(x: 160, y: 20, degree: 100, number: 2, buttonPosition: .right)
        case "キ":
            Arrow(x: 30, y: 130, degree: -20, number: 1, buttonPosition: .top)
            Arrow(x: 30, y: 190, degree: -20, number: 2, buttonPosition: .top)
            Arrow(x: 115, y: 20, degree: 70, number: 3, buttonPosition: .left)
        case "ク":
            Arrow(x: 170, y: 30, degree: 120, number: 1, buttonPosition: .top)
            Arrow(x: 100, y: 90, degree: 0, number: 2, buttonPosition: .top)
        case "ケ":
            Arrow(x: 140, y: 30, degree: 120, number: 1, buttonPosition: .top)
            Arrow(x: 60, y: 110, degree: 0, number: 2, buttonPosition: .top)
            Arrow(x: 180, y: 70, degree: 100, number: 3, buttonPosition: .top)
        case "コ":
            Arrow(x: 40, y: 90, degree: 0, number: 1, buttonPosition: .top)
            Arrow(x: 40, y: 210, degree: 0, number: 2, buttonPosition: .top)
        case "サ":
            Arrow(x: 15, y: 120, degree: 0, number: 1, buttonPosition: .top)
            Arrow(x: 105, y: 30, degree: 90, number: 2, buttonPosition: .right)
            Arrow(x: 180, y: 20, degree: 90, number: 3, buttonPosition: .right)
        case "シ":
            Arrow(x: 70, y: 40, degree: 40, number: 1, buttonPosition: .top)
            Arrow(x: 30, y: 90, degree: 40, number: 2, buttonPosition: .top)
            Arrow(x: 50, y: 250, degree: -40, number: 3, buttonPosition: .left)
        case "ス":
            Arrow(x: 50, y: 90, degree: 0, number: 1, buttonPosition: .top)
            Arrow(x: 120, y: 140, degree: 30, number: 2, buttonPosition: .top)
        case "セ":
            Arrow(x: 20, y: 140, degree: -10, number: 1, buttonPosition: .top)
            Arrow(x: 120, y: 30, degree: 90, number: 2, buttonPosition: .right)
        case "ソ":
            Arrow(x: 40, y: 50, degree: 40, number: 1, buttonPosition: .top)
            Arrow(x: 240, y: 40, degree: 120, number: 2, buttonPosition: .top)
        case "タ":
            Arrow(x: 170, y: 30, degree: 120, number: 1, buttonPosition: .top)
            Arrow(x: 100, y: 90, degree: 0, number: 2, buttonPosition: .top)
            Arrow(x: 90, y: 100, degree: 40, number: 3, buttonPosition: .left)
        case "チ":
            Arrow(x: 240, y: 40, degree: 150, number: 1, buttonPosition: .top)
            Arrow(x: 20, y: 140, degree: 0, number: 2, buttonPosition: .top)
            Arrow(x: 150, y: 40, degree: 90, number: 3, buttonPosition: .left)
        case "ツ":
            Arrow(x: 40, y: 50, degree: 50, number: 1, buttonPosition: .top)
            Arrow(x: 100, y: 40, degree: 50, number: 2, buttonPosition: .top)
            Arrow(x: 250, y: 40, degree: 120, number: 3, buttonPosition: .top)
        case "テ":
            Arrow(x: 50, y: 70, degree: 0, number: 1, buttonPosition: .top)
            Arrow(x: 20, y: 140, degree: 0, number: 2, buttonPosition: .top)
            Arrow(x: 150, y: 100, degree: 90, number: 3, buttonPosition: .left)
        case "ト":
            Arrow(x: 120, y: 20, degree: 90, number: 1, buttonPosition: .left)
            Arrow(x: 90, y: 110, degree: 30, number: 2, buttonPosition: .left)
        case "ナ":
            Arrow(x: 20, y: 120, degree: 0, number: 1, buttonPosition: .top)
            Arrow(x: 150, y: 20, degree: 90, number: 2, buttonPosition: .left)
        case "ニ":
            Arrow(x: 50, y: 100, degree: 0, number: 1, buttonPosition: .top)
            Arrow(x: 15, y: 200, degree: 0, number: 2, buttonPosition: .top)
        case "ヌ":
            Arrow(x: 50, y: 90, degree: 0, number: 1, buttonPosition: .top)
            Arrow(x: 70, y: 120, degree: 30, number: 2, buttonPosition: .left)
        case "ネ":
            Arrow(x: 140, y: 30, degree: 30, number: 1, buttonPosition: .top)
            Arrow(x: 60, y: 100, degree: 0, number: 2, buttonPosition: .top)
            Arrow(x: 155, y: 110, degree: 90, number: 3, buttonPosition: .left)
            Arrow(x: 200, y: 140, degree: 30, number: 4, buttonPosition: .top)
        case "ノ":
            Arrow(x: 220, y: 40, degree: 120, number: 1, buttonPosition: .top)
        case "ハ":
            Arrow(x: 135, y: 60, degree: 110, number: 1, buttonPosition: .top)
            Arrow(x: 155, y: 65, degree: 50, number: 2, buttonPosition: .top)
        case "ヒ":
            Arrow(x: 250, y: 80, degree: 150, number: 1, buttonPosition: .top)
            Arrow(x: 90, y: 30, degree: 90, number: 2, buttonPosition: .left)
        case "フ":
            Arrow(x: 30, y: 90, degree: 0, number: 1, buttonPosition: .top)
        case "ヘ":
            Arrow(x: 30, y: 210, degree: -50, number: 1, buttonPosition: .left)
        case "ホ":
            Arrow(x: 20, y: 110, degree: 0, number: 1, buttonPosition: .top)
            Arrow(x: 150, y: 20, degree: 90, number: 2, buttonPosition: .left)
            Arrow(x: 70, y: 160, degree: 130, number: 3, buttonPosition: .top)
            Arrow(x: 230, y: 160, degree: 50, number: 4, buttonPosition: .top)
        case "マ":
            Arrow(x: 20, y: 90, degree: 0, number: 1, buttonPosition: .top)
            Arrow(x: 70, y: 130, degree: 40, number: 2, buttonPosition: .left)
        case "ミ":
            Arrow(x: 60, y: 60, degree: 20, number: 1, buttonPosition: .top)
            Arrow(x: 60, y: 110, degree: 20, number: 2, buttonPosition: .top)
            Arrow(x: 50, y: 170, degree: 20, number: 3, buttonPosition: .top)
        case "ム":
            Arrow(x: 160, y: 30, degree: 120, number: 1, buttonPosition: .right)
            Arrow(x: 210, y: 140, degree: 50, number: 2, buttonPosition: .top)
        case "メ":
            Arrow(x: 220, y: 40, degree: 120, number: 1, buttonPosition: .top)
            Arrow(x: 70, y: 100, degree: 30, number: 2, buttonPosition: .top)
        case "モ":
            Arrow(x: 40, y: 80, degree: 0, number: 1, buttonPosition: .top)
            Arrow(x: 20, y: 150, degree: 0, number: 2, buttonPosition: .top)
            Arrow(x: 130, y: 50, degree: 90, number: 3, buttonPosition: .left)
        case "ヤ":
            Arrow(x: 20, y: 140, degree: -10, number: 1, buttonPosition: .top)
            Arrow(x: 110, y: 20, degree: 70, number: 2, buttonPosition: .left)
        case "ユ":
            Arrow(x: 40, y: 100, degree: 0, number: 1, buttonPosition: .top)
            Arrow(x: 15, y: 200, degree: 0, number: 2, buttonPosition: .top)
        case "ヨ":
            Arrow(x: 40, y: 90, degree: 0, number: 1, buttonPosition: .top)
            Arrow(x: 60, y: 150, degree: 0, number: 2, buttonPosition: .top)
            Arrow(x: 40, y: 220, degree: 0, number: 3, buttonPosition: .top)
        case "ラ":
            Arrow(x: 50, y: 70, degree: 0, number: 1, buttonPosition: .top)
            Arrow(x: 40, y: 130, degree: 0, number: 2, buttonPosition: .top)
        case "リ":
            Arrow(x: 100, y: 30, degree: 90, number: 1, buttonPosition: .left)
            Arrow(x: 190, y: 20, degree: 90, number: 2, buttonPosition: .left)
        case "ル":
            Arrow(x: 110, y: 40, degree: 90, number: 1, buttonPosition: .left)
            Arrow(x: 160, y: 20, degree: 90, number: 2, buttonPosition: .left)
        case "レ":
            Arrow(x: 90, y: 20, degree: 90, number: 1, buttonPosition: .left)
        case "ロ":
            Arrow(x: 80, y: 50, degree: 90, number: 1, buttonPosition: .left)
            Arrow(x: 110, y: 70, degree: 0, number: 2, buttonPosition: .top)
            Arrow(x: 40, y: 210, degree: 0, number: 3, buttonPosition: .top)
        case "ワ":
            Arrow(x: 80, y: 30, degree: 90, number: 1, buttonPosition: .right)
            Arrow(x: 120, y: 60, degree: 0, number: 2, buttonPosition: .top)
        case "ヲ":
            Arrow(x: 40, y: 80, degree: 0, number: 1, buttonPosition: .top)
            Arrow(x: 40, y: 140, degree: 0, number: 2, buttonPosition: .top)
        case "ン":
            Arrow(x: 40, y: 50, degree: 40, number: 1, buttonPosition: .top)
            Arrow(x: 50, y: 250, degree: -40, number: 2, buttonPosition: .left)
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
