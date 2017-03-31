/**
 * Icon Make It
 * (c) NeroBlu All Rights Reserved.
 */
import UIKit
import NeroBlu

// MARK: - ListCollectionViewCell -

/// 一覧画面コレクションビュー用のセル
class ListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var textLabel: UILabel!
    
    private var initialized = false
    
    /// セルの初期化(行っていなければ行う)
    func initialize() {
        if self.initialized { return }
        
        let v = UIView()
        v.backgroundColor = UIColor(red: 0.408, green: 0.757, blue: 0.992, alpha: 0.5)
        self.selectedBackgroundView = v
        
        self.initialized = true
    }
    
    /// 一覧のテーマ
    var listTheme: ListTheme = .default {
        didSet {
            self.backgroundColor     = self.listTheme.backgroundColor
            self.textLabel.textColor = self.listTheme.iconColor
        }
    }
    
    /// ラベルのテキスト
    var text: String {
        get    { return self.textLabel.text ?? "" }
        set(v) { self.textLabel.text = v }
    }
    
    /// ラベルのフォント
    var font: UIFont {
        get    { return self.textLabel.font }
        set(v) { self.textLabel.font = v }
    }
}
