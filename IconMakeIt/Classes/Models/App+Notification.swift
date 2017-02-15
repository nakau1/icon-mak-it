/**
 * Icon Make It
 * (c) NeroBlu All Rights Reserved.
 */
import UIKit
import NeroBlu

extension App.Notify {
    
    /// 通知アイテム
    enum Item: String {
        case ChangeIconFont
        case ChangeIconColor
        case ChangeBackgroundColor
        case UpdateColorHistories
        case ChangeGoogleAccount
        case ChangeImageSizeCandidate
    }
    
    /// 通知監視の追加
    /// - parameter observer: 監視するオブジェクト
    /// - parameter notifications: 追加する[通知種別: 通知時に実行するセレクタの文字列]形式の辞書
    static func addItems(_ observer: Any, _ notifications: [App.Notify.Item : String]) {
        for (item, selectorName) in notifications {
            self.add(observer, selectorName, item.rawValue)
        }
    }
    
    /// 通知監視の削除
    /// - parameter observer: 監視するオブジェクト
    /// - parameter notifications: 削除する通知種別の配列
    static func removeItems(_ observer: Any, _ notifications: [App.Notify.Item]) {
        for item in notifications {
            self.remove(observer, item.rawValue)
        }
    }
}
