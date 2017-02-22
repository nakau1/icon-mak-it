/**
 * Icon Make It
 * (c) NeroBlu All Rights Reserved.
 */
import UIKit
import NeroBlu

// MARK: - DetailColorCollectionViewController -

/// 詳細画面・色コレクションビューコントローラ
class DetailColorCollectionViewController: NBCollectionViewController {
    
    typealias SelectHandler = (UIColor) -> Void
    
    /// 選択時ハンドラ
    fileprivate var selectHandler: SelectHandler!
    
    /// カラー設定のセグメント種別
    var colorSegment: ColorSegment = .history {
        didSet {
            if let v = self.collectionView {
                v.reloadData()
            }
        }
    }
    
    // MARK: イニシャライザ
    
    /// イニシャライザ
    /// - parameter colorSegment: カラー設定のセグメント種別
    /// - parameter selected: 選択時ハンドラ
    convenience init(colorSegment: ColorSegment, selected: @escaping SelectHandler) {
        self.init()
        self.colorSegment = colorSegment
        self.selectHandler = selected
    }
    
    // MARK: UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.colors.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = self.colors[indexPath.row]
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectHandler(self.colors[indexPath.row])
    }
    
    private var colors: [UIColor] {
        switch self.colorSegment {
        case .history: return App.Config.Color.histories
        case .preset:  return App.Color.presets
        }
    }
}
