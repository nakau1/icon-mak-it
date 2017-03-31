/**
 * Icon Make It
 * (c) NeroBlu All Rights Reserved.
 */
import UIKit
import NeroBlu

// MARK: - GoogleDriveTableViewController -

/// GoogleDriveフォルダ選択画面 テーブルビューコントローラ
class GoogleDriveTableViewController: NBTableViewController, UITextFieldDelegate {
    
    // MARK: - UITableViewDelegate & UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! GoogleDriveTableViewCell
//        cell.textField.delegate = self
//        cell.textField.tag      = indexPath.row
//        cell.textField.text     = self.items[indexPath.row]
        return cell
    }
}

// MARK: - GoogleDriveTableViewCell -

/// GoogleDriveフォルダ選択画面 テーブルビューセル
class GoogleDriveTableViewCell: UITableViewCell {
    
}
