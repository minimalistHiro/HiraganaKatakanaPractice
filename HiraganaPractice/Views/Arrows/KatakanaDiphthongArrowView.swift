//
//  KatakanaDiphthongArrowView.swift
//  HiraganaPractice
//
//  Created by 金子広樹 on 2023/07/12.
//

import SwiftUI

struct KatakanaDiphthongArrowView: View {
    let katakana: String
    
    var body: some View {
        switch katakana {
        case "ァ":
            Arrow(x: 5, y: 190, degree: 0, number: 1, buttonPosition: .top)
            Arrow(x: 55, y: 200, degree: 90, number: 2, buttonPosition: .left)
        case "ィ":
            Arrow(x: 120, y: 160, degree: 130, number: 1, buttonPosition: .top)
            Arrow(x: 75, y: 170, degree: 90, number: 2, buttonPosition: .top)
        case "ェ":
            Arrow(x: 10, y: 200, degree: 0, number: 1, buttonPosition: .top)
            Arrow(x: 75, y: 170, degree: 90, number: 2, buttonPosition: .right)
            Arrow(x: 5, y: 255, degree: 0, number: 3, buttonPosition: .top)
        case "ォ":
            Arrow(x: 10, y: 205, degree: 0, number: 1, buttonPosition: .top)
            Arrow(x: 90, y: 150, degree: 90, number: 2, buttonPosition: .right)
            Arrow(x: 120, y: 170, degree: 130, number: 3, buttonPosition: .right)
        case "ャ":
            Arrow(x: 5, y: 220, degree: -10, number: 1, buttonPosition: .top)
            Arrow(x: 50, y: 150, degree: 70, number: 2, buttonPosition: .left)
        case "ュ":
            Arrow(x: 15, y: 200, degree: 0, number: 1, buttonPosition: .top)
            Arrow(x: 5, y: 250, degree: 0, number: 2, buttonPosition: .top)
        case "ョ":
            Arrow(x: 10, y: 190, degree: 0, number: 1, buttonPosition: .top)
            Arrow(x: 15, y: 220, degree: 0, number: 2, buttonPosition: .top)
            Arrow(x: 10, y: 255, degree: 0, number: 3, buttonPosition: .top)
        case "キ":
            Arrow(x: 30, y: 130, degree: -20, number: 1, buttonPosition: .top)
            Arrow(x: 30, y: 190, degree: -20, number: 2, buttonPosition: .top)
            Arrow(x: 115, y: 20, degree: 70, number: 3, buttonPosition: .left)
        case "シ":
            Arrow(x: 70, y: 40, degree: 40, number: 1, buttonPosition: .top)
            Arrow(x: 30, y: 90, degree: 40, number: 2, buttonPosition: .top)
            Arrow(x: 50, y: 250, degree: -40, number: 3, buttonPosition: .left)
        case "チ":
            Arrow(x: 240, y: 40, degree: 150, number: 1, buttonPosition: .top)
            Arrow(x: 20, y: 140, degree: 0, number: 2, buttonPosition: .top)
            Arrow(x: 150, y: 40, degree: 90, number: 3, buttonPosition: .left)
        case "ニ":
            Arrow(x: 50, y: 100, degree: 0, number: 1, buttonPosition: .top)
            Arrow(x: 15, y: 200, degree: 0, number: 2, buttonPosition: .top)
        case "ヒ":
            Arrow(x: 250, y: 80, degree: 150, number: 1, buttonPosition: .top)
            Arrow(x: 90, y: 30, degree: 90, number: 2, buttonPosition: .left)
        case "フ":
            Arrow(x: 30, y: 90, degree: 0, number: 1, buttonPosition: .top)
        case "ミ":
            Arrow(x: 60, y: 60, degree: 20, number: 1, buttonPosition: .top)
            Arrow(x: 60, y: 110, degree: 20, number: 2, buttonPosition: .top)
            Arrow(x: 50, y: 170, degree: 20, number: 3, buttonPosition: .top)
        case "リ":
            Arrow(x: 100, y: 30, degree: 90, number: 1, buttonPosition: .left)
            Arrow(x: 190, y: 20, degree: 90, number: 2, buttonPosition: .left)
        default:
            Arrow(x: 0, y: 0, degree: 0, number: 0, buttonPosition: .top)
        }
    }
}

struct KatakanaDiphthongArrowView_Previews: PreviewProvider {
    static var previews: some View {
        KatakanaDiphthongArrowView(katakana: "キ")
    }
}
