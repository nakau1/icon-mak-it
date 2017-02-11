/**
 * Icon Make It
 * (c) NeroBlu All Rights Reserved.
 */
import UIKit
import NeroBlu

// MARK: - ColorConfig -

/// 色設定の永続保存データクラス
class ColorConfig: NBUserDefaults {
    
    /// 色の履歴
    dynamic var rgbHistories = [Int]()
    
    var histories: [UIColor] {
        return self.rgbHistories.map { rgb in
            return UIColor(rgb: rgb)
        }
    }
    
    /// 色の履歴を全削除(クリア)する
    func clear() {
        self.rgbHistories = []
    }
    
    /// 色の履歴に色を追加する
    /// - parameter color: 追加する色
    func add(_ color: UIColor) {
        let rgb = color.rgb
        if let index = self.rgbHistories.index(of: rgb) {
            self.rgbHistories.remove(at: index)
        }
        self.rgbHistories.insert(rgb, at: 0)
    }
}

// MARK: - App拡張 -
extension App.Config {
    
    static let Color = ColorConfig()
}
