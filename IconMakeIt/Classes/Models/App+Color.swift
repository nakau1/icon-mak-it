/**
 * Icon Make It
 * (c) NeroBlu All Rights Reserved.
 */
import UIKit
import NeroBlu

extension App {
    
    /// 色定義
    class Color {
        
        static let DefaultIconColor       = UIColor(rgb: 0x444444)
        static let DefaultBackgroundColor = UIColor(rgb: 0xF1F9F9)
        static let PositiveButtonColor    = UIColor(rgb: 0x63A56C)
        static let DisabledButtonColor    = UIColor(rgb: 0xCCCCCC)
        static let ListSelectionColor     = UIColor(rgb: 0x68c1fd)
        
        let rawValue: Int
        init(_ rawValue: Int) { self.rawValue = rawValue }
    }
}
