//
//  CurveArrow.swift
//  HiraganaPractice
//
//  Created by 金子広樹 on 2023/07/12.
//

import SwiftUI

struct CurveArrow: View {
    let setting = Setting()
    let x: Double
    let y: Double
    let number: Int
    var magnification: Double {
        return CanvasView.canvasGetSize / setting.canvasMaxSize
    }               // 倍率
    
    var body: some View {
        
        Text("\(number)")
            .position(x: magnification * (x + 30), y: magnification * (y + 5))
            .foregroundColor(number == 1 ? .red : .black)
        
        Path { path in
            path.move(to: CGPoint(x: magnification * x, y: magnification * y))
            path.addQuadCurve(to: CGPoint(x: magnification * (x + 20), y: magnification * y), control: CGPoint(x: magnification * (x + 10), y: magnification * (y - 10)))
            path.addLine(to: CGPoint(x: magnification * (x + 18), y: magnification * (y - 8)))
            path.move(to: CGPoint(x: magnification * (x + 20), y: magnification * y))
            path.addLine(to: CGPoint(x: magnification * (x + 13), y: magnification * (y + 2)))
        }
        .stroke(lineWidth: 2)
        .foregroundColor(number == 1 ? .red : .black)
    }
}

struct CurveArrow_Previews: PreviewProvider {
    static var previews: some View {
        CurveArrow(x: 100, y: 100, number: 1)
    }
}
