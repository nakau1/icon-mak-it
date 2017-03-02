/**
 * Icon Make It
 * (c) NeroBlu All Rights Reserved.
 */
import UIKit
import NeroBlu

/// 設定セクション: 画像サイズ候補配列の種別
class SettingSectionImageSizeCandidate: SettingSectionBehavable {
    
    /// セクションタイトル
    var title: String {
        return "Size Slider".localize()
    }
    
    /// 項目の配列
    var items: [SettingItem] {
        return ImageSizeCandidate.items.map {
            let ret = SettingItem($0.name)
            ret.checked = ($0 == App.Config.Latest.imageSizeCandidate)
            return ret
        }
    }
    
    /// 項目が選択された時の処理
    /// - parameter index: インデックス
    func didSelectItem(at index: Int) {
        App.Config.Latest.imageSizeCandidate = ImageSizeCandidate.items[index]
    }
}
