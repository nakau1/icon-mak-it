/**
 * Icon Make It
 * (c) NeroBlu All Rights Reserved.
 */
import UIKit
import NeroBlu

enum IconFont {
    case GoogleMaterialDesign
    case Genericons
    case FoundationIcons
    case WebHostingHubGlyphs
    case FontAwasome
    case LigatureSymbols
    case Typicons
    
    /// アイコンフォントセット
    var set: IconFontSet {
        switch self {
        case .GoogleMaterialDesign: return IconFontSetGoogleMaterialDesign()
        case .Genericons:           return IconFontSetGenericons()
        case .FoundationIcons:      return IconFontSetFoundationIcons()
        case .WebHostingHubGlyphs:  return IconFontSetWebHostingHubGlyphs()
        case .FontAwasome:          return IconFontSetFontAwasome()
        case .LigatureSymbols:      return IconFontSetLigatureSymbols()
        case .Typicons:             return IconFontSetTypicons()
        }
    }
    
    /// アプリで使用可能なアイコンフォントの一覧用配列
    static let items: [IconFont] = [
        .GoogleMaterialDesign,
        .Genericons,
        .FoundationIcons,
        .WebHostingHubGlyphs,
        .FontAwasome,
        .LigatureSymbols,
        .Typicons
    ]
}
