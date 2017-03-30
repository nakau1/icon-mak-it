/**
 * Icon Make It
 * (c) NeroBlu All Rights Reserved.
 */
import UIKit
import NeroBlu

// MARK: - FixesSettingTableViewController -

/// プレフィックス/サフィックス編集画面 テーブルビューコントローラ
class FixesSettingTableViewController: NBTableViewController, UITextFieldDelegate {
    
    typealias ChangedHandler = ([String]) -> ()
    
    private var changedHandler : ChangedHandler!
    
    private var items = [String]()
    
    // MARK: - イニシャライザ
    
    /// イニシャライザ
    /// - parameter items: アイテム配列
    /// - parameter changedHandler: 変更された時のハンドラ
    convenience init(items: [String], changedHandler : @escaping ChangedHandler) {
        self.init()
        self.items = items
        self.changedHandler = changedHandler
    }
    
    override func setup(_ tableView: UITableView) {
        super.setup(tableView)
        tableView.isEditing = true
    }
    
    // MARK: - パブリックメソッド

    /// アイテムの追加
    /// - parameter item: 追加するアイテム文字列
    func addItem(_ item: String) {
        self.items.append(item)
        self.tableView?.reloadData()
        self.changed()
    }
    
    // MARK: - UITableViewDelegate & UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FixesSettingTableViewCell
        cell.textField.delegate = self
        cell.textField.tag      = indexPath.row
        cell.textField.text     = self.items[indexPath.row]
        return cell
    }
    
    // MARK: 項目の削除
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.items.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            self.changed()
        }
    }
    
    // MARK: 項目の移動
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let item = self.items[sourceIndexPath.row]
        self.items.remove(at: sourceIndexPath.row)
        self.items.insert(item, at: destinationIndexPath.row)
        tableView.reloadData()
        self.changed()
    }
    
    // MARK: - UITextFieldDelegate
    
    /// キーボードリターンキー押下時
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        self.changed()
        return true
    }
    
    // MARK: - セルからの呼び出し
    
    /// セル側のテキストフィールドの値が変更された時
    fileprivate func didEditingChangeCellTextField(_ textField: UITextField) {
        self.items[textField.tag] = textField.text ?? ""
        self.changed()
    }
    
    
    // MARK: -
    
    /// 変更時の共通処理
    private func changed() {
        self.changedHandler(self.items)
    }
}

// MARK: - FixesSettingTableViewCell -

/// プレフィックス/サフィックス編集画面 テーブルビューセル
class FixesSettingTableViewCell: UITableViewCell {
    
    @IBOutlet fileprivate weak var textField: UITextField!
    
    @IBAction private func didEditingChangeCellText() {
        if let owner = self.textField.delegate as? FixesSettingTableViewController {
            owner.didEditingChangeCellTextField(self.textField)
        }
    }
}
