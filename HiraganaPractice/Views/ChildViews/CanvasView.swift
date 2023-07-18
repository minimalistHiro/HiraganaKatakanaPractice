//
//  CanvasView.swift
//  HiraganaPractice
//
//  Created by 金子広樹 on 2023/07/07.
//

import SwiftUI

struct CanvasView: View {
    @Environment(\.managedObjectContext) var viewContext
    @FetchRequest(sortDescriptors: [])
    var data: FetchedResults<Entity>
    
    let setting = Setting()
    @Binding var selectedLevel: Int
    @Binding var endedDrawPoints: [DrawPoints]
    @Binding var isShowArrow: Bool
    @Binding var isShowText: Bool
    // onChangedイベント中の座標を保持
    @State private var tmpDrawPoints: DrawPoints = DrawPoints(points: [])
    @State private var canvasLocalRect: CGRect = .zero              // canvasのサイズ情報
    static var canvasGetSize: CGFloat = .zero                       // canvasの取得サイズ
    @State private var isGetCanvasSize: Bool = false                // canvasサイズを取得したか否か
    let text: String                                                // 取得したテキスト1文字
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Rectangle()
                    .foregroundColor(.white)
                    .border(Color.black, width: setting.canvasBorderWidth)
                    .onAppear {
                        canvasLocalRect = geometry.frame(in: .local)
                    }
                ForEach(endedDrawPoints) { data in
                    Path { path in
                        path.addLines(data.points)
                    }
                    .stroke(.black, style: StrokeStyle(lineWidth: isCheckSmallText() ? setting.smallTextCanvasLineWidth : setting.largeTextCanvasLineWidth, lineCap: .round, lineJoin: .round))
                }
                
                // ドラッグ中の描画。指を離したらここの描画は消えるがDrawPathViewが上書きするので見た目は問題ない
                Path { path in
                    path.addLines(tmpDrawPoints.points)
                }
                .stroke(.black, style: StrokeStyle(lineWidth: isCheckSmallText() ? setting.smallTextCanvasLineWidth : setting.largeTextCanvasLineWidth, lineCap: .round, lineJoin: .round))
                
                // 点線
                WidthLine()
                    .stroke(style: .init(dash: [4, 3]))
                    .foregroundColor(.black)
                    .frame(height: 0.5)
                HeightLine()
                    .stroke(style: .init(dash: [4, 3]))
                    .foregroundColor(.black)
                    .frame(width: 0.5)
                
                // 表示文字。小さいひらがなの場合、文字を小さくする。そのほかの平仮名はそのまま表示。
                if isShowText {
                    if isCheckSmallText() {
                        VStack {
                            Spacer()
                            HStack {
                                Text(text)
                                    .font(.mincho(ofSize: resizeTextSize(150)))
                                    .opacity(0.1)
                                    .padding()
                                Spacer()
                            }
                        }
                    } else {
                        Text(text)
                            .font(.mincho(ofSize: resizeTextSize(250)))
                            .opacity(0.1)
                    }
                }
                
                // CanvasViewのサイズ取得後に、各矢印を表示。
                if isGetCanvasSize {
                    // 矢印表示ボタンが有効の場合のみ表示。
                    if isShowArrow {
                        // 矢印
                        switch selectedLevel {
                        case 1:
                            HiraganaArrowView(hiragana: text)
                        case 2:
                            HiraganaSonantArrowView(hiragana: text)
                        case 3:
                            HiraganaDiphthongArrowView(hiragana: text)
                        case 4:
                            HiraganaDiphthongSonantArrowView(hiragana: text)
                        case 5:
                            KatakanaArrowView(katakana: text)
                        case 6:
                            KatakanaSonantArrowView(katakana: text)
                        case 7:
                            KatakanaDiphthongArrowView(katakana: text)
                        case 8:
                            KatakanaDiphthongSonantArrowView(katakana: text)
                        default:
                            HiraganaArrowView(hiragana: text)
                        }
                    }
                }
            }
            .background() {
                // backgroundを用いて動的にCanvasViewのサイズ（横幅長さ）を取得。
                GeometryReader { geometry in
                    Path { path in
                        // エラー阻止のため、遅延処理で実行。
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            CanvasView.canvasGetSize = geometry.frame(in: .local).maxX
                            isGetCanvasSize = true
                        }
                    }
                }
            }
            .gesture(
                DragGesture(minimumDistance: 0)
                    .onChanged({ value in
                        // 描いている途中（DrawPoints.pointsが空だったら）現在座標を加える
                        guard !tmpDrawPoints.points.isEmpty else {
                            tmpDrawPoints.points.append(value.location)
                            return
                        }

                        // 座標の距離が近いかどうかを判定
                        if let lastPoint = tmpDrawPoints.points.last,
                           filterDistance(startPoint: lastPoint, endPoint: value.location) {
                            tmpDrawPoints.points.append(value.location)
                        }
                    })
                    .onEnded({ value in
                        endedDrawPoints.append(tmpDrawPoints)
                        tmpDrawPoints = DrawPoints(points: [])
//                        addClearedText()
                    })
            )
        }
    }
    
    /// 座標の距離が近いかどうかを判定する。複数本の指をタップした場合もDragGestureはonChangedを呼ぶが、連続した線ではないのでフィルターをかける。
    /// - Parameters:
    ///   - startPoint: 開始座標
    ///   - endPoint: 終わりの座標
    /// - Returns: 距離が130以下且つ終わりの座標がcanvas内に含まれるならtrue、それ以外ならfalse
    private func filterDistance(startPoint: CGPoint, endPoint: CGPoint) -> Bool {
        let distance = sqrt(pow(Double(startPoint.x) - Double(endPoint.x), 2) + pow(Double(startPoint.y) - Double(endPoint.y), 2))
        return distance <= 130 && drawingRange(point: endPoint)
    }
    
    /// 指をタップしている座標がcanvas内であるかどうかを判定する。
    /// - Parameters:
    ///   - point: 終わりの座標
    /// - Returns: 終わりの座標がcanvas内に含まれるならtrue、それ以外ならfalse
    private func drawingRange(point: CGPoint) -> Bool {
        let minX = canvasLocalRect.minX + (setting.largeTextCanvasLineWidth / 2) + setting.canvasBorderWidth
        let maxX = canvasLocalRect.maxX - (setting.largeTextCanvasLineWidth / 2) + setting.canvasBorderWidth
        let minY = canvasLocalRect.minY + (setting.largeTextCanvasLineWidth / 2) + setting.canvasBorderWidth
        let maxY = canvasLocalRect.maxY - (setting.largeTextCanvasLineWidth / 2) + setting.canvasBorderWidth
        return (point.x >= minX && point.x <= maxX) && (point.y >= minY && point.y <= maxY)
    }
    
    /// テキストが小さい文字かどうかをチェックする。
    /// - Parameters: なし
    /// - Returns: 小さい文字ならtrue、大きい文字ならfalse。
    private func isCheckSmallText() -> Bool {
        if text.contains("ゃ") || text.contains("ゅ") || text.contains("ょ") || text.contains("ぁ") || text.contains("ぃ") || text.contains("ぇ") || text.contains("ぉ") || text.contains("ャ") || text.contains("ュ") || text.contains("ョ") || text.contains("ァ") || text.contains("ィ") || text.contains("ェ") || text.contains("ォ") {
            return true
        } else {
            return false
        }
    }
    
    /// 表示するテキストのサイズを端末サイズに合わせて変更する。
    /// - Parameters:
    ///   - textSize: 標準テキストサイズ
    /// - Returns: リサイズ後のテキストサイズ
    private func resizeTextSize(_ textSize: CGFloat) -> CGFloat {
        return textSize * (CanvasView.canvasGetSize / setting.canvasMaxSize)
    }
}

struct CanvasView_Previews: PreviewProvider {
    static var previews: some View {
        CanvasView(selectedLevel: .constant(1), endedDrawPoints: .constant([]), isShowArrow: .constant(true), isShowText: .constant(true), text: "あ")
    }
}
