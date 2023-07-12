//
//  DrawPoints.swift
//  HiraganaPractice
//
//  Created by 金子広樹 on 2023/07/07.
//

import SwiftUI

struct DrawPoints: Identifiable {
    var id: UUID = UUID()
    var points: [CGPoint]
}

//enum NavigationDestination: Hashable {
//    case level(Level)
//    case hiragana(Hiragana)
//}

//enum Level: Int, CaseIterable {
//    case one
//    case two
//    case three
//}

//enum Hiragana: String, CaseIterable {
//    case level1
//    case level2
//    case level3
//}

//enum HiraganaLevel1: String, CaseIterable {
//    case a
//    case i
//    case u
//    case e
//    case o
//    case ka
//    case ki
//    case ku
//    case ke
//    case ko
//    case sa
//    case shi
//    case su
//    case se
//    case so
//    case ta
//    case chi
//    case tsu
//    case te
//    case to
//    case na
//    case ni
//    case nu
//    case ne
//    case no
//    case ha
//    case hi
//    case fu
//    case he
//    case ho
//    case ma
//    case mi
//    case mu
//    case me
//    case mo
//    case ya
//    case yu
//    case yo
//    case ra
//    case ri
//    case ru
//    case re
//    case ro
//    case wa
//    case wo
//    case nn
//}

enum SamplePath:Hashable{
    case first(First)
    case second(Second)
    case third(Third)
}

enum First:Int,CaseIterable {
    case one = 1
    case two
    case three
}

enum Second:Int,CaseIterable {
    case one = 1
    case two
    case three
}

enum Third:Int,CaseIterable {
    case one = 1
    case two
    case three
}

struct EnumNavigationStackView: View {
    
    @State private var path: [SamplePath] = [] //追加
    
    var body: some View {
        NavigationStack(path: $path) { //変更
            FirstListView()
                .navigationDestination(for: SamplePath.self) { samplePath in //変更
                    switch samplePath {
                    case let .first(first):
                        SecondListView()
                        Text("\(first.rawValue)")
                    case let .second(second):
                        ThirdListView()
                        Text("\(second.rawValue)")
                    case let .third(third):
                        Text( "\(third.rawValue)")
                    }
                }
            
            Button("Move"){ //追加
                path = [.first(.three) ,.second(.two) ,.third(.one)]
            }
        }
    }
}

struct FirstListView:View{
    var body: some View{
        List( First.allCases ,id: \.self){ first in
            NavigationLink( "\(first.rawValue)" ,value: SamplePath.first(first)) //変更
        }
        .navigationTitle("FirstListView")
    }
}

struct SecondListView:View{
    var body: some View{
        List( Second.allCases ,id: \.self){ second in
            NavigationLink( "\(second.rawValue)" ,value: SamplePath.second(second)) //変更
        }
        .navigationTitle("SecondListView")
    }
}

struct ThirdListView:View{
    var body: some View{
        List( Third.allCases ,id: \.self){ third in
            NavigationLink( "\(third.rawValue)" ,value: SamplePath.third(third)) //変更
        }
        .navigationTitle("ThirdListView")
    }
}
