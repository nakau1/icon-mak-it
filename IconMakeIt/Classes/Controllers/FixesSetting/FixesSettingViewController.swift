/**
 * Icon Make It
 * (c) NeroBlu All Rights Reserved.
 */
import UIKit
import NeroBlu

// MARK: - FixesSettingViewController -

/// プレフィックス/サフィックス編集画面
class FixesSettingViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet fileprivate weak var tableView: UITableView!
    @IBOutlet fileprivate weak var textField: UITextField!
    
    var fixMode: FixMode = .prefix
    
    private var adapter: FixesSettingTableViewController!
    
    /// 自身のインスタンスを生成する
    /// - parameter fixMode: モード
    /// - returns: 新しい自身のインスタンス
    class func create(fixMode: FixMode) -> FixesSettingViewController {
        let ret = App.Storyboard("FixesSetting").get(FixesSettingViewController.self)
        ret.fixMode = fixMode
        return ret
    }
    
    // MARK: - ライフサイクル
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
    }
    
    // MARK: - セットアップ
    
    /// テーブルビューのセットアップ
    private func setupTableView() {
        self.adapter = FixesSettingTableViewController(items: self.items) { [unowned self] items in
            self.items = items
        }
        self.adapter.setup(self.tableView)
    }
    
    // MARK: - プロパティ
    
    /// アイテム
    private var items: [String] {
        get {
            switch self.fixMode {
            case .prefix: return App.Config.Fixes.prefixes
            case .suffix: return App.Config.Fixes.suffixes
            }
        }
        set(v) {
            switch self.fixMode {
            case .prefix: App.Config.Fixes.prefixes = v
            case .suffix: App.Config.Fixes.suffixes = v
            }
        }
    }
    
    // MARK: - イベント
    
    /// 追加ボタン押下時
    @IBAction private func didTapAddButton() {
        let newItem = self.textField.text ?? ""
        self.adapter!.addItem(newItem)
    }
    
    // MARK: - UITextFieldDelegate
    
    // キーボードリターンキー押下時
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.didTapAddButton()
        textField.text = ""
        textField.resignFirstResponder()
        return true
    }
}
