/**
 * Icon Make It
 * (c) NeroBlu All Rights Reserved.
 */
import UIKit
import NeroBlu

/// 設定セクション: 色
class SettingSectionColor: SettingSectionBehavable {
    
    enum Row {
        case clearHistories
        case defaultIconColor
        case defaultBackgroundColor
        
        var name: String {
            switch self {
            case .clearHistories:         return "Clear color histories".localize()
            case .defaultIconColor:       return "Icon color to default".localize()
            case .defaultBackgroundColor: return "Background color to default".localize()
            }
        }
                
        static let items: [Row] = [.clearHistories, .defaultIconColor, .defaultBackgroundColor]
    }
    
    /// セクションタイトル
    var title: String {
        return "Color".localize()
    }
    
    /// 項目の配列
    var items: [SettingItem] {
        return Row.items.map { SettingItem($0.name) }
    }
    
    /// 項目が選択された時の処理
    /// - parameter index: インデックス
    func didSelectItem(at index: Int) {
        guard let vc = App.System.TopViewController else { return }
        
        switch Row.items[index] {
        case .clearHistories:
            NBAlert.show(OKBack: vc, message: "Do you clear color histories?".localize()) {
                App.Config.Color.clear()
                App.Notify.post(to: .UpdateColorHistories)
                NBAlert.show(OK: vc, message: "Cleared!".localize())
            }
        case .defaultIconColor:
            NBAlert.show(OKBack: vc, message: "Do you change icon color to default?".localize()) {
                App.Config.ThemeColor.iconColor = App.Color.DefaultIconColor
                App.Notify.post(to: .ChangeIconColor)
                NBAlert.show(OK: vc, message: "Cleared!".localize())
            }
        case .defaultBackgroundColor:
            NBAlert.show(OKBack: vc, message: "Do you change background color to default?".localize()) {
                App.Config.ThemeColor.backgroundColor = App.Color.DefaultBackgroundColor
                App.Notify.post(to: .ChangeBackgroundColor)
                NBAlert.show(OK: vc, message: "Changed!".localize())
            }
        }
    }
}
