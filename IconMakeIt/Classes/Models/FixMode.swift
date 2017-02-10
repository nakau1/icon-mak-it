/**
 * Icon Make It
 * (c) NeroBlu All Rights Reserved.
 */
import UIKit
import NeroBlu

/// プレフィクス/サフィックス
enum FixMode: Int {
    case prefix
    case suffix
    
    /// タイトル文字列
    var title: String {
        switch self {
        case .prefix: return "プレフィクス"
        case .suffix: return "サフィックス"
        }
    }
    
    /// 最後に使用した文字列
    var latest: String {
        return ""
//        switch self {
//        case .prefix: return App.Config.latestPrefix
//        case .suffix: return App.Config.latestSuffix
//        }
    }
    
    /// 設定に保存された文字列配列
    var items: [String] {
        get {
            return []
//            switch self {
//            case .prefix: return App.Config.prefixes
//            case .suffix: return App.Config.suffixes
//            }
        }
        set(v) {
//            switch self {
//            case .prefix: App.Config.prefixes = v
//            case .suffix: App.Config.suffixes = v
//            }
        }
    }
}
