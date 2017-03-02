/**
 * Icon Make It
 * (c) NeroBlu All Rights Reserved.
 */
import UIKit
import NeroBlu

/// 設定セクション: 生成する画像のサイズ種別
class SettingSectionGenerateSizes: SettingSectionBehavable {
    
    /// セクションタイトル
    var title: String {
        return "Generate Image Size".localize()
    }
    
    /// 項目の配列
    var items: [SettingItem] {
        return GenerateSizes.items.map {
            let ret = SettingItem($0.name)
            ret.checked = App.Config.Latest.generateSizes.contains($0)
            return ret
        }
    }
    
    /// 項目が選択された時の処理
    /// - parameter index: インデックス
    func didSelectItem(at index: Int) {
        let v = GenerateSizes.items[index]
        if App.Config.Latest.generateSizes.contains(v) {
            if let removed = App.Config.Latest.generateSizes.remove(v) {
                // 空にさせない
                if App.Config.Latest.generateSizes.rawValue <= 0 {
                    App.Config.Latest.generateSizes.insert(removed)
                }
            }
        } else {
            App.Config.Latest.generateSizes.insert(v)
        }
    }
}
