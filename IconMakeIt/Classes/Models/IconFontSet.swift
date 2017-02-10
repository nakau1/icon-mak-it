/**
 * Icon Make It
 * (c) NeroBlu All Rights Reserved.
 */
import UIKit
import NeroBlu

/// アイコンフォントセットとして振る舞うオブジェクトのインターフェイス
protocol IconFontSet {
    
    /// 使用するフォントを返却する
    /// - parameter size: フォントサイズ
    /// - returns: フォントオブジェクト
    func font(_ size: CGFloat) -> UIFont
    
    /// アイコンフォントセット名
    var name: String { get }
    
    /// アイコンフォント作成元のWEBページURL
    var linkURL: String { get }
    
    /// アイコンフォントのライセンス等についてのWEBページURL
    var licenceURL: String { get }
    
    /// セット内アイコンの配列
    var items: [IconFontItem] { get }
}

extension IconFontSet {
    
    /// 指定した設定でアイコンを画像化する
    /// - parameter text: アイコン文字
    /// - parameter iconColor: アイコン色
    /// - parameter backgroundColor: 背景色
    /// - parameter size: サイズ
    /// - parameter style: アイコン画像スタイル
    /// - returns: フォントオブジェクト
    func image(text: String, iconColor: UIColor, backgroundColor: UIColor, size: CGFloat, coefficient: CGFloat, style: IconImageStyle) -> UIImage {
        let scaled = size * coefficient
        let font   = self.font(scaled)
        let frame  = CGRect(x: 0, y: 0, width: scaled, height: scaled)
        
        UIGraphicsBeginImageContext(frame.size)
        
        switch style {
        case .background:      self.imageAddBackground(backgroundColor, frame)
        case .outline:         self.imageAddOutline(iconColor, frame, coefficient)
        case .circular:        self.imageAddCircular(backgroundColor, frame)
        case .circularOutline: self.imageAddCircularOutline(iconColor, frame, coefficient)
        default:break
        }
        
        let paragraphStyle = NSMutableParagraphStyle.default.mutableCopy() as! NSMutableParagraphStyle
        let attributes = [
            NSFontAttributeName:            font,
            NSForegroundColorAttributeName: iconColor,
            NSParagraphStyleAttributeName:  paragraphStyle,
            ]
        NSString(string: text).draw(in: frame, withAttributes: attributes)
        
        let ret = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return ret!
    }
    
    /// 画像(グラフィックコンテキスト)に背景を追加する
    /// - parameter backgroundColor: 背景色
    /// - parameter rect: 領域
    fileprivate func imageAddBackground(_ backgroundColor: UIColor, _ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        
        context?.setFillColor(backgroundColor.cgColor)
        context?.fill(rect)
    }
    
    /// 画像(グラフィックコンテキスト)に矩形枠線を追加する
    /// - parameter color: 枠線色
    /// - parameter rect: 領域
    /// - parameter coefficient: 係数
    fileprivate func imageAddOutline(_ color: UIColor, _ rect: CGRect, _ coefficient: CGFloat) {
        let context = UIGraphicsGetCurrentContext()
        
        let width = 1.0 * coefficient // 1.0 = border-width
        let x = rect.minX, y = rect.minY, w = rect.width, h = rect.height
        let frame = CGRect(x: x + (width / 2), y: y + (width / 2), width: w - width, height: h - width)
        context?.setStrokeColor(color.cgColor)
        context?.setLineWidth(width)
        context?.stroke(frame)
    }
    
    /// 画像(グラフィックコンテキスト)に塗りつぶしの円を追加する
    /// - parameter backgroundColor: 背景色
    /// - parameter rect: 領域
    fileprivate func imageAddCircular(_ backgroundColor: UIColor, _ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        
        context?.setFillColor(backgroundColor.cgColor)
        context?.fillEllipse(in: rect);
    }
    
    /// 画像(グラフィックコンテキスト)に円の枠線を追加する
    /// - parameter color: 枠線色
    /// - parameter rect: 領域
    /// - parameter coefficient: 係数
    fileprivate func imageAddCircularOutline(_ color: UIColor, _ rect: CGRect, _ coefficient: CGFloat) {
        let context = UIGraphicsGetCurrentContext()
        
        let width = 1.0 * coefficient
        let x = rect.minX, y = rect.minY, w = rect.width, h = rect.height
        let frame = CGRect(x: x + (width / 2), y: y + (width / 2), width: w - width, height: h - width)
        context?.setStrokeColor(color.cgColor)
        context?.setLineWidth(width)
        context?.strokeEllipse(in: frame)
    }
}
