/**
 * Icon Make It
 * (c) NeroBlu All Rights Reserved.
 */
import UIKit
import NeroBlu

// MARK: - SettingViewController -

/// 設定画面コントローラ
class SettingViewController: UIViewController {
    
    @IBOutlet fileprivate weak var tableView: UITableView!
    
    fileprivate(set) var adapter: SettingTableViewController!
    
    /// 自身のインスタンスを生成する
    /// - returns: 新しい自身のインスタンス
    class func create() -> UINavigationController {
        let vc = App.Storyboard("Setting").get(SettingViewController.self)
        let ret = UINavigationController(rootViewController: vc)
        return ret
    }
    
    // MARK: - ライフサイクル
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigationBar()
        self.setupTableView()
        self.observeNotification(true)
    }
    
    deinit {
        self.observeNotification(false)
    }
    
    // MARK: - セットアップ
    
    /// テーブルビューのセットアップ
    private func setupTableView() {
        self.adapter = SettingTableViewController()
        self.adapter.setup(self.tableView)
    }
    
    /// ナビゲーションのセットアップ
    private func setupNavigationBar() {
        self.title = "Setting".localize()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .stop,
            target: self,
            action: #selector(didTapCloseButton)
        )
    }
    
    // MARK: - ボタンイベント
    
    /// 閉じるボタン
    func didTapCloseButton() {
        self.dismiss()
    }
    
    // MARK: - 通知イベント
    
    /// 通知監視の開始／停止
    private func observeNotification(_ start: Bool) {
        let items: [App.Notify.Item : String] = [
            .SelectEditPrefix : "didSelectEditPrefix",
            .SelectEditSuffix : "didSelectEditSuffix",
            .SelectGuide      : "didSelectGuide",
            .SelectLicence    : "didSelectLicence",
            ]
        if start {
            App.Notify.addItems(self, items)
        } else {
            App.Notify.removeItems(self, items.map { $0.key })
        }
    }
    
    /// プレフィックス編集選択時
    @objc fileprivate func didSelectEditPrefix() {
        self.push(FixesSettingViewController.create(fixMode: .prefix))
    }
    
    /// サフィックス編集選択時
    @objc fileprivate func didSelectEditSuffix() {
        self.push(FixesSettingViewController.create(fixMode: .suffix))
    }
    
    /// ガイド選択時
    @objc fileprivate func didSelectGuide() {
        print("didSelectGuide")
    }
    
    /// ライセンス選択時
    @objc fileprivate func didSelectLicence() {
        print("didSelectLicence")
    }
}

// MARK: - SettingTableViewController -

/// 設定画面テーブルビューコントローラ
class SettingTableViewController: NBTableViewController {
    
    let sections: [SettingSectionBehavable] = [
        SettingSectionIconFont(),
        SettingSectionGenerateSizes(),
        SettingSectionColor(),
        SettingSectionFileName(),
        SettingSectionIconImageStyle(),
        SettingSectionImageSizeCandidate(),
        SettingSectionGoogleDrive(),
        SettingSectionOther(),
        ]
    
    func reload() {
        self.tableView?.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.sections.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sections[section].items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let item = self.sections[indexPath.section].items[indexPath.row]
        
        cell.textLabel?.text = item.title
        cell.detailTextLabel?.text = item.subText
        cell.accessoryType = item.accessoryType
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        super.tableView(tableView, didSelectRowAt: indexPath)
        let section = self.sections[indexPath.section]
        section.didSelectItem(at: indexPath.row)
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.sections[section].title
    }
}

// MARK: - SettingItem -

/// 設定項目クラス
class SettingItem {
    
    /// タイトル
    var title: String
    
    /// サブテキスト
    var subText: String? = nil
    
    /// チェックされるかどうか
    var checked = false
    
    /// 詳細があるかどうか(チェックよりも優先)
    var chevroned = false
    
    /// イニシャライザ
    /// - parameter title: タイトル
    init(_ title: String) {
        self.title = title
    }
    
    /// アクセサリ種別
    var accessoryType: UITableViewCellAccessoryType {
        if self.chevroned {
            return .disclosureIndicator
        }
        return self.checked ? .checkmark : .none
    }
}

// MARK: - SettingSectionBehavable -

/// 設定セクションとして振る舞うプロトコル
protocol SettingSectionBehavable {
    
    /// セクションタイトル
    var title: String { get }
    
    /// 項目の配列
    var items: [SettingItem] { get }
    
    /// 項目が選択された時の処理
    /// - parameter index: インデックス
    func didSelectItem(at index: Int)
}

extension SettingSectionBehavable {
    
    var parent: SettingViewController! {
        return App.System.TopViewController as! SettingViewController
    }
}



