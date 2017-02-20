/**
 * Icon Make It
 * (c) NeroBlu All Rights Reserved.
 */
import UIKit
import NeroBlu

// MARK: - LatestConfigRaw -
fileprivate class LatestConfigRaw: NBUserDefaults {
    
    dynamic var iconFont: String = IconFont.GoogleMaterialDesign.rawValue
    
    dynamic var colorSegment: Int = ColorSegment.history.rawValue
    
    dynamic var colorChangeTarget: Int = ColorChangeTarget.icon.rawValue
    
    dynamic var generateSizes: Int = GenerateSizes.fullRawValue
    
    dynamic var iconImageStyle: Int = IconImageStyle.plain.rawValue
    
    dynamic var listTheme: Int = ListTheme.saved.rawValue
    
    dynamic var imageSizeCandidate: Int = ImageSizeCandidate.many.rawValue
    
    dynamic var prefix = "btn_"
    
    dynamic var suffix = ""
    
    dynamic var fileName = ""
}

// MARK: - LatestConfig -

/// 最終選択値保存データクラス
class LatestConfig {
    
    private let raw = LatestConfigRaw()
    
    /// アイコンセット
    var iconFont: IconFont {
        get    { return IconFont(rawValue: self.raw.iconFont)! }
        set(v) { self.raw.iconFont = v.rawValue}
    }
    
    /// アイコンセットの配列上のインデックス(設定画面用)
    var iconFontIndex: Int {
        return IconFont.items.index(of: self.iconFont) ?? -1
    }
    
    /// カラー設定のセグメント
    var colorSegment: ColorSegment {
        get    { return ColorSegment(rawValue: self.raw.colorSegment)! }
        set(v) { self.raw.colorSegment = v.rawValue}
    }
    
    /// 生成する画像のサイズ種別
    var generateSizes: GenerateSizes {
        get    { return GenerateSizes(rawValue: self.raw.generateSizes) }
        set(v) { self.raw.generateSizes = v.rawValue}
    }
    
    /// 生成する画像のスタイル
    var iconImageStyle: IconImageStyle {
        get    { return IconImageStyle(rawValue: self.raw.iconImageStyle)! }
        set(v) { self.raw.iconImageStyle = v.rawValue}
    }

    /// 一覧画面のテーマ
    var listTheme: ListTheme {
        get    { return ListTheme(rawValue: self.raw.listTheme)! }
        set(v) { self.raw.listTheme = v.rawValue}
    }
    
    /// 画像サイズ候補配列の種別
    var imageSizeCandidate: ImageSizeCandidate {
        get    { return ImageSizeCandidate(rawValue: self.raw.imageSizeCandidate)! }
        set(v) { self.raw.imageSizeCandidate = v.rawValue}
    }
    
    /// プレフィックス
    var prefix: String {
        get    { return self.raw.prefix }
        set(v) { self.raw.prefix = v}
    }
    
    /// サフィックス
    var suffix: String {
        get    { return self.raw.suffix }
        set(v) { self.raw.suffix = v}
    }
    
    /// ファイル名
    var fileName: String {
        get    { return self.raw.fileName }
        set(v) { self.raw.fileName = v}
    }
}

// MARK: - App拡張 -
extension App.Config {
    
    /// 最終選択値設定
    static let Latest = LatestConfig()
}
