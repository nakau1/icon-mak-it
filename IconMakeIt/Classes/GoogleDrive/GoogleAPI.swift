/**
 * Icon Make It
 * (c) NeroBlu All Rights Reserved.
 */
import UIKit
import NeroBlu
import GTMOAuth2
import GoogleAPIClient

/// GoogleAPIの処理を行うクラス
class GoogleAPI: NSObject, GoogleAPIAuthViewControllerDelegate {
    
    typealias AuthenticatedHandler = (GoogleAPI, GoogleAPIResultState) -> Void
    
    /// 認証されたメールアドレス
    private(set) var userEmail = ""
    
    /// 認証情報
    private(set) var persistence = ""
    
    private var oauth2: GTMOAuth2Authentication? = nil
    
    private var authenticatedHandler: AuthenticatedHandler?
    
    private var authViewController: GoogleAPIAuthViewController?
    
    // MARK: - リクエスト送信
    
    /// GoogleAPIに対してリクエストを送信する
    /// - parameter request: リクエストオブジェクト
    /// - parameter handler: レスポンスハンドラ
    func request<T: GoogleAPIRequest>(_ request: T, handler: @escaping (T.Response?, GoogleAPIResult) -> Void) {
        
        let result = GoogleAPIResult()
        
        // 認証チェック
        guard let authorizer = self.oauth2 else {
            result.state = .failed(Error("not authorized."))
            handler(nil, result)
            return
        }
        
        // クエリオブジェクトのチェック
        guard let query = request.query() as? GTLQueryDrive else {
            result.state = .failed(Error("invalid query."))
            handler(nil, result)
            return
        }
        
        let service = GTLServiceDrive()
        service.authorizer = authorizer
        request.processService(service).executeQuery(request.processQuery(query)) { ticket, res, error in
            
            result.ticket = ticket
            
            var response: T.Response? = nil
            if let error = error {
                result.state = .failed(error as NSError)
            } else {
                response = request.processResponse(res as AnyObject?)
                result.state = request.resultState()
            }
            
            handler(response, result)
        }
    }
    
    // MARK: - 認証
    
    /// 認証を行う
    func authenticate(_ owner: UIViewController, handler: @escaping AuthenticatedHandler) {
        self.authenticatedHandler = handler
        
        guard
            let keychainedOAuth2 = GTMOAuth2ViewControllerTouch.authForGoogleFromKeychain(
                forName:      App.Google.Configure.KeychainItemName,
                clientID:     App.Google.Configure.ClientID,
                clientSecret: App.Google.Configure.ClientSecret
            ),
            let mail = keychainedOAuth2.userEmail,
            let prs = keychainedOAuth2.persistenceResponseString()
            else {
                self.presentAuthViewController(owner)
                return
        }
        
        self.oauth2      = keychainedOAuth2
        self.userEmail   = mail
        self.persistence = prs
        
        handler(self, .succeed)
    }
    
    /// 認証の解除を行う
    func logoutAuthenticate() {
        GTMOAuth2ViewControllerTouch.removeAuthFromKeychain(forName: App.Google.Configure.KeychainItemName)
    }
    
    /// キーチェーンから認証中のEmail
    var authenticatedUserEmail: String? {
        let keychainedOAuth2 = GTMOAuth2ViewControllerTouch.authForGoogleFromKeychain(
            forName:      App.Google.Configure.KeychainItemName,
            clientID:     App.Google.Configure.ClientID,
            clientSecret: App.Google.Configure.ClientSecret
        )
        return keychainedOAuth2?.userEmail
    }
    
    // MARK: - 認証画面処理
    
    /// 認証画面を表示する
    private func presentAuthViewController(_ owner: UIViewController) {
        guard
            let oauth2vc = GTMOAuth2ViewControllerTouch(
                scope:            App.Google.Configure.Scope,
                clientID:         App.Google.Configure.ClientID,
                clientSecret:     App.Google.Configure.ClientSecret,
                keychainItemName: App.Google.Configure.KeychainItemName,
                completionHandler: { vc, auth, error in
                    if let error = error {
                        self.dismissAuthViewController(.failed(error as NSError))
                        return
                    }
                    
                    auth!.authorizeRequest(NSMutableURLRequest(url: (auth?.tokenURL)!)) { error in
                        let state: GoogleAPIResultState
                        if let error = error {
                            state = .failed(error as NSError)
                        } else {
                            self.oauth2      = auth
                            self.userEmail   = auth?.userEmail ?? ""
                            self.persistence = auth?.persistenceResponseString() ?? ""
                            state = .succeed
                        }
                        self.dismissAuthViewController(state)
                    }
            })
            else {
                return
        }
        self.authViewController = GoogleAPIAuthViewController(oauth2vc: oauth2vc, delegate: self)
        owner.present(self.authViewController!)
    }
    
    /// 認証画面を閉じる
    private func dismissAuthViewController(_ state: GoogleAPIResultState) {
        guard let vc = self.authViewController else { return }
        
        vc.dismiss {
            self.authenticatedHandler?(self, state)
            self.authViewController = nil
        }
    }
    
    /// 認証画面キャンセルボタン押下時
    func googleAPIAuthViewControllerDidTapCancel(_ googleAPIAuthViewController: GoogleAPIAuthViewController) {
        self.dismissAuthViewController(.cancelled)
    }
}

// MARK: - App.Google拡張 -
extension App.Google {
    
    static let API = GoogleAPI()
}


