//
//  CurveArrow.swift
//  HiraganaPractice
//
//  Created by 金子広樹 on 2023/07/12.
//

import SwiftUI

struct CurveArrow: View {
    let x: Double
    let y: Double
    let number: Int
    
    var body: some View {
        
        Text("\(number)")
            .position(x: x + 30, y: y + 5)
            .foregroundColor(number == 1 ? .red : .black)
        
        Path { path in
            path.move(to: CGPoint(x: x, y: y))
            path.addQuadCurve(to: CGPoint(x: x + 20, y: y), control: CGPoint(x: x + 10, y: y - 10))
            path.addLine(to: CGPoint(x: x + 18, y: y - 8))
            path.move(to: CGPoint(x: x + 20, y: y))
            path.addLine(to: CGPoint(x: x + 13, y: y + 2))
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
