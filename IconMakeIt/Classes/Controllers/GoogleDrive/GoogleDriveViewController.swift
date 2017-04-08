/**
 * Icon Make It
 * (c) NeroBlu All Rights Reserved.
 */
import UIKit
import NeroBlu
import GoogleAPIClient

/// GoogleDriveフォルダ選択画面
class GoogleDriveViewController: UIViewController, UIGestureRecognizerDelegate {
    
    typealias SelectedHandler = (String, String) -> () // folderName, folderID
    
    private var selectedHandler : SelectedHandler!
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var useButton: UIButton!
    
    private var adapter: GoogleDriveTableViewController!
    
    private var currentFolder: GTLDriveFile?
    
    /// 自身のインスタンスを生成する
    /// - parameter viewController: ビューコントローラ
    /// - parameter selected: 選択時のコールバック
    class func show(_ viewController: UIViewController, selected: @escaping SelectedHandler) {
        App.Google.DriveAPI.authorize(viewController) { state in
            if state.ok {
                let vc = GoogleDriveViewController.create(selected: selected)
                viewController.present(vc)
            }
        }
    }
 
    /// 自身のインスタンスを生成する
    /// - parameter selected: 選択時のコールバック
    /// - returns: 新しい自身のインスタンス
    class func create(selected: @escaping SelectedHandler) -> UINavigationController {
        let vc = self.create(folder: nil)
        let ret = UINavigationController(rootViewController: vc)
        vc.navigationController?.interactivePopGestureRecognizer?.delegate = vc
        return ret
    }
    
    /// 自身のインスタンスを生成する
    /// - returns: 新しい自身のインスタンス
    private class func create(folder: GTLDriveFile?) -> GoogleDriveViewController {
        let ret = App.Storyboard("GoogleDrive").get(GoogleDriveViewController.self)
        ret.currentFolder = folder
        return ret
    }
    
    // MARK: - ライフサイクル
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = self.currentFolder?.name
        self.setupNavigationBar()
        self.setupTableView()
        self.enabledUseButton = false
        self.observeNotification(true)
    }
    
    deinit {
        self.observeNotification(false)
        print("deinit")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.reload()
    }
    
    // MARK: - リロード処理
    
    private func reload() {
        Hud.show()
        self.enabledUseButton = false
        self.adapter.files = []
        
        let req = App.Google.Drive.GetFiles(parentFolder: self.currentFolder)
        App.Google.DriveAPI.request(req) { res, result in
            Hud.hide()
            if let err = result.state.error {
                print(err.localizedDescription)
            } else if let files = res {
                self.adapter.files = files
                self.enabledUseButton = true
            }
            self.tableView.reloadData()
        }
    }
    
    // MARK: - セットアップ
    
    /// テーブルビューのセットアップ
    private func setupTableView() {
        self.adapter = GoogleDriveTableViewController(selectedHandler: { [unowned self] folder in
            self.enabledUseButton = false
            self.push(GoogleDriveViewController.create(folder: folder))
        })
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
        let alert = UIAlertController(title: "Add New Folder".localize(), message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction.cancel())
        alert.addAction(UIAlertAction.ok() {
            let text = alert.textFields![0].text ?? ""
            if text.isEmpty {
                NBAlert.show(OK: self, message: "Folder Name not empty".localize())
                return
            }
            
            Hud.show()
            let req = App.Google.Drive.CreateFolder(name: text, parentFolder: self.currentFolder)
            App.Google.DriveAPI.request(req, handler: { res, request in
                Hud.hide()
                self.reload()
            })
        })
        
        alert.addTextField() { textField in
            textField.placeholder = "Folder Name".localize()
            textField.textColor   = UIColor.darkText
            textField.font        = UIFont.systemFont(ofSize: 18)
        }
        
        self.present(alert)
    }
        
    /// フォルダを使用するボタン
    @IBAction private func didTapUseButton() {
        if let file = self.currentFolder {
            self.selectedHandler(file.name, file.identifier)
        } else {
            self.selectedHandler(App.Google.Drive.rootFolderName, App.Google.Drive.rootFolderID)
        }
        self.dismiss()
    }
    
    // MARK: - 通知イベント
    
    /// 通知監視の開始／停止
    private func observeNotification(_ start: Bool) {
        let items: [App.Notify.Item : String] = [
            .willEnterForeground : "applicationWillEnterForeground",
            ]
        if start {
            App.Notify.addItems(self, items)
        } else {
            App.Notify.removeItems(self, items.map { $0.key })
        }
    }
    
    /// アプリケーションがフォアグラウンドに入る時
    @objc private func applicationWillEnterForeground() {
        if let vc = self.navigationController?.topViewController, vc == self {
            self.reload()
        }
    }
    
    // MARK: - 汎用処理
    
    private var enabledUseButton: Bool = true {
        didSet {
            self.useButton.isEnabled = self.enabledUseButton
            self.useButton.backgroundColor = self.enabledUseButton ?
                App.Color.PositiveButtonColor :
                App.Color.DisabledButtonColor
        }
    }
}
