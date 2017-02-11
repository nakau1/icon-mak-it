/**
 * Icon Make It
 * (c) NeroBlu All Rights Reserved.
 */
import UIKit
import NeroBlu

// MARK: - IconFontConfig -

/// アイコンフォント設定の永続保存データクラス
class IconFontConfig: NBUserDefaults {
    
    /// 保存値
    dynamic var rawValue: String = IconFont.GoogleMaterialDesign.rawValue
    
    /// 現在選択中のアイコンセット
    var current: IconFont {
        get    { return IconFont(rawValue: self.rawValue)! }
        set(v) { self.rawValue = v.rawValue}
    }
    
    /// 現在選択中のアイコンセット
    var index: Int {
        return IconFont.items.index(of: self.current) ?? -1
    }
}

// MARK: - App拡張 -
extension App.Config {
    
    /// アイコンフォント設定
    static let IconFont = IconFontConfig()
}
