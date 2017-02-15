/**
 * Icon Make It
 * (c) NeroBlu All Rights Reserved.
 */
import UIKit
import NeroBlu

/// 一覧画面のテーマ
enum ListTheme: Int {
    case `default`
    case saved
    
    /// アイコンの色
    var iconColor: UIColor {
        switch self {
        case .default: return App.Color.DefaultIconColor
        case .saved:   return App.Config.ThemeColor.iconColor
        }
    }
    
    /// 背景色
    var backgroundColor: UIColor {
        switch self {
        case .default: return App.Color.DefaultBackgroundColor
        case .saved:   return App.Config.ThemeColor.backgroundColor
        }
    }
}
