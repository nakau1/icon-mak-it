/**
 * Icon Make It
 * (c) NeroBlu All Rights Reserved.
 */
import UIKit
import NeroBlu

/// GoogleDriveフォルダ選択画面
class GoogleDriveViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var useButton: UIButton!
    
    fileprivate var adapter: GoogleDriveTableViewController!
    
    /// 自身のインスタンスを生成する
    /// - returns: 新しい自身のインスタンス
    class func show(_ viewController: UIViewController) {
        App.Google.DriveAPI.authorize(viewController) { state in
            if state.ok {
                let vc = GoogleDriveViewController.create()
                viewController.present(vc)
            }
        }
    }
 
    /// 自身のインスタンスを生成する
    /// - returns: 新しい自身のインスタンス
    class func create() -> UINavigationController {
        let vc = App.Storyboard("GoogleDrive").get(GoogleDriveViewController.self)
        let ret = UINavigationController(rootViewController: vc)
        return ret
    }
    
    // MARK: - ライフサイクル
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigationBar()
        self.setupTableView()
    }
    
    // MARK: - セットアップ
    
    /// テーブルビューのセットアップ
    private func setupTableView() {
        self.adapter = GoogleDriveTableViewController()
        self.adapter.setup(self.tableView)
    }
    
    /// ナビゲーションのセットアップ
    private func setupNavigationBar() {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .stop,
            target: self,
            action: #selector(didTapCloseButton)
        )
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(didTapAddButton)
        )
    }
    
    // MARK: - ボタンイベント
    
    /// 閉じるボタン
    func didTapCloseButton() {
        self.dismiss()
    }
    
    /// フォルダ追加ボタン
    func didTapAddButton() {
        
    }
    
    /// フォルダを使用するボタン
    @IBAction private func didTapUseButton() {
        
    }
}
