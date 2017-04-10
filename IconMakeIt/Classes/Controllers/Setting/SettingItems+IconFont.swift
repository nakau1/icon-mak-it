/**
 * Icon Make It
 * (c) NeroBlu All Rights Reserved.
 */
import UIKit
import NeroBlu

/// 設定セクション: 使用アイコンフォント
class SettingSectionIconFont: SettingSection {
    
    /// セクションタイトル
    override var title: String {
        return "Icon Font".localize()
    }
    
    /// 項目の配列
    override var items: [SettingItem] {
        return IconFont.items.map {
            let ret = SettingItem($0.rawValue)
            ret.checked = ($0 == App.Config.Latest.iconFont)
            return ret
        }
    }
    
    /// 項目が選択された時の処理
    /// - parameter index: インデックス
    override func didSelectItem(at index: Int) {
        App.Config.Latest.iconFont = IconFont.items[index]
        App.Notify.post(to: .ChangeIconFont)
    }
}
