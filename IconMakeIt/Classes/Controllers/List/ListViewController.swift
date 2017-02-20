/**
 * Icon Make It
 * (c) NeroBlu All Rights Reserved.
 */
import UIKit
import NeroBlu

// MARK: - ListViewController -

/// 一覧画面コントローラ
class ListViewController: UIViewController {
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    private var adapter: ListCollectionViewController?
    
    // MARK: - インスタンス生成
    
    /// 自身のインスタンスを生成する
    /// - returns: 新しい自身のインスタンス
    class func create() -> ListViewController {
        let ret = App.Storyboard("List").get(ListViewController.self)
        return ret
    }
    
    // MARK: - ライフサイクル
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.adapter = ListCollectionViewController(selectedHandler: { [unowned self] item in
            self.present(DetailViewController.create(item: item))
        })
        self.adapter!.setup(collectionView)
        self.observeNotification(true)
    }
    
    deinit {
        self.observeNotification(false)
    }
    
    // MARK: - ボタンイベント
    
    /// テーマ変更ボタン押下時
    @IBAction private func didTapChangeThemeButton() {
        App.Config.Latest.listTheme = (App.Config.Latest.listTheme == .default) ? .saved : .default
        self.adapter!.reload()
    }
    
    /// 設定ボタン押下時
    @IBAction private func didTapSettingButton() {
        
    }
    
    // MARK: - 通知イベント
    
    /// 通知監視の開始／停止
    private func observeNotification(_ start: Bool) {
        let items: [App.Notify.Item : String] = [
            .ChangeIconFont        : "didChangeIconFont",
            .ChangeIconColor       : "didChangeIconColor",
            .ChangeBackgroundColor : "didChangeBackgroundColor",
            ]
        if start {
            App.Notify.addItems(self, items)
        } else {
            App.Notify.removeItems(self, items.map { $0.key })
        }
    }
    
    /// アイコンフォント変更時
    @objc private func didChangeIconFont() {
//        self.iconFont = App.Config.iconFont
//        self.reload()
    }
    
    /// アイコンカラー変更時
    @objc private func didChangeIconColor() {
        
    }
    
    /// 背景色変更時
    @objc private func didChangeBackgroundColor() {
        
    }
}

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
