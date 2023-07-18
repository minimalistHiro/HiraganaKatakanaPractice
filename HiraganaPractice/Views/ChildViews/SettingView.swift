//
//  SettingView.swift
//  HiraganaPractice
//
//  Created by 金子広樹 on 2023/07/14.
//

import SwiftUI

struct SettingView: View {
    @Environment(\.managedObjectContext) var viewContext
    @FetchRequest(sortDescriptors: [])
    var data: FetchedResults<Entity>
    
    @Binding var isVibration: Bool
    @Binding var isBGMPlay: Bool
    @State private var isShowAlert: Bool = false            // アラートの表示有無
    @State private var alertEntity = AlertEntity(title: "", message: "", actionText: "", cancelText: "", button: .single)
    @State private var inputs: Inputs = .none               // ボタン押下実行処理
    
    var body: some View {
        List {
            Toggle(isOn: $isBGMPlay) {
                Text("BGM")
            }
            Toggle(isOn: $isVibration) {
                Text("バイブレーション")
            }
            Button {
                inputs = .tappedDeleteButton
                addAlertEntity()
                isShowAlert = true
            } label: {
                Text("データの削除")
                    .foregroundColor(.red)
            }
        }
        .alert(alertEntity.title, isPresented: $isShowAlert, presenting: alertEntity) { entity in
            if alertEntity.button == .single {
                Button(entity.actionText) {
                    isShowAlert = false
                }
            } else {
                Button(entity.actionText, role: .destructive) {
                    alertAction()
                }
                Button(entity.cancelText, role: .cancel) {
                    isShowAlert = false
                }
            }
        } message: { entity in
            Text(entity.message)
        }
    }
    
    enum Inputs {
        case none
        case tappedDeleteButton
        case afterDelete
    }
    
    /// アラートの作成
    /// - Parameters: なし
    /// - Returns: なし
    func addAlertEntity() {
        switch inputs {
        case .none:
            break
        case .tappedDeleteButton:
            alertEntity = AlertEntity(title: "",
                                      message: "全て削除しますか？",
                                      actionText: "削除",
                                      cancelText: "キャンセル",
                                      button: .double)
        case .afterDelete:
            alertEntity = AlertEntity(title: "",
                                      message: "削除しました。",
                                      actionText: "OK",
                                      cancelText: "",
                                      button: .single)
        }
    }
    
    /// アラートの実行処理
    /// - Parameters: なし
    /// - Returns: なし
    func alertAction() {
        switch inputs {
        case .none:
            break
        case .tappedDeleteButton:
            deleteData()
        case .afterDelete:
            break
        }
    }
    
    /// Modelのデータを全て削除する。
    /// - Parameters: なし
    /// - Returns: なし
    private func deleteData() {
        for data in data {
            viewContext.delete(data)
        }
        do {
            try viewContext.save()
        } catch {
            fatalError("セーブに失敗")
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            inputs = .afterDelete
            addAlertEntity()
            isShowAlert = true
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView(isVibration: .constant(true), isBGMPlay: .constant(true))
    }
}
