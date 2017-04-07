/**
 * Icon Make It
 * (c) NeroBlu All Rights Reserved.
 */
import UIKit
import NeroBlu

// MARK: - GoogleDriveConfig -

/// GoogleDrive設定の永続保存データクラス
class GoogleDriveConfig: NBUserDefaults {
    
    /// 最後に使用したフォルダのID
    dynamic var latestFolderID = ""
    
    /// 最後に使用したフォルダ名
    dynamic var latestFolderName = ""
    
    /// 保存ごとにGoogleDriveのフォルダを選択させるかどうか
    dynamic var shouldSelectGoogleDriveFolder = true
}

// MARK: - App拡張 -
extension App.Config {
    
    /// GoogleDrive設定
    static let GoogleDrive = GoogleDriveConfig()
}
