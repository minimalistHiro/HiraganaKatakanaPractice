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
        case "キ":
            Arrow(x: 30, y: 120, degree: -15, number: 1, buttonPosition: .top)
            Arrow(x: 30, y: 190, degree: -15, number: 2, buttonPosition: .top)
            Arrow(x: 120, y: 20, degree: 70, number: 3, buttonPosition: .left)
        case "シ":
            Arrow(x: 60, y: 50, degree: 30, number: 1, buttonPosition: .top)
            Arrow(x: 35, y: 100, degree: 30, number: 2, buttonPosition: .top)
            Arrow(x: 50, y: 250, degree: -30, number: 3, buttonPosition: .left)
        case "チ":
            Arrow(x: 220, y: 40, degree: 150, number: 1, buttonPosition: .top)
            Arrow(x: 20, y: 150, degree: 0, number: 2, buttonPosition: .top)
            Arrow(x: 150, y: 40, degree: 90, number: 3, buttonPosition: .left)
        case "ニ":
            Arrow(x: 50, y: 105, degree: -5, number: 1, buttonPosition: .top)
            Arrow(x: 15, y: 200, degree: -5, number: 2, buttonPosition: .top)
        case "ヒ":
            Arrow(x: 250, y: 90, degree: 150, number: 1, buttonPosition: .top)
            Arrow(x: 95, y: 25, degree: 90, number: 2, buttonPosition: .left)
        case "ミ":
            Arrow(x: 70, y: 55, degree: 20, number: 1, buttonPosition: .top)
            Arrow(x: 80, y: 115, degree: 20, number: 2, buttonPosition: .top)
            Arrow(x: 70, y: 180, degree: 20, number: 3, buttonPosition: .top)
        case "リ":
            Arrow(x: 105, y: 30, degree: 90, number: 1, buttonPosition: .left)
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
