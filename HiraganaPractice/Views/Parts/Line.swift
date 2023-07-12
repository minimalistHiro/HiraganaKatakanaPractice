//
//  DottedLine.swift
//  HiraganaPractice
//
//  Created by 金子広樹 on 2023/07/08.
//

import SwiftUI

struct WidthLine: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        return path
    }
}

struct WidthLine_Previews: PreviewProvider {
    static var previews: some View {
        WidthLine()
    }
}

struct HeightLine: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: 0, y: rect.height))
        return path
    }
}

struct HeightLine_Previews: PreviewProvider {
    static var previews: some View {
        HeightLine()
    }
}
