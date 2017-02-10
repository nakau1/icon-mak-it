/**
 * Icon Make It
 * (c) NeroBlu All Rights Reserved.
 */
import UIKit
import NeroBlu

/// 生成する画像のサイズ種別
struct GenerateSizes: OptionSet {
    
    static let At1x = GenerateSizes(rawValue: 0x1 << 0)
    static let At2x = GenerateSizes(rawValue: 0x1 << 1)
    static let At3x = GenerateSizes(rawValue: 0x1 << 2)
    
    /// 設定一覧表示用の配列
    static let items = [At1x, At2x, At3x]
    
    /// すべてを設定ONにした時のrawValue
    static var fullRawValue: Int { return self.items.reduce(0) { n, item in n + item.rawValue } }
    
    /// 表示名
    var name: String {
        switch self.rawValue {
        case GenerateSizes.At1x.rawValue: return "等倍"
        case GenerateSizes.At2x.rawValue: return "解像度2倍用(@2x)"
        case GenerateSizes.At3x.rawValue: return "解像度3倍用(@3x)"
        default: return ""
        }
    }
    
    /// ファイル名の後置語
    var fileSuffix: String {
        switch self.rawValue {
        case GenerateSizes.At1x.rawValue: return ""
        case GenerateSizes.At2x.rawValue: return "@2x"
        case GenerateSizes.At3x.rawValue: return "@3x"
        default: return ""
        }
    }
    
    /// ファイルサイズ計算時の係数
    var coefficient: Int {
        switch self.rawValue {
        case GenerateSizes.At1x.rawValue: return 1
        case GenerateSizes.At2x.rawValue: return 2
        case GenerateSizes.At3x.rawValue: return 3
        default: return 1 // dead-code
        }
    }
    
    /// 設定値をあらわすitemsに対するインデックスの配列
    var indecies: [Int] {
        var ret = [Int]()
        for (i, item) in GenerateSizes.items.enumerated() {
            if self.contains(item) {
                ret.append(i)
            }
        }
        return ret
    }
    
    let rawValue : Int
    init(rawValue: Int) { self.rawValue = rawValue }
    
    init(indecies: [Int]) {
        self.rawValue = indecies.reduce(0) { n, index in n + GenerateSizes.items[index].rawValue }
    }
}

