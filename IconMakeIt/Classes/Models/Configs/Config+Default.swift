/**
 * Icon Make It
 * (c) NeroBlu All Rights Reserved.
 */
import UIKit
import NeroBlu

// MARK: - DefaultConfig -

/// 永続保存データクラス
class DefaultConfig: NBUserDefaults {
    
    /// 初回起動かどうか
    dynamic var isFirstLaunch = true
    
    /// 最後のファイル名を保存するかどうか
    dynamic var shouldUseLatestFileName = false
}

// MARK: - App拡張 -
extension App.Config {
    
    /// 設定
    static let `Default` = DefaultConfig()
}
