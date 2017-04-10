/**
 * Icon Make It
 * (c) NeroBlu All Rights Reserved.
 */
import UIKit
import NeroBlu

/// 設定セクション: ファイル名
class SettingSectionFileName: SettingSection {
    
    enum Row {
        case storeName
        case editPrefix
        case editSuffix
        
        var name: String {
            switch self {
            case .storeName:  return "Use latest file name".localize()
            case .editPrefix: return "Edit Prefixes".localize()
            case .editSuffix: return "Edit Sufiixes".localize()
            }
        }
        
        var item: SettingItem {
            let ret = SettingItem(self.name)
            
            switch self {
            case .storeName:  ret.checked = App.Config.Default.shouldUseLatestFileName
            case .editPrefix: ret.chevroned = true
            case .editSuffix: ret.chevroned = true
            }
            
            return ret
        }
        
        static let items: [Row] = [.storeName, .editPrefix, .editSuffix]
    }

    /// セクションタイトル
    override var title: String {
        return "File Name".localize()
    }
    
    /// 項目の配列
    override var items: [SettingItem] {
        return Row.items.map { $0.item }
    }
    
    /// 項目が選択された時の処理
    /// - parameter index: インデックス
    override func didSelectItem(at index: Int) {
        switch Row.items[index] {
        case .storeName:  let _ = App.Config.Default.shouldUseLatestFileName.reverse()
        case .editPrefix: App.Notify.post(to: .SelectEditPrefix)
        case .editSuffix: App.Notify.post(to: .SelectEditSuffix)
        }
    }
}
