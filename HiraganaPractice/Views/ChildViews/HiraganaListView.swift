//
//  HiraganaListView.swift
//  HiraganaPractice
//
//  Created by 金子広樹 on 2023/07/08.
//

import SwiftUI

struct HiraganaListView: View {
    @Environment(\.managedObjectContext) var viewContext
    @FetchRequest(sortDescriptors: [])
    var data: FetchedResults<Entity>
    
    let setting = Setting()
    let sounds = Sounds()
    @Binding var navigationPath: NavigationPath
    @Binding var selectedLevel: Int
    @Binding var isDoubleText: Bool
    @State private var clearedText: [String] = []           // クリアしたテキスト
    @State private var clearedTextCount: Int = 0            // クリアしたテキスト数
    @State private var isShowYellowModeAlert: Bool = false  // イエローモードアラートの表示有無
    @State private var isShowAllClearAlert: Bool = false    // 全クリアアラートの表示有無
    @State private var isYellowMode: Bool = false           // イエローモードの発動有無。テキストの半分以上クリア = true、半分以下 = false。
    var list: [String] {
        switch selectedLevel {
        case 1:
            return setting.hiraganaReverseList
        case 2:
            return setting.hiraganaSonantReverseList
        case 3:
            return setting.hiraganaDiphthongReverseList
        case 4:
            return setting.hiraganaDiphthongSonantReverseList
        case 5:
            return setting.katakanaReverseList
        case 6:
            return setting.katakanaSonantReverseList
        case 7:
            return setting.katakanaDiphthongReverseList
        case 8:
            return setting.katakanaDiphthongSonantReverseList
        default:
            return setting.hiraganaReverseList
        }
    }                   // 選択されたレベルによって、表示するテキスト一覧を変える
    
    var body: some View {
        ZStack {
            // 背景色。ひらがなモードとカタカナモードで色を分ける。
            if selectedLevel <= 4 {
                setting.hiraganaBackgroundColor
                    .ignoresSafeArea()
            } else {
                setting.katakanaBackgroundColor
                    .ignoresSafeArea()
            }
            
            LazyHGrid(rows: Array(repeating: GridItem(), count: 5)) {
                ForEach(list, id: \.self) { text in
                    NavigationLink(value: text) {
                        if !text.contains("空白") {
                            Rectangle()
                                .stroke(lineWidth: 3)
                                .frame(width: 50, height: 50)
                                .overlay {
                                    FontView(text: text)
//                                    Text(text)
//                                        .font(.mincho(ofSize: isDoubleText ? 25 : 40))
                                }
                                .overlay {
                                    if clearedText.contains(text) {
                                        HanamaruView()
                                    }
                                }
                                .background(clearedText.contains(text) ? setting.clearedTextBackgroundColor : (isYellowMode ? setting.yellowModeBackgroundColor : Color(.white)))
                        }
                    }
                    .foregroundColor(.black)
                }
            }
        }
        .onAppear {
            clearedTextCount = 0
            countClearedText()
        }
        .alert("", isPresented: $isShowYellowModeAlert) {
            Button("OK") {
                isYellowMode = true
                isShowYellowModeAlert = false
            }
        } message: {
            Text("I'm finally halfway through. Practice the remaining yellow letters!")
        }
        .alert("", isPresented: $isShowAllClearAlert) {
            Button("OK") {
                isShowAllClearAlert = false
            }
        } message: {
            Text("Congratulation! You've cleared everything. Go to the next level when you are ready.")
        }
        // 戻るボタンを独自実装
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    navigationPath.removeLast()
                } label: {
                    Image(systemName: "arrow.backward")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .bold()
                }
                .padding()
            }
        }
    }
    
    /// クリアしたテキストの数を数える。また、クリアしたテキストがリストの数と一致（全てクリアした）場合、Modelにクリアしたレベルを保存する。
    /// - Parameters: なし
    /// - Returns: なし
    private func countClearedText() {
        var isHalfCleared: Bool = false                 // 半分クリアしたか否か
        var isCleared: Bool = false                     // 全てクリアしたか否か
        clearedText.removeAll()
        for data in data {
            if let text = data.clearedText {
                // モデルに保存済みのテキストが選択したレベルのテキストに含まれていた場合、カウントを1加える。
                if list.contains(text) {
                    clearedText.append(text)
                    clearedTextCount += 1
//                    print("クリア:\(clearedTextCount)")
                }
            } else if data.halfClearedLevel == selectedLevel {
                isYellowMode = true
                isHalfCleared = true
            } else if data.clearedLevel == selectedLevel {
                isHalfCleared = true
                isCleared = true
            }
        }
        
        var blankRemovedList = list
        blankRemovedList.removeAll(where: {$0.contains("空白")})
//        print("全テキスト:\(blankRemovedList.count)")
        
        if blankRemovedList.count <= clearedTextCount && !isCleared {
            // クリアしたテキスト数と、元のテキスト数が同じ（全てクリアした）且つそれが初回の場合、Modelにクリアしたレベルを保存する。
            addClearedLebel()
            isShowAllClearAlert = true
            sounds.fileName = setting.yellowModeAlertSound
            sounds.playSound()
        } else if ((blankRemovedList.count / 2) <= clearedTextCount) && !isHalfCleared {
            // クリアしたテキスト数が、元のテキスト数の半分以上（半分クリアした）場合、イエローモード発動。
            addHalfClearedLebel()
            isShowYellowModeAlert = true
            sounds.fileName = setting.yellowModeAlertSound
            sounds.playSound()
        }
    }
    
    /// Modelにクリアしたレベルを保存する。
    /// - Parameters: なし
    /// - Returns: なし
    private func addClearedLebel() {
        let newLevel = Entity(context: viewContext)
        newLevel.clearedLevel = Int16(selectedLevel)
        do {
            try viewContext.save()
        } catch {
            fatalError("セーブに失敗")
        }
    }
    
    /// Modelに半分クリアしたレベルを保存する。
    /// - Parameters: なし
    /// - Returns: なし
    private func addHalfClearedLebel() {
        let newLevel = Entity(context: viewContext)
        newLevel.halfClearedLevel = Int16(selectedLevel)
        do {
            try viewContext.save()
        } catch {
            fatalError("セーブに失敗")
        }
    }
}

struct HiraganaListView_Previews: PreviewProvider {
    static var previews: some View {
        HiraganaListView(navigationPath: .constant(NavigationPath()), selectedLevel: .constant(1), isDoubleText: .constant(false))
    }
}
