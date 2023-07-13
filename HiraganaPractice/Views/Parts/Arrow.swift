//
//  Arrow.swift
//  HiraganaPractice
//
//  Created by 金子広樹 on 2023/07/10.
//

import SwiftUI

struct Arrow: View {
    let setting = Setting()
    let x: Double
    let y: Double
    let degree: Double
    let number: Int
    let buttonPosition: ButtonPosition
    
    var magnification: Double {
        return CanvasView.canvasGetSize / setting.canvasMaxSize
    }               // 倍率
    
    enum ButtonPosition {
        case top
        case right
        case left
        case bottom
    }
    
    var body: some View {
        // 数字を置く位置を"上"、"右"、"左"に分ける。
        switch buttonPosition {
        case .top:
            Text("\(number)")
                .position(x: magnification * x, y: magnification * (y - 15))
                .foregroundColor(number == 1 ? .red : .black)
        case .right:
            Text("\(number)")
                .position(x: magnification * (x + 15), y: magnification * (y + 5))
                .foregroundColor(number == 1 ? .red : .black)
        case .left:
            Text("\(number)")
                .position(x: magnification * (x - 15), y: magnification * (y + 5))
                .foregroundColor(number == 1 ? .red : .black)
        case .bottom:
            Text("\(number)")
                .position(x: magnification * x, y: magnification * (y + 20))
                .foregroundColor(number == 1 ? .red : .black)
        }
        
        Path { path in
            path.move(to: CGPoint(x: magnification * x, y: magnification * y))
            path.addLine(to: CGPoint(x: magnification * (x + 20), y: magnification * y))
            path.addLine(to: CGPoint(x: magnification * (x + 15), y: magnification * (y - 5)))
            path.move(to: CGPoint(x: magnification * (x + 20), y: magnification * y))
            path.addLine(to: CGPoint(x: magnification * (x + 15), y: magnification * (y + 5)))
        }
        .stroke(lineWidth: 2)
        .rotationEffect(Angle(degrees: degree), anchor: UnitPoint(x: (0.5 * magnification * x) / (CanvasView.canvasGetSize / 2), y: (0.5 * magnification * y) / (CanvasView.canvasGetSize / 2)))
        .foregroundColor(number == 1 ? .red : .black)
//        .onAppear {
//            print("Arrow\(CanvasView.canvasGetSize)")
//        }
    }
}

struct Arrow_Previews: PreviewProvider {
    static var previews: some View {
        Arrow(x: 50, y: 50, degree: 30, number: 1, buttonPosition: .top)
    }
}
