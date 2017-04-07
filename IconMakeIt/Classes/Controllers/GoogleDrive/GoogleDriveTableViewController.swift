/**
 * Icon Make It
 * (c) NeroBlu All Rights Reserved.
 */
import UIKit
import NeroBlu
import GoogleAPIClient

// MARK: - GoogleDriveTableViewController -

/// GoogleDriveフォルダ選択画面 テーブルビューコントローラ
class GoogleDriveTableViewController: NBTableViewController, UITextFieldDelegate {
    
    typealias SelectedHandler = (GTLDriveFile) -> ()
    
    private var selectedHandler : SelectedHandler!
    
    var files = [GTLDriveFile]()
    
    // MARK: - イニシャライザ
    
    /// イニシャライザ
    /// - parameter items: アイテム配列
    /// - parameter selectedHandler: 変更された時のハンドラ
    convenience init(selectedHandler : @escaping SelectedHandler) {
        self.init()
        self.selectedHandler = selectedHandler
    }
    
    override func setup(_ tableView: UITableView) {
        super.setup(tableView)
        NBCellBackgroundView.prepareTableView(tableView)
    }
    
    // MARK: - UITableViewDelegate & UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.files.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! GoogleDriveTableViewCell
        
        if !(cell.selectedBackgroundView is NBCellBackgroundView) {
            cell.backgroundColor = UIColor.clear
            cell.setCellBackgrounView()
        }
        cell.file = self.files[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        super.tableView(tableView, didSelectRowAt: indexPath)
        let file = self.files[indexPath.row]
        if file.isFolder {
            self.selectedHandler(file)
        }
    }
}

// MARK: - GoogleDriveTableViewCell -

/// GoogleDriveフォルダ選択画面 テーブルビューセル
class GoogleDriveTableViewCell: UITableViewCell {
    
    var file: GTLDriveFile! {
        didSet { let v = self.file
            self.textLabel?.text = v?.name
            
            let isFolder = v?.isFolder ?? false
            self.accessoryType  = isFolder ? .disclosureIndicator : .none
            self.selectionStyle = isFolder ? .blue : .none
            self.textLabel?.textColor = isFolder ?
                App.Color.DefaultIconColor :
                App.Color.DisabledButtonColor
            
            let icon: UIImage = isFolder ?
                UIImage(named: "icon_folder")! :
                UIImage(named: "btn_background_color")!
            self.imageView?.image = icon
        }
    }
}
