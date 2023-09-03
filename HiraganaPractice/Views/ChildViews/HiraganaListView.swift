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
    @Binding var isShowHanamaruGuidance: Bool
    @Binding var isShowFirstHanamaru: Bool
    @State private var clearedText: [String] = []           // クリアしたテキスト
    @State private var halfClearedText: [String] = []       // ハーフクリアしたテキスト
    @State private var clearedTextCount: Int = 0            // クリアしたテキスト数
    @State private var halfClearedTextCount: Int = 0        // ハーフクリアしたテキスト数
    @State private var isShowYellowModeAlert: Bool = false  // イエローモードアラートの表示有無
    @State private var isShowClearAlert: Bool = false       // 全ハーフクリアアラートの表示有無
    @State private var isShowPerfectClearAlert: Bool = false// パーフェクトクリアアラートの表示有無
    @State private var isShowHanamaruGuidanceAlert: Bool = false // はなまる紹介アラートの表示有無
    @State private var isShowFirstHanamaruAlert: Bool = false// 初のはなまるアラートの表示有無
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
                                }
                                .overlay {
                                    if clearedText.contains(text) {
                                        HanamaruView()
                                    } else if halfClearedText.contains(text) {
                                        MaruView()
                                    }
                                }
                                .background(clearedText.contains(text) ? setting.clearedTextBackgroundColor : (halfClearedText.contains(text) ? setting.halfClearedTextBackgroundColor :  (isYellowMode ? setting.yellowModeBackgroundColor : Color(.white))))
                        }
                    }
                    .foregroundColor(.black)
                }
            }
        }
        .onAppear {
            clearedTextCount = 0
            halfClearedTextCount = 0
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
        .alert("", isPresented: $isShowClearAlert) {
            Button("OK") {
                isShowClearAlert = false
            }
        } message: {
            Text("Congratulation! You've cleared everything. Go to the next level when you are ready.")
        }
        .alert("", isPresented: $isShowPerfectClearAlert) {
            Button("OK") {
                isShowPerfectClearAlert = false
            }
        } message: {
            Text("Wonderful! Perfect! This level is perfect.")
        }
        .alert("", isPresented: $isShowFirstHanamaruAlert) {
            Button("OK") {
                isShowFirstHanamaruAlert = false
            }
        } message: {
            Text("You did it! You were able to write it with a hidden example. If you hide the example and write it, you will receive an accent.")
        }
        .alert("", isPresented: $isShowHanamaruGuidanceAlert) {
            Button("OK") {
                isShowHanamaruGuidanceAlert = false
            }
        } message: {
            Text("Once you get used to it, press the text button on the bottom left and try writing with the model hidden!")
        }
        // 戻るボタンを独自実装
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    navigationPath.removeLast()
                } label: {
                    Image(systemName: "chevron.left")
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
        var isPerfect: Bool = false                     // 全てはなまるか否か
        var isCleared: Bool = false                     // 全てクリアしたか否か
        var isHalfCleared: Bool = false                 // 半分クリアしたか否か
        clearedText.removeAll()
        halfClearedText.removeAll()
        
        for data in data {
            if let text = data.clearedText {
                // モデルに保存済みのテキストが選択したレベルのテキストに含まれていた場合、カウントを1加える。
                if list.contains(text) {
                    clearedText.append(text)
                    clearedTextCount += 1
                }
            }
            if let text = data.halfClearedText {
                // モデルに保存済みのテキストが選択したレベルのテキストに含まれていた場合、カウントを1加える。
                if list.contains(text) {
                    halfClearedText.append(text)
                    halfClearedTextCount += 1
                }
            }
            
            if data.halfClearedLevel == selectedLevel {
                isYellowMode = true
                isHalfCleared = true
            } else if data.clearedLevel == selectedLevel {
                isHalfCleared = true
                isCleared = true
            } else if data.perfectClearedLevel == selectedLevel {
                isHalfCleared = true
                isCleared = true
                isPerfect = true
            }
        }
        
        var blankRemovedList = list
        blankRemovedList.removeAll(where: {$0.contains("空白")})
        
        // 初めてはなまるを獲得したら、初はなまるアラートを発動する。
        if clearedTextCount >= 1 && !isShowFirstHanamaru {
            isShowFirstHanamaru = true
            isShowHanamaruGuidance = true
            isShowFirstHanamaruAlert = true
        }
        
        // あるレベルでハーフクリアが7個以上になったら、はなまる紹介アラートを発動する。
        if halfClearedTextCount >= 7 && !isShowHanamaruGuidance {
            isShowHanamaruGuidance = true
            isShowHanamaruGuidanceAlert = true
            sounds.fileName = setting.yellowModeAlertSound
            sounds.playSound()
        }
        
        if blankRemovedList.count <= clearedTextCount && !isPerfect {
            // クリアしたテキスト数と、元のテキスト数が同じ（全てクリアした）且つそれが初回の場合、Modelにパーフェクトクリアしたレベルを保存する。
            addPerfectClearedLebel()
            isShowPerfectClearAlert = true
            sounds.fileName = setting.yellowModeAlertSound
            sounds.playSound()
        } else if blankRemovedList.count <= halfClearedTextCount && !isCleared {
            // ハーフクリアしたテキスト数と、元のテキスト数が同じ（全てハーフクリアした）且つそれが初回の場合、Modelにクリアしたレベルを保存する。
            addClearedLebel()
            isShowClearAlert = true
            sounds.fileName = setting.yellowModeAlertSound
            sounds.playSound()
        } else if ((blankRemovedList.count / 2) <= halfClearedTextCount) && !isHalfCleared {
            // クリアしたテキスト数が、元のテキスト数の半分以上（半分クリアした）場合、イエローモード発動。
            addHalfClearedLebel()
            isShowYellowModeAlert = true
            sounds.fileName = setting.yellowModeAlertSound
            sounds.playSound()
        }
    }
    
    /// Modelにパーフェクトクリアしたレベルを保存する。
    /// - Parameters: なし
    /// - Returns: なし
    private func addPerfectClearedLebel() {
        let newLevel = Entity(context: viewContext)
        newLevel.perfectClearedLevel = Int16(selectedLevel)
        do {
            try viewContext.save()
        } catch {
            fatalError("セーブに失敗")
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
        HiraganaListView(navigationPath: .constant(NavigationPath()), selectedLevel: .constant(1), isDoubleText: .constant(false), isShowHanamaruGuidance: .constant(false), isShowFirstHanamaru: .constant(false))
    }
}
