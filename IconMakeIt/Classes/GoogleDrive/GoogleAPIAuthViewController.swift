/**
 * Icon Make It
 * (c) NeroBlu All Rights Reserved.
 */
import UIKit
import NeroBlu
import GTMOAuth2

protocol GoogleAPIAuthViewControllerDelegate: NSObjectProtocol {
    
    /// キャンセルボタンが押下された時
    /// - parameter googleAPIAuthViewController: GoogleAPIAuthViewControllerオブジェクト
    func googleAPIAuthViewControllerDidTapCancel(_ googleAPIAuthViewController: GoogleAPIAuthViewController);
}

// MARK: - GoogleAPIAuthViewController -

class GoogleAPIAuthViewController: UIViewController {
    
    private weak var oauth2vc: GTMOAuth2ViewControllerTouch!
    
    private weak var delegate: GoogleAPIAuthViewControllerDelegate?
    
    // MARK: イニシャライザ
    
    /// イニシャライザ
    /// - parameter oauth2vc: GTMOAuth2ViewControllerTouchオブジェクト
    /// - parameter delegate: デリゲート
    convenience init(oauth2vc: GTMOAuth2ViewControllerTouch, delegate: GoogleAPIAuthViewControllerDelegate) {
        self.init()
        self.oauth2vc = oauth2vc
        self.delegate = delegate
    }
    
    // MARK: ライフサイクル
    
    override func loadView() {
        super.loadView()
        let _ = self.setupContents(self.setupHeader(self.setupStatusBarSpace()))
    }
    
    // MARK: 画面のセットアップ
    
    private func setupStatusBarSpace() -> UIView {
        let ret = UIView()
        self.view.addSubview(ret)
        ret.backgroundColor = UIColor.white
        ret.prepareConstraints()
        
        let height = !UIApplication.shared.isStatusBarHidden ? UIApplication.shared.statusBarFrame.height : 0
        self.view.addConstraints([
            Constraint(ret, .top,    to: self.topLayoutGuide, .top,    0),
            Constraint(ret, .width,  to: self.view,           .width,  0),
            Constraint(ret, .height, to: nil,                 .height, height),
            ])

        return ret
    }
    
    private func setupHeader(_ statusBarSpace: UIView) -> UIView {
        let ret = UIToolbar()
        self.view.addSubview(ret)
        ret.prepareConstraints()
        
        self.view.addConstraints([
            Constraint(ret, .top,    to: statusBarSpace, .bottom, 0),
            Constraint(ret, .width,  to: self.view,      .width,  0),
            Constraint(ret, .height, to: nil,            .height, 44),
            ])
        
        ret.items = [makeBarItem(.stop, "didTapCancel")]
        return ret
    }
    
    private func setupContents(_ header: UIView) -> UIView {
        let ret = (self.oauth2vc != nil) ? self.oauth2vc.view! : UIView()
        self.view.addSubview(ret)
        ret.prepareConstraints()
        
        self.view.addConstraints([
            Constraint(ret, .top,    to: header,                 .bottom, 0),
            Constraint(ret, .width,  to: self.view,              .width,  0),
            Constraint(ret, .bottom, to: self.bottomLayoutGuide, .bottom, 0),
            ])
        
        return ret
    }
    
    private func makeBarItem(_ item: UIBarButtonSystemItem, _ actionName: String) -> UIBarButtonItem {
        let ret = UIBarButtonItem(barButtonSystemItem: item, target: self, action: Selector(actionName))
        ret.tintColor = UIColor(white: 0.2, alpha: 1)
        return ret
    }
    
    // MARK: イベント
    @objc fileprivate func didTapCancel() {
        self.delegate?.googleAPIAuthViewControllerDidTapCancel(self)
    }
}
