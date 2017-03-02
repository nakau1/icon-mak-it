/**
 * Icon Make It
 * (c) NeroBlu All Rights Reserved.
 */
import UIKit
import NeroBlu

/// 設定セクション: 使用アイコンフォント
class SettingSectionIconFont: SettingSectionBehavable {
    
    /// セクションタイトル
    var title: String {
        return "Icon Font".localize()
    }
    
    /// 項目の配列
    var items: [SettingItem] {
        return IconFont.items.map {
            let ret = SettingItem($0.rawValue)
            ret.checked = ($0 == App.Config.Latest.iconFont)
            return ret
        }
    }
    
    /// 項目が選択された時の処理
    /// - parameter index: インデックス
    func didSelectItem(at index: Int) {
        App.Config.Latest.iconFont = IconFont.items[index]
        App.Notify.post(to: .ChangeIconFont)
    }
}
