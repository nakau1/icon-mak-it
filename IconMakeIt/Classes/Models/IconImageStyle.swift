/**
 * Icon Make It
 * (c) NeroBlu All Rights Reserved.
 */
import UIKit
import NeroBlu

/// アイコン画像化のスタイル
enum IconImageStyle: Int {
    case plain
    case background
    case outline
    case circular
    case circularOutline
    
    /// 表示用文字列
    var name: String {
        switch self {
        case .plain:           return "アイコンのみ"
        case .background:      return "背景付き"
        case .outline:         return "枠線付き"
        case .circular:        return "円形背景付き"
        case .circularOutline: return "円形枠線付き"
        }
    }
    
    /// 設定一覧表示用の配列
    static let items: [IconImageStyle] = [.plain, .background, .outline, .circular, .circularOutline]
}
