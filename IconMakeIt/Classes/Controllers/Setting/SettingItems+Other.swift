/**
 * Icon Make It
 * (c) NeroBlu All Rights Reserved.
 */
import UIKit
import NeroBlu

/// 設定セクション: その他
class SettingSectionOther: SettingSectionBehavable {
    
    enum Row {
        case guide
        case licence
        
        var name: String {
            switch self {
            case .guide:   return "Guide".localize()
            case .licence: return "Licence".localize()
            }
        }
        
        static let items: [Row] = [.guide, .licence]
    }

    /// セクションタイトル
    var title: String { return "" }
    
    /// 項目の配列
    var items: [SettingItem] {
        return Row.items.map {
            let ret = SettingItem($0.name)
            ret.chevroned = true
            return ret
        }
    }
    
    /// 項目が選択された時の処理
    /// - parameter index: インデックス
    func didSelectItem(at index: Int) {
        switch Row.items[index] {
        case .guide:   App.Notify.post(to: .SelectGuide)
        case .licence: App.Notify.post(to: .SelectLicence)
        }
    }
}
