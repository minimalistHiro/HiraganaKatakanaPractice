//
//  FontExtension.swift
//  HiraganaPractice
//
//  Created by 金子広樹 on 2023/07/08.
//

import SwiftUI

extension Font {
    static func mincho(ofSize size: CGFloat) -> Font? {
        return Font.custom("BIZUDPMincho-Regular", size: size)
    }
}
