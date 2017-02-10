/**
 * Icon Make It
 * (c) NeroBlu All Rights Reserved.
 */
import UIKit
import NeroBlu

/// 画像サイズ候補配列の種別
enum ImageSizeCandidate: Int {
    case full
    case many
    case few
    
    /// 画像サイズ候補配列
    var candidates: [Int] {
        switch self {
        case .full:
            return Array(0...1024)
        case .many:
            return [4, 8, 12, 16, 18, 20, 22, 24, 26, 28, 30, 32, 34, 36, 38, 40, 42, 44, 48, 50, 52, 56, 57, 58, 60, 64, 70, 72, 78, 80, 84, 88, 90, 96, 100, 108, 112, 116, 120, 124, 128, 144, 150, 156, 160, 180, 200, 240, 280, 300, 320, 360, 400, 420, 460, 480, 500, 512, 520, 560, 600, 640, 700, 720, 750, 768, 780, 800, 840, 900, 920, 960, 1000, 1024]
        case .few:
            return [16, 24, 32, 44, 50, 64, 72, 88, 96, 100, 112, 120, 144, 150, 200, 256, 516, 768, 1024]
        }
    }
    
    /// 表示用文字列
    var name: String {
        switch self {
        case .full: return "1pxずつ"
        case .many: return "種類多め"
        case .few:  return "種類少なめ"
        }
    }
    
    /// 設定一覧表示用の配列
    static let items: [ImageSizeCandidate] = [.full, .many, .few]
}
