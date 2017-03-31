/**
 * Icon Make It
 * (c) NeroBlu All Rights Reserved.
 */
import UIKit
import NeroBlu

/// 画像生成クラス
class ImageGenerator {
    
    let outlineWidth = 1.f
    
    let iconFontSet:     IconFontSet
    let iconColor:       UIColor
    let backgroundColor: UIColor
    let size:            CGFloat
    let style:           IconImageStyle
    
    // MARK: パブリック
    
    /// イニシャライザ
    /// - parameter iconFontSet: アイコン文字
    /// - parameter iconColor: アイコン色
    /// - parameter backgroundColor: 背景色
    /// - parameter size: サイズ
    /// - parameter style: アイコン画像スタイル
    init(iconFontSet: IconFontSet, iconColor: UIColor, backgroundColor: UIColor, size: CGFloat, style: IconImageStyle) {
        self.iconFontSet     = iconFontSet
        self.iconColor       = iconColor
        self.backgroundColor = backgroundColor
        self.size            = size
        self.style           = style
    }
    
    /// 生成を実行する
    /// - parameter text: アイコン文字
    /// - parameter fileName: オリジナルのファイル名
    /// - parameter sizes: 生成するアイコンのサイズの種類
    /// - returns: ファイル名と画像データのディクショナリ
    func generate(text: String, fileName: String, sizes: GenerateSizes) -> [String: UIImage] {
        var ret = [String: UIImage]()
        for i in App.Config.Latest.generateSizes.indecies {
            let generateSize = GenerateSizes.items[i]
            let name = "\(fileName)\(generateSize.fileSuffix)"
            let image = self.generateImage(text: text, coefficient: generateSize.coefficient.f)
            ret[name] = image
        }
        return ret
    }
    
    // MARK: プライベート
    
    /// 指定した設定でアイコンを画像化する
    /// - parameter text: アイコン文字
    /// - parameter coefficient: アイコン色
    /// - returns: 画像データ
    private func generateImage(text: String, coefficient: CGFloat) -> UIImage {
        let scaled = self.size * coefficient
        let font = self.iconFontSet.font(scaled)
        let frame = cr(scaled, scaled)
        
        UIGraphicsBeginImageContext(frame.size)
        if let context = UIGraphicsGetCurrentContext() {
            switch self.style {
            case .plain: break
            case .background:      self.addFill(to: context, frame, backgroundColor: self.backgroundColor)
            case .outline:         self.addOutline(to: context, frame, iconColor: self.iconColor, coefficient: coefficient)
            case .circular:        self.addCircularFill(to: context, frame, backgroundColor: self.backgroundColor)
            case .circularOutline: self.addCircularOutline(to: context, frame, iconColor: self.iconColor, coefficient: coefficient)
            }
        }
        
        let paragraphStyle = NSMutableParagraphStyle.default.mutableCopy() as! NSMutableParagraphStyle
        let attributes = [
            NSFontAttributeName:            font,
            NSForegroundColorAttributeName: self.iconColor,
            NSParagraphStyleAttributeName:  paragraphStyle,
            ]
        NSString(string: text).draw(in: frame, withAttributes: attributes)
        
        let ret = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return ret!
    }
    
    /// コンテキストに背景色埋めを追加
    /// - parameter context: コンテキスト
    /// - parameter f: 矩形座標
    /// - parameter backgroundColor: 背景色
    private func addFill(to context: CGContext, _ f: CGRect, backgroundColor: UIColor) {
        context.setFillColor(backgroundColor.cgColor)
        context.fill(f)
    }
    
    /// コンテキストに矩形のアウトラインを追加
    /// - parameter context: コンテキスト
    /// - parameter f: 矩形座標
    /// - parameter iconColor: アイコン色
    /// - parameter coefficient: 係数
    private func addOutline(to context: CGContext, _ f: CGRect, iconColor: UIColor, coefficient: CGFloat) {
        let outline = self.outlineWidth * coefficient
        let frame = cr(f.x + (outline / 2), f.y + (outline / 2), f.w - outline, f.h - outline)
        context.setStrokeColor(iconColor.cgColor)
        context.setLineWidth(outline)
        context.stroke(frame)
    }
    
    /// コンテキストに円形の背景色埋めを追加
    /// - parameter context: コンテキスト
    /// - parameter f: 矩形座標
    /// - parameter backgroundColor: 背景色
    private func addCircularFill(to context: CGContext, _ f: CGRect, backgroundColor: UIColor) {
        context.setFillColor(backgroundColor.cgColor)
        context.fillEllipse(in: f);
    }
    
    /// コンテキストに円形のアウトラインを追加
    /// - parameter context: コンテキスト
    /// - parameter f: 矩形座標
    /// - parameter iconColor: アイコン色
    /// - parameter coefficient: 係数
    private func addCircularOutline(to context: CGContext, _ f: CGRect, iconColor: UIColor, coefficient: CGFloat) {
        let outline = self.outlineWidth * coefficient
        let frame = cr(f.x + (outline / 2), f.y + (outline / 2), f.w - outline, f.h - outline)
        context.setStrokeColor(iconColor.cgColor)
        context.setLineWidth(outline)
        context.strokeEllipse(in: frame)
    }
}
