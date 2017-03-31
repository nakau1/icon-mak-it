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
        self.setupCollectionView()
        self.observeNotification(true)
    }
    
    deinit {
        self.observeNotification(false)
    }
    
    // MARK: - セットアップ
    
    /// コレクションビューのセットアップ
    private func setupCollectionView() {
        self.adapter = ListCollectionViewController(selectedHandler: { [unowned self] item in
            self.present(DetailViewController.create(item: item))
        })
        self.adapter!.setup(collectionView)
    }
    
    // MARK: - ボタンイベント
    
    /// テーマ変更ボタン押下時
    @IBAction private func didTapChangeThemeButton() {
        App.Config.Latest.listTheme = (App.Config.Latest.listTheme == .default) ? .saved : .default
        self.adapter!.reload()
    }
    
    /// 設定ボタン押下時
    @IBAction private func didTapSettingButton() {
        self.present(SettingViewController.create())
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
        self.adapter!.reload()
    }
    
    /// アイコンカラー変更時
    @objc private func didChangeIconColor() {
        self.adapter!.reload()
    }
    
    /// 背景色変更時
    @objc private func didChangeBackgroundColor() {
        self.adapter!.reload()
    }
}
