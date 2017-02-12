/**
 * Icon Make It
 * (c) NeroBlu All Rights Reserved.
 */
import UIKit
import NeroBlu

// MARK: - FileNameConfig -

/// ファイル名設定の永続保存データクラス
class FileNameConfig: NBUserDefaults {
    
    /// 最後のファイル名を保存するかどうか
    dynamic var shouldUseLatest = false
    
    /// 最後に入力していたファイル名
    dynamic var latest = "sample"
}

// MARK: - App拡張 -
extension App.Config {
    
    /// ファイル名設定
    static let FileName = FileNameConfig()
}
