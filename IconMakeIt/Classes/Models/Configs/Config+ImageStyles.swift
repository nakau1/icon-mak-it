/**
 * Icon Make It
 * (c) NeroBlu All Rights Reserved.
 */
import UIKit
import NeroBlu

// MARK: - FixesConfig -

/// プレフィックス/サフィックス設定の永続保存データクラス
class FixesConfig: NBUserDefaults {
    
    /// 最後に入力していたファイル名プレフィクス
    dynamic var latestPrefix = "btn_"
    
    /// プレフィクス
    dynamic var prefixes = ["btn_", "icon_", "tabicon_", "list_", "small_", "large_", "",]
    
    /// 最後に入力していたファイル名サフィックス
    dynamic var latestSuffix = ""
    
    /// サフィックス
    dynamic var suffixes = ["_on", "_off", "_dis", "_sel", "_left", "_right", "_top", "_bottom", "_hilighted", "_normal", "", ]
}

// MARK: - App拡張 -
extension App.Config {
    
    /// プレフィックス/サフィックス設定
    static let Fixes = FixesConfig()
}
