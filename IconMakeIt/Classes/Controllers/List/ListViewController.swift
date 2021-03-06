/**
 * Icon Make It
 * (c) NeroBlu All Rights Reserved.
 */
import UIKit
import NeroBlu

class ListViewController: UIViewController {
    
    /// 自身のインスタンスを生成する
    /// - returns: 新しい自身のインスタンス
    class func create() -> ListViewController {
        let ret = App.Storyboard("List").get(ListViewController.self)
        return ret
    }
    
    // MARK: - ライフサイクル
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
