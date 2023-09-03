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
    let hiraganaDrawPoints = HiraganaDrawPoints()
    let hiraganaSonantDrawPoints = HiraganaSonantDrawPoints()
    let katakanaDrawPoints = KatakanaDrawPoints()
    let katakanaSonantDrawPoints = KatakanaSonantDrawPoints()
    @Binding var selectedLevel: Int
    @Binding var endedDrawPoints: [DrawPoints]
    @Binding var isShowArrow: Bool
    @Binding var isShowText: Bool
    @Binding var isShowAnExample: Bool
    // onChangedイベント中の座標を保持
    @State private var tmpDrawPoints: DrawPoints = DrawPoints(points: [])
    @State private var canvasLocalRect: CGRect = .zero              // canvasのサイズ情報
    static var canvasGetSize: CGFloat = .zero                       // canvasの取得サイズ
    @State private var isGetCanvasSize: Bool = false                // canvasサイズを取得したか否か
    let text: String                                                // 取得したテキスト1文字
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // 白紙
                Rectangle()
                    .foregroundColor(.white)
                    .onAppear {
                        canvasLocalRect = geometry.frame(in: .local)
                    }
                
                // テキスト
                if isShowText {
                    if isCheckSmallText() {
                        VStack {
                            Spacer()
                            HStack {
                                Image("‎UDDigiFont\(text)")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(maxWidth: CanvasView.canvasGetSize / 2, maxHeight: CanvasView.canvasGetSize / 2)
                                Spacer()
                            }
                        }
                    } else {
                        Image("‎UDDigiFont\(text)")
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height)
                    }
                }
                
                // 外枠
                Rectangle()
                    .foregroundColor(.clear)
                    .border(Color.black, width: setting.canvasBorderWidth)
                
                // ドラッグ後の描画
                ForEach(endedDrawPoints) { data in
                    Path { path in
                        path.addLines(data.points)
                        print(endedDrawPoints)
                    }
                    .stroke(isShowAnExample ? .red : .black, style: StrokeStyle(lineWidth: isCheckSmallText() ? setting.smallTextCanvasLineWidth : setting.largeTextCanvasLineWidth, lineCap: .round, lineJoin: .round))
                }
                
                // ドラッグ中の描画。指を離したらここの描画は消えるがDrawPathViewが上書きするので見た目は問題ない
                Path { path in
                    path.addLines(tmpDrawPoints.points)
                }
                .stroke(isShowAnExample ? .red : .black, style: StrokeStyle(lineWidth: isCheckSmallText() ? setting.smallTextCanvasLineWidth : setting.largeTextCanvasLineWidth, lineCap: .round, lineJoin: .round))
                
                // 点線
                WidthLine()
                    .stroke(style: .init(dash: [4, 3]))
                    .foregroundColor(.black)
                    .frame(height: 0.5)
                HeightLine()
                    .stroke(style: .init(dash: [4, 3]))
                    .foregroundColor(.black)
                    .frame(width: 0.5)
                
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
                        // お手本を実行していない場合のみ、手書きを許可。
                        if !isShowAnExample {
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
                        }
                    })
                    .onEnded({ value in
                        // お手本を実行していない場合のみ、手書きを許可。
                        if !isShowAnExample {
                            endedDrawPoints.append(tmpDrawPoints)
                            tmpDrawPoints = DrawPoints(points: [])
                        }
                    })
            )
        }
        .onChange(of: isShowAnExample) { value in
            if isShowAnExample {
                switch selectedLevel {
                case 1:
                    showAnHiraganaExampleOperation(text)
                case 2:
                    showAnHiraganaSonantExampleOperation(text)
                case 5:
                    showAnKatakanaExampleOperation(text)
                case 6:
                    showAnKatakanaSonantExampleOperation(text)
                default:
                    break
                }
            }
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
    
    /// 1画分の書き方のお手本の実行。
    /// - Parameters:
    ///   - points: 1画分の線
    /// - Returns: なし
    private func showAnExample(_ points: [CGPoint]) {
        var newPoints = points
        Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { timer in
            if let point = newPoints.first {
                tmpDrawPoints.points.append(point)
                newPoints.removeFirst()
            } else {
                timer.invalidate()
                endedDrawPoints.append(tmpDrawPoints)
                tmpDrawPoints = DrawPoints(points: [])
            }
        }
    }
    
    /// 各ひらがなの書き方のお手本の実行。
    /// - Parameters:
    ///   - text: 対象の文字
    /// - Returns: なし
    private func showAnHiraganaExampleOperation(_ text: String) {
        switch text {
        case "あ":
            Task {
                showAnExample(hiraganaDrawPoints.a1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(hiraganaDrawPoints.a2)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(hiraganaDrawPoints.a3)
                try? await Task.sleep(nanoseconds: 3_500_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "い":
            Task {
                showAnExample(hiraganaDrawPoints.i1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(hiraganaDrawPoints.i2)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "う":
            Task {
                showAnExample(hiraganaDrawPoints.u1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(hiraganaDrawPoints.u2)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "え":
            Task {
                showAnExample(hiraganaDrawPoints.e1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(hiraganaDrawPoints.e2)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "お":
            Task {
                showAnExample(hiraganaDrawPoints.o1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(hiraganaDrawPoints.o2)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                showAnExample(hiraganaDrawPoints.o3)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "か":
            Task {
                showAnExample(hiraganaDrawPoints.ka1)
                try? await Task.sleep(nanoseconds: 2_000_000_000)
                showAnExample(hiraganaDrawPoints.ka2)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(hiraganaDrawPoints.ka3)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "き":
            Task {
                showAnExample(hiraganaDrawPoints.ki1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(hiraganaDrawPoints.ki2)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(hiraganaDrawPoints.ki3)
                try? await Task.sleep(nanoseconds: 2_000_000_000)
                showAnExample(hiraganaDrawPoints.ki4)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "く":
            Task {
                showAnExample(hiraganaDrawPoints.ku1)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "け":
            Task {
                showAnExample(hiraganaDrawPoints.ke1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(hiraganaDrawPoints.ke2)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(hiraganaDrawPoints.ke3)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "こ":
            Task {
                showAnExample(hiraganaDrawPoints.ko1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(hiraganaDrawPoints.ko2)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "さ":
            Task {
                showAnExample(hiraganaDrawPoints.sa1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(hiraganaDrawPoints.sa2)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(hiraganaDrawPoints.sa3)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "し":
            Task {
                showAnExample(hiraganaDrawPoints.si1)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "す":
            Task {
                showAnExample(hiraganaDrawPoints.su1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(hiraganaDrawPoints.su2)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "せ":
            Task {
                showAnExample(hiraganaDrawPoints.se1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(hiraganaDrawPoints.se2)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(hiraganaDrawPoints.se3)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "そ":
            Task {
                showAnExample(hiraganaDrawPoints.so1)
                try? await Task.sleep(nanoseconds: 4_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "た":
            Task {
                showAnExample(hiraganaDrawPoints.ta1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(hiraganaDrawPoints.ta2)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(hiraganaDrawPoints.ta3)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(hiraganaDrawPoints.ta4)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "ち":
            Task {
                showAnExample(hiraganaDrawPoints.ti1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(hiraganaDrawPoints.ti2)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "つ":
            Task {
                showAnExample(hiraganaDrawPoints.tu1)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "て":
            Task {
                showAnExample(hiraganaDrawPoints.te1)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "と":
            Task {
                showAnExample(hiraganaDrawPoints.to1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(hiraganaDrawPoints.to2)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "な":
            Task {
                showAnExample(hiraganaDrawPoints.na1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(hiraganaDrawPoints.na2)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(hiraganaDrawPoints.na3)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(hiraganaDrawPoints.na4)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "に":
            Task {
                showAnExample(hiraganaDrawPoints.ni1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(hiraganaDrawPoints.ni2)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(hiraganaDrawPoints.ni3)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "ぬ":
            Task {
                showAnExample(hiraganaDrawPoints.nu1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(hiraganaDrawPoints.nu2)
                try? await Task.sleep(nanoseconds: 5_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "ね":
            Task {
                showAnExample(hiraganaDrawPoints.ne1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(hiraganaDrawPoints.ne2)
                try? await Task.sleep(nanoseconds: 5_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "の":
            Task {
                showAnExample(hiraganaDrawPoints.no1)
                try? await Task.sleep(nanoseconds: 3_500_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "は":
            Task {
                showAnExample(hiraganaDrawPoints.ha1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(hiraganaDrawPoints.ha2)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(hiraganaDrawPoints.ha3)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "ひ":
            Task {
                showAnExample(hiraganaDrawPoints.hi1)
                try? await Task.sleep(nanoseconds: 3_500_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "ふ":
            Task {
                showAnExample(hiraganaDrawPoints.hu1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(hiraganaDrawPoints.hu2)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(hiraganaDrawPoints.hu3)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(hiraganaDrawPoints.hu4)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "へ":
            Task {
                showAnExample(hiraganaDrawPoints.he1)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "ほ":
            Task {
                showAnExample(hiraganaDrawPoints.ho1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(hiraganaDrawPoints.ho2)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(hiraganaDrawPoints.ho3)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(hiraganaDrawPoints.ho4)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "ま":
            Task {
                showAnExample(hiraganaDrawPoints.ma1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(hiraganaDrawPoints.ma2)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(hiraganaDrawPoints.ma3)
                try? await Task.sleep(nanoseconds: 3_500_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "み":
            Task {
                showAnExample(hiraganaDrawPoints.mi1)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                showAnExample(hiraganaDrawPoints.mi2)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "む":
            Task {
                showAnExample(hiraganaDrawPoints.mu1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(hiraganaDrawPoints.mu2)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                showAnExample(hiraganaDrawPoints.mu3)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "め":
            Task {
                showAnExample(hiraganaDrawPoints.me1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(hiraganaDrawPoints.me2)
                try? await Task.sleep(nanoseconds: 4_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "も":
            Task {
                showAnExample(hiraganaDrawPoints.mo1)
                try? await Task.sleep(nanoseconds: 2_000_000_000)
                showAnExample(hiraganaDrawPoints.mo2)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(hiraganaDrawPoints.mo3)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "や":
            Task {
                showAnExample(hiraganaDrawPoints.ya1)
                try? await Task.sleep(nanoseconds: 2_000_000_000)
                showAnExample(hiraganaDrawPoints.ya2)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(hiraganaDrawPoints.ya3)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "ゆ":
            Task {
                showAnExample(hiraganaDrawPoints.yu1)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                showAnExample(hiraganaDrawPoints.yu2)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "よ":
            Task {
                showAnExample(hiraganaDrawPoints.yo1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(hiraganaDrawPoints.yo2)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "ら":
            Task {
                showAnExample(hiraganaDrawPoints.ra1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(hiraganaDrawPoints.ra2)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "り":
            Task {
                showAnExample(hiraganaDrawPoints.ri1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(hiraganaDrawPoints.ri2)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "る":
            Task {
                showAnExample(hiraganaDrawPoints.ru1)
                try? await Task.sleep(nanoseconds: 4_500_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "れ":
            Task {
                showAnExample(hiraganaDrawPoints.re1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(hiraganaDrawPoints.re2)
                try? await Task.sleep(nanoseconds: 4_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "ろ":
            Task {
                showAnExample(hiraganaDrawPoints.ro1)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "わ":
            Task {
                showAnExample(hiraganaDrawPoints.wa1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(hiraganaDrawPoints.wa2)
                try? await Task.sleep(nanoseconds: 3_500_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "を":
            Task {
                showAnExample(hiraganaDrawPoints.wo1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(hiraganaDrawPoints.wo2)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(hiraganaDrawPoints.wo3)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "ん":
            Task {
                showAnExample(hiraganaDrawPoints.nn1)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        default:
            break
        }
    }
    
    /// 各ひらがな濁音の書き方のお手本の実行。
    /// - Parameters:
    ///   - text: 対象の文字
    /// - Returns: なし
    private func showAnHiraganaSonantExampleOperation(_ text: String) {
        switch text {
        case "が":
            Task {
                showAnExample(hiraganaSonantDrawPoints.ga1)
                try? await Task.sleep(nanoseconds: 2_000_000_000)
                showAnExample(hiraganaSonantDrawPoints.ga2)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(hiraganaSonantDrawPoints.ga3)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(hiraganaSonantDrawPoints.ga4)
                try? await Task.sleep(nanoseconds: 1_000_000_000)
                showAnExample(hiraganaSonantDrawPoints.ga5)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "ぎ":
            Task {
                showAnExample(hiraganaSonantDrawPoints.gi1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(hiraganaSonantDrawPoints.gi2)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(hiraganaSonantDrawPoints.gi3)
                try? await Task.sleep(nanoseconds: 2_000_000_000)
                showAnExample(hiraganaSonantDrawPoints.gi4)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(hiraganaSonantDrawPoints.gi5)
                try? await Task.sleep(nanoseconds: 1_000_000_000)
                showAnExample(hiraganaSonantDrawPoints.gi6)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "ぐ":
            Task {
                showAnExample(hiraganaSonantDrawPoints.gu1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(hiraganaSonantDrawPoints.gu2)
                try? await Task.sleep(nanoseconds: 1_000_000_000)
                showAnExample(hiraganaSonantDrawPoints.gu3)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "げ":
            Task {
                showAnExample(hiraganaSonantDrawPoints.ge1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(hiraganaSonantDrawPoints.ge2)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(hiraganaSonantDrawPoints.ge3)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(hiraganaSonantDrawPoints.ge4)
                try? await Task.sleep(nanoseconds: 1_000_000_000)
                showAnExample(hiraganaSonantDrawPoints.ge5)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "ご":
            Task {
                showAnExample(hiraganaSonantDrawPoints.go1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(hiraganaSonantDrawPoints.go2)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(hiraganaSonantDrawPoints.go3)
                try? await Task.sleep(nanoseconds: 1_000_000_000)
                showAnExample(hiraganaSonantDrawPoints.go4)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "ざ":
            Task {
                showAnExample(hiraganaSonantDrawPoints.za1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(hiraganaSonantDrawPoints.za2)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(hiraganaSonantDrawPoints.za3)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(hiraganaSonantDrawPoints.za4)
                try? await Task.sleep(nanoseconds: 1_000_000_000)
                showAnExample(hiraganaSonantDrawPoints.za5)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "じ":
            Task {
                showAnExample(hiraganaSonantDrawPoints.zi1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(hiraganaSonantDrawPoints.zi2)
                try? await Task.sleep(nanoseconds: 1_000_000_000)
                showAnExample(hiraganaSonantDrawPoints.zi3)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "ず":
            Task {
                showAnExample(hiraganaSonantDrawPoints.zu1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(hiraganaSonantDrawPoints.zu2)
                try? await Task.sleep(nanoseconds: 2_500_000_000)
                showAnExample(hiraganaSonantDrawPoints.zu3)
                try? await Task.sleep(nanoseconds: 1_000_000_000)
                showAnExample(hiraganaSonantDrawPoints.zu4)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "ぜ":
            Task {
                showAnExample(hiraganaSonantDrawPoints.ze1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(hiraganaSonantDrawPoints.ze2)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(hiraganaSonantDrawPoints.ze3)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(hiraganaSonantDrawPoints.ze4)
                try? await Task.sleep(nanoseconds: 1_000_000_000)
                showAnExample(hiraganaSonantDrawPoints.ze5)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "ぞ":
            Task {
                showAnExample(hiraganaSonantDrawPoints.zo1)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                showAnExample(hiraganaSonantDrawPoints.zo2)
                try? await Task.sleep(nanoseconds: 1_000_000_000)
                showAnExample(hiraganaSonantDrawPoints.zo3)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "だ":
            Task {
                showAnExample(hiraganaSonantDrawPoints.da1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(hiraganaSonantDrawPoints.da2)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(hiraganaSonantDrawPoints.da3)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(hiraganaSonantDrawPoints.da4)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(hiraganaSonantDrawPoints.da5)
                try? await Task.sleep(nanoseconds: 1_000_000_000)
                showAnExample(hiraganaSonantDrawPoints.da6)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "ぢ":
            Task {
                showAnExample(hiraganaSonantDrawPoints.di1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(hiraganaSonantDrawPoints.di2)
                try? await Task.sleep(nanoseconds: 2_500_000_000)
                showAnExample(hiraganaSonantDrawPoints.di3)
                try? await Task.sleep(nanoseconds: 1_000_000_000)
                showAnExample(hiraganaSonantDrawPoints.di4)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "づ":
            Task {
                showAnExample(hiraganaSonantDrawPoints.du1)
                try? await Task.sleep(nanoseconds: 2_000_000_000)
                showAnExample(hiraganaSonantDrawPoints.du2)
                try? await Task.sleep(nanoseconds: 1_000_000_000)
                showAnExample(hiraganaSonantDrawPoints.du3)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "で":
            Task {
                showAnExample(hiraganaSonantDrawPoints.de1)
                try? await Task.sleep(nanoseconds: 2_500_000_000)
                showAnExample(hiraganaSonantDrawPoints.de2)
                try? await Task.sleep(nanoseconds: 1_000_000_000)
                showAnExample(hiraganaSonantDrawPoints.de3)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "ど":
            Task {
                showAnExample(hiraganaSonantDrawPoints.do1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(hiraganaSonantDrawPoints.do2)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(hiraganaSonantDrawPoints.do3)
                try? await Task.sleep(nanoseconds: 1_000_000_000)
                showAnExample(hiraganaSonantDrawPoints.do4)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "ば":
            Task {
                showAnExample(hiraganaSonantDrawPoints.ba1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(hiraganaSonantDrawPoints.ba2)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(hiraganaSonantDrawPoints.ba3)
                try? await Task.sleep(nanoseconds: 2_500_000_000)
                showAnExample(hiraganaSonantDrawPoints.ba4)
                try? await Task.sleep(nanoseconds: 1_000_000_000)
                showAnExample(hiraganaSonantDrawPoints.ba5)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "び":
            Task {
                showAnExample(hiraganaSonantDrawPoints.bi1)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                showAnExample(hiraganaSonantDrawPoints.bi2)
                try? await Task.sleep(nanoseconds: 1_000_000_000)
                showAnExample(hiraganaSonantDrawPoints.bi3)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "ぶ":
            Task {
                showAnExample(hiraganaSonantDrawPoints.bu1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(hiraganaSonantDrawPoints.bu2)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(hiraganaSonantDrawPoints.bu3)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(hiraganaSonantDrawPoints.bu4)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(hiraganaSonantDrawPoints.bu5)
                try? await Task.sleep(nanoseconds: 1_000_000_000)
                showAnExample(hiraganaSonantDrawPoints.bu6)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "べ":
            Task {
                showAnExample(hiraganaSonantDrawPoints.be1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(hiraganaSonantDrawPoints.be2)
                try? await Task.sleep(nanoseconds: 1_000_000_000)
                showAnExample(hiraganaSonantDrawPoints.be3)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "ぼ":
            Task {
                showAnExample(hiraganaSonantDrawPoints.bo1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(hiraganaSonantDrawPoints.bo2)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(hiraganaSonantDrawPoints.bo3)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(hiraganaSonantDrawPoints.bo4)
                try? await Task.sleep(nanoseconds: 2_500_000_000)
                showAnExample(hiraganaSonantDrawPoints.bo5)
                try? await Task.sleep(nanoseconds: 1_000_000_000)
                showAnExample(hiraganaSonantDrawPoints.bo6)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "ぱ":
            Task {
                showAnExample(hiraganaSonantDrawPoints.pa1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(hiraganaSonantDrawPoints.pa2)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(hiraganaSonantDrawPoints.pa3)
                try? await Task.sleep(nanoseconds: 2_500_000_000)
                showAnExample(hiraganaSonantDrawPoints.pa4)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "ぴ":
            Task {
                showAnExample(hiraganaSonantDrawPoints.pi1)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                showAnExample(hiraganaSonantDrawPoints.pi2)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "ぷ":
            Task {
                showAnExample(hiraganaSonantDrawPoints.pu1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(hiraganaSonantDrawPoints.pu2)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(hiraganaSonantDrawPoints.pu3)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(hiraganaSonantDrawPoints.pu4)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(hiraganaSonantDrawPoints.pu5)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "ぺ":
            Task {
                showAnExample(hiraganaSonantDrawPoints.pe1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(hiraganaSonantDrawPoints.pe2)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "ぽ":
            Task {
                showAnExample(hiraganaSonantDrawPoints.po1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(hiraganaSonantDrawPoints.po2)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(hiraganaSonantDrawPoints.po3)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(hiraganaSonantDrawPoints.po4)
                try? await Task.sleep(nanoseconds: 2_500_000_000)
                showAnExample(hiraganaSonantDrawPoints.po5)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        default:
            break
        }
    }
    
    /// 各カタカナの書き方のお手本の実行。
    /// - Parameters:
    ///   - text: 対象の文字
    /// - Returns: なし
    private func showAnKatakanaExampleOperation(_ text: String) {
        switch text {
        case "ア":
            Task {
                showAnExample(katakanaDrawPoints.a1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaDrawPoints.a2)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "イ":
            Task {
                showAnExample(katakanaDrawPoints.i1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaDrawPoints.i2)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "ウ":
            Task {
                showAnExample(katakanaDrawPoints.u1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaDrawPoints.u2)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaDrawPoints.u3)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "エ":
            Task {
                showAnExample(katakanaDrawPoints.e1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaDrawPoints.e2)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaDrawPoints.e3)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "オ":
            Task {
                showAnExample(katakanaDrawPoints.o1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaDrawPoints.o2)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaDrawPoints.o3)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "カ":
            Task {
                showAnExample(katakanaDrawPoints.ka1)
                try? await Task.sleep(nanoseconds: 2_000_000_000)
                showAnExample(katakanaDrawPoints.ka2)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "キ":
            Task {
                showAnExample(katakanaDrawPoints.ki1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaDrawPoints.ki2)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaDrawPoints.ki3)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "ク":
            Task {
                showAnExample(katakanaDrawPoints.ku1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaDrawPoints.ku2)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "ケ":
            Task {
                showAnExample(katakanaDrawPoints.ke1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaDrawPoints.ke2)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaDrawPoints.ke3)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "コ":
            Task {
                showAnExample(katakanaDrawPoints.ko1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaDrawPoints.ko2)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "サ":
            Task {
                showAnExample(katakanaDrawPoints.sa1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaDrawPoints.sa2)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaDrawPoints.sa3)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "シ":
            Task {
                showAnExample(katakanaDrawPoints.si1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaDrawPoints.si2)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaDrawPoints.si3)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "ス":
            Task {
                showAnExample(katakanaDrawPoints.su1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaDrawPoints.su2)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "セ":
            Task {
                showAnExample(katakanaDrawPoints.se1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaDrawPoints.se2)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "ソ":
            Task {
                showAnExample(katakanaDrawPoints.so1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaDrawPoints.so2)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "タ":
            Task {
                showAnExample(katakanaDrawPoints.ta1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaDrawPoints.ta2)
                try? await Task.sleep(nanoseconds: 2_000_000_000)
                showAnExample(katakanaDrawPoints.ta3)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "チ":
            Task {
                showAnExample(katakanaDrawPoints.ti1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaDrawPoints.ti2)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaDrawPoints.ti3)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "ツ":
            Task {
                showAnExample(katakanaDrawPoints.tu1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaDrawPoints.tu2)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaDrawPoints.tu3)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "テ":
            Task {
                showAnExample(katakanaDrawPoints.te1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaDrawPoints.te2)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaDrawPoints.te3)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "ト":
            Task {
                showAnExample(katakanaDrawPoints.to1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaDrawPoints.to2)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "ナ":
            Task {
                showAnExample(katakanaDrawPoints.na1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaDrawPoints.na2)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "ニ":
            Task {
                showAnExample(katakanaDrawPoints.ni1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaDrawPoints.ni2)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "ヌ":
            Task {
                showAnExample(katakanaDrawPoints.nu1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaDrawPoints.nu2)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "ネ":
            Task {
                showAnExample(katakanaDrawPoints.ne1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaDrawPoints.ne2)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaDrawPoints.ne3)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaDrawPoints.ne4)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "ノ":
            Task {
                showAnExample(katakanaDrawPoints.no1)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "ハ":
            Task {
                showAnExample(katakanaDrawPoints.ha1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaDrawPoints.ha2)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "ヒ":
            Task {
                showAnExample(katakanaDrawPoints.hi1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaDrawPoints.hi2)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "フ":
            Task {
                showAnExample(katakanaDrawPoints.hu1)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "ヘ":
            Task {
                showAnExample(katakanaDrawPoints.he1)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "ホ":
            Task {
                showAnExample(katakanaDrawPoints.ho1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaDrawPoints.ho2)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaDrawPoints.ho3)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaDrawPoints.ho4)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "マ":
            Task {
                showAnExample(katakanaDrawPoints.ma1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaDrawPoints.ma2)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "ミ":
            Task {
                showAnExample(katakanaDrawPoints.mi1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaDrawPoints.mi2)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaDrawPoints.mi3)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "ム":
            Task {
                showAnExample(katakanaDrawPoints.mu1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaDrawPoints.mu2)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "メ":
            Task {
                showAnExample(katakanaDrawPoints.me1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaDrawPoints.me2)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "モ":
            Task {
                showAnExample(katakanaDrawPoints.mo1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaDrawPoints.mo2)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaDrawPoints.mo3)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "ヤ":
            Task {
                showAnExample(katakanaDrawPoints.ya1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaDrawPoints.ya2)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "ユ":
            Task {
                showAnExample(katakanaDrawPoints.yu1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaDrawPoints.yu2)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "ヨ":
            Task {
                showAnExample(katakanaDrawPoints.yo1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaDrawPoints.yo2)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaDrawPoints.yo3)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "ラ":
            Task {
                showAnExample(katakanaDrawPoints.ra1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaDrawPoints.ra2)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "リ":
            Task {
                showAnExample(katakanaDrawPoints.ri1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaDrawPoints.ri2)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "ル":
            Task {
                showAnExample(katakanaDrawPoints.ru1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaDrawPoints.ru2)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "レ":
            Task {
                showAnExample(katakanaDrawPoints.re1)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "ロ":
            Task {
                showAnExample(katakanaDrawPoints.ro1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaDrawPoints.ro2)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaDrawPoints.ro3)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "ワ":
            Task {
                showAnExample(katakanaDrawPoints.wa1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaDrawPoints.wa2)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "ヲ":
            Task {
                showAnExample(katakanaDrawPoints.wo1)
                try? await Task.sleep(nanoseconds: 2_000_000_000)
                showAnExample(katakanaDrawPoints.wo2)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "ン":
            Task {
                showAnExample(katakanaDrawPoints.nn1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaDrawPoints.nn2)
                try? await Task.sleep(nanoseconds: 2_500_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        default:
            break
        }
    }
    
    /// 各カタカナ濁音の書き方のお手本の実行。
    /// - Parameters:
    ///   - text: 対象の文字
    /// - Returns: なし
    private func showAnKatakanaSonantExampleOperation(_ text: String) {
        switch text {
        case "ガ":
            Task {
                showAnExample(katakanaSonantDrawPoints.ga1)
                try? await Task.sleep(nanoseconds: 2_000_000_000)
                showAnExample(katakanaSonantDrawPoints.ga2)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaSonantDrawPoints.ga3)
                try? await Task.sleep(nanoseconds: 1_000_000_000)
                showAnExample(katakanaSonantDrawPoints.ga4)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "ギ":
            Task {
                showAnExample(katakanaSonantDrawPoints.gi1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaSonantDrawPoints.gi2)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaSonantDrawPoints.gi3)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaSonantDrawPoints.gi4)
                try? await Task.sleep(nanoseconds: 1_000_000_000)
                showAnExample(katakanaSonantDrawPoints.gi5)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "グ":
            Task {
                showAnExample(katakanaSonantDrawPoints.gu1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaSonantDrawPoints.gu2)
                try? await Task.sleep(nanoseconds: 2_000_000_000)
                showAnExample(katakanaSonantDrawPoints.gu3)
                try? await Task.sleep(nanoseconds: 1_000_000_000)
                showAnExample(katakanaSonantDrawPoints.gu4)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "ゲ":
            Task {
                showAnExample(katakanaSonantDrawPoints.ge1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaSonantDrawPoints.ge2)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaSonantDrawPoints.ge3)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaSonantDrawPoints.ge4)
                try? await Task.sleep(nanoseconds: 1_000_000_000)
                showAnExample(katakanaSonantDrawPoints.ge5)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "ゴ":
            Task {
                showAnExample(katakanaSonantDrawPoints.go1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaSonantDrawPoints.go2)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaSonantDrawPoints.go3)
                try? await Task.sleep(nanoseconds: 1_000_000_000)
                showAnExample(katakanaSonantDrawPoints.go4)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "ザ":
            Task {
                showAnExample(katakanaSonantDrawPoints.za1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaSonantDrawPoints.za2)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaSonantDrawPoints.za3)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaSonantDrawPoints.za4)
                try? await Task.sleep(nanoseconds: 1_000_000_000)
                showAnExample(katakanaSonantDrawPoints.za5)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "ジ":
            Task {
                showAnExample(katakanaSonantDrawPoints.zi1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaSonantDrawPoints.zi2)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaSonantDrawPoints.zi3)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaSonantDrawPoints.zi4)
                try? await Task.sleep(nanoseconds: 1_000_000_000)
                showAnExample(katakanaSonantDrawPoints.zi5)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "ズ":
            Task {
                showAnExample(katakanaSonantDrawPoints.zu1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaSonantDrawPoints.zu2)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaSonantDrawPoints.zu3)
                try? await Task.sleep(nanoseconds: 1_000_000_000)
                showAnExample(katakanaSonantDrawPoints.zu4)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "ゼ":
            Task {
                showAnExample(katakanaSonantDrawPoints.ze1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaSonantDrawPoints.ze2)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaSonantDrawPoints.ze3)
                try? await Task.sleep(nanoseconds: 1_000_000_000)
                showAnExample(katakanaSonantDrawPoints.ze4)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "ゾ":
            Task {
                showAnExample(katakanaSonantDrawPoints.zo1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaSonantDrawPoints.zo2)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaSonantDrawPoints.zo3)
                try? await Task.sleep(nanoseconds: 1_000_000_000)
                showAnExample(katakanaSonantDrawPoints.zo4)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "ダ":
            Task {
                showAnExample(katakanaSonantDrawPoints.da1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaSonantDrawPoints.da2)
                try? await Task.sleep(nanoseconds: 2_000_000_000)
                showAnExample(katakanaSonantDrawPoints.da3)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaSonantDrawPoints.da4)
                try? await Task.sleep(nanoseconds: 1_000_000_000)
                showAnExample(katakanaSonantDrawPoints.da5)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "ヂ":
            Task {
                showAnExample(katakanaSonantDrawPoints.di1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaSonantDrawPoints.di2)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaSonantDrawPoints.di3)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaSonantDrawPoints.di4)
                try? await Task.sleep(nanoseconds: 1_000_000_000)
                showAnExample(katakanaSonantDrawPoints.di5)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "ヅ":
            Task {
                showAnExample(katakanaSonantDrawPoints.du1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaSonantDrawPoints.du2)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaSonantDrawPoints.du3)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaSonantDrawPoints.du4)
                try? await Task.sleep(nanoseconds: 1_000_000_000)
                showAnExample(katakanaSonantDrawPoints.du5)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "デ":
            Task {
                showAnExample(katakanaSonantDrawPoints.de1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaSonantDrawPoints.de2)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaSonantDrawPoints.de3)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaSonantDrawPoints.de4)
                try? await Task.sleep(nanoseconds: 1_000_000_000)
                showAnExample(katakanaSonantDrawPoints.de5)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "ド":
            Task {
                showAnExample(katakanaSonantDrawPoints.do1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaSonantDrawPoints.do2)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaSonantDrawPoints.do3)
                try? await Task.sleep(nanoseconds: 1_000_000_000)
                showAnExample(katakanaSonantDrawPoints.do4)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "バ":
            Task {
                showAnExample(katakanaSonantDrawPoints.ba1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaSonantDrawPoints.ba2)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaSonantDrawPoints.ba3)
                try? await Task.sleep(nanoseconds: 1_000_000_000)
                showAnExample(katakanaSonantDrawPoints.ba4)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "ビ":
            Task {
                showAnExample(katakanaSonantDrawPoints.bi1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaSonantDrawPoints.bi2)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaSonantDrawPoints.bi3)
                try? await Task.sleep(nanoseconds: 1_000_000_000)
                showAnExample(katakanaSonantDrawPoints.bi4)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "ブ":
            Task {
                showAnExample(katakanaSonantDrawPoints.bu1)
                try? await Task.sleep(nanoseconds: 2_000_000_000)
                showAnExample(katakanaSonantDrawPoints.bu2)
                try? await Task.sleep(nanoseconds: 1_000_000_000)
                showAnExample(katakanaSonantDrawPoints.bu3)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "ベ":
            Task {
                showAnExample(katakanaSonantDrawPoints.be1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaSonantDrawPoints.be2)
                try? await Task.sleep(nanoseconds: 1_000_000_000)
                showAnExample(katakanaSonantDrawPoints.be3)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "ボ":
            Task {
                showAnExample(katakanaSonantDrawPoints.bo1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaSonantDrawPoints.bo2)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaSonantDrawPoints.bo3)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaSonantDrawPoints.bo4)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaSonantDrawPoints.bo5)
                try? await Task.sleep(nanoseconds: 1_000_000_000)
                showAnExample(katakanaSonantDrawPoints.bo6)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "パ":
            Task {
                showAnExample(katakanaSonantDrawPoints.pa1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaSonantDrawPoints.pa2)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaSonantDrawPoints.pa3)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "ピ":
            Task {
                showAnExample(katakanaSonantDrawPoints.pi1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaSonantDrawPoints.pi2)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaSonantDrawPoints.pi3)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "プ":
            Task {
                showAnExample(katakanaSonantDrawPoints.pu1)
                try? await Task.sleep(nanoseconds: 2_000_000_000)
                showAnExample(katakanaSonantDrawPoints.pu2)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "ペ":
            Task {
                showAnExample(katakanaSonantDrawPoints.pe1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaSonantDrawPoints.pe2)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        case "ポ":
            Task {
                showAnExample(katakanaSonantDrawPoints.po1)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaSonantDrawPoints.po2)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaSonantDrawPoints.po3)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaSonantDrawPoints.po4)
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                showAnExample(katakanaSonantDrawPoints.po5)
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                endedDrawPoints.removeAll()
                isShowAnExample = false
            }
        default:
            break
        }
    }
}

struct CanvasView_Previews: PreviewProvider {
    static var previews: some View {
        CanvasView(selectedLevel: .constant(1), endedDrawPoints: .constant([]), isShowArrow: .constant(true), isShowText: .constant(true), isShowAnExample: .constant(true), text: "あ")
    }
}
