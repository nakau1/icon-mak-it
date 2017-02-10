/**
 * Icon Make It
 * (c) NeroBlu All Rights Reserved.
 */
import UIKit
import NeroBlu

/// アイコンフォント1文字分の情報クラス
class IconFontItem {
    
    /// アイコン文字
    var text: String
    
    /// アイコンの名前(主にファイル名に使用する)
    var name: String
    
    init(text: String, name: String) {
        self.text = text
        self.name = name
    }
}
