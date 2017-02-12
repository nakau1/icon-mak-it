/**
 * Icon Make It
 * (c) NeroBlu All Rights Reserved.
 */
import UIKit
import NeroBlu

// MARK: - ColorConfigRaw -
fileprivate class ColorConfigRaw: NBUserDefaults {
    
    /// 色の履歴(RGB値)
    dynamic var rgbHistories = [Int]()
}

// MARK: - ColorConfig -

/// 色設定の永続保存データクラス
class ColorConfig {
    
    private let raw = ColorConfigRaw()
    
    /// 色の履歴
    var histories: [UIColor] {
        return self.raw.rgbHistories.map { rgb in
            return UIColor(rgb: rgb)
        }
    }
    
    /// 色の履歴を全削除(クリア)する
    func clear() {
        self.raw.rgbHistories = []
    }
    
    /// 色の履歴に色を追加する
    /// - parameter color: 追加する色
    func add(_ color: UIColor) {
        let rgb = color.rgb
        if let index = self.raw.rgbHistories.index(of: rgb) {
            self.raw.rgbHistories.remove(at: index)
        }
        self.raw.rgbHistories.insert(rgb, at: 0)
    }
}

// MARK: - App拡張 -
extension App.Config {
    
    /// 色履歴設定
    static let Color = ColorConfig()
}
