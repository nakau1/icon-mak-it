/**
 * Icon Make It
 * (c) NeroBlu All Rights Reserved.
 */
import UIKit
import NeroBlu

/// 設定セクション: アイコン画像化のスタイル
class SettingSectionIconImageStyle: SettingSectionBehavable {
    
    /// セクションタイトル
    var title: String {
        return "Icon Style".localize()
    }
    
    /// 項目の配列
    var items: [SettingItem] {
        return IconImageStyle.items.map {
            let ret = SettingItem($0.name)
            ret.checked = ($0 == App.Config.Latest.iconImageStyle)
            return ret
        }
    }
    
    /// 項目が選択された時の処理
    /// - parameter index: インデックス
    func didSelectItem(at index: Int) {
        App.Config.Latest.iconImageStyle = IconImageStyle.items[index]
    }
}
