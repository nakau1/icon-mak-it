/**
 * Icon Make It
 * (c) NeroBlu All Rights Reserved.
 */
import UIKit
import NeroBlu

// MARK: - ThemeColorConfigRaw -
fileprivate class ThemeColorConfigRaw: NBUserDefaults {
    
    dynamic var iconColor: Int = App.Color.DefaultIconColor.rgb
    
    dynamic var backgroundColor: Int = App.Color.DefaultBackgroundColor.rgb
}

// MARK: - ThemeColorConfig -

/// テーマカラー設定の永続保存データクラス
class ThemeColorConfig {
    
    private let raw = ThemeColorConfigRaw()
    
    /// アイコン色
    var iconColor: UIColor {
        get    { return UIColor(rgb: self.raw.iconColor) }
        set(v) { self.raw.iconColor = v.rgb}
    }
    
    /// 背景色
    var backgroundColor: UIColor {
        get    { return UIColor(rgb: self.raw.backgroundColor) }
        set(v) { self.raw.backgroundColor = v.rgb}
    }
}

// MARK: - App拡張 -
extension App.Config {
    
    /// テーマカラー設定
    static let ThemeColor = ThemeColorConfig()
}
