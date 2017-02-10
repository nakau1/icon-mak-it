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
        return UIColor.blue
//        switch self {
//        case .default: return App.Color.DefaultIconColor.color()
//        case .saved:   return App.Config.iconColor
//        }
    }
    
    /// 背景色
    var backgroundColor: UIColor {
        return UIColor.red
//        switch self {
//        case .default: return App.Color.DefaultBackgroundColor.color()
//        case .saved:   return App.Config.backgroundColor
//        }
    }
}
