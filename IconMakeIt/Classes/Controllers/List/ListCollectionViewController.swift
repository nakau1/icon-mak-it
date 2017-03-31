/**
 * Icon Make It
 * (c) NeroBlu All Rights Reserved.
 */
import UIKit
import NeroBlu

// MARK: - ListCollectionViewController -

/// 一覧画面コレクションビューコントローラ
class ListCollectionViewController: NBCollectionViewController {
    
    typealias SelectedHandler = (IconFontItem) -> ()
    
    var selectedHandler : SelectedHandler!
    
    // MARK: - イニシャライザ
    
    /// イニシャライザ
    /// - parameter selectedHandler: 選択された時のハンドラ
    convenience init(selectedHandler : @escaping SelectedHandler) {
        self.init()
        self.selectedHandler = selectedHandler
    }
    
    // MARK: - パブリックメソッド
    
    /// リロードを実行する
    func reload() {
        self.collectionView?.backgroundColor = App.Config.Latest.listTheme.backgroundColor
        self.collectionView?.reloadData()
    }
    
    override func setup(_ collectionView: UICollectionView) {
        super.setup(collectionView)
        self.collectionView?.backgroundColor = App.Config.Latest.listTheme.backgroundColor
    }

    // MARK: -  UICollectionViewDelegateFlowLayout, UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.iconFontItems.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ListCollectionViewCell
        
        cell.initialize()
        cell.listTheme = App.Config.Latest.listTheme
        cell.font = self.iconFont.set.font(64.f)
        cell.text = self.iconFontItems[indexPath.row].text
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        super.collectionView(collectionView, didSelectItemAt: indexPath)
        self.selectedHandler(self.iconFontItems[indexPath.row])
    }
    
    // MARK: - プライベートプロパティ
    
    private var iconFont: IconFont {
        return App.Config.Latest.iconFont
    }
    
    private var iconFontItems: [IconFontItem] {
        return self.iconFont.set.items
    }
}
