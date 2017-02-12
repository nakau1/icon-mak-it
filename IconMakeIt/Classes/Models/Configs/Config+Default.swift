/**
 * Icon Make It
 * (c) NeroBlu All Rights Reserved.
 */
import UIKit
import NeroBlu

// MARK: - DefaultConfig -

/// 永続保存データクラス
class DefaultConfig: NBUserDefaults {
    
    /// 最後に入力していた画像サイズ
    dynamic var latestImageSize = 44
    
    /// 初回起動かどうか
    dynamic var isFirstLaunch = true
}

// MARK: - App拡張 -
extension App.Config {
    
    /// 設定
    static let `Default` = DefaultConfig()
}
