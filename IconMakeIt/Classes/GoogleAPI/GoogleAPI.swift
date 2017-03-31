/**
 * Icon Make It
 * (c) NeroBlu All Rights Reserved.
 */
import UIKit
import NeroBlu
import AppAuth
import GTMAppAuth
import GoogleAPIClient

/// GoogleAPIの処理を行うクラス
class GoogleAPI {
    
    typealias AuthorizedHandler = (GoogleAPIResultState) -> Void
    
    private var authorizedHandler: AuthorizedHandler?
    
    private var authorization: GTMAppAuthFetcherAuthorization?
    
    private let service: GTLService
    
    private let clientID: String
    
    private let clientSecret: String
    
    private let keychainName: String
    
    private let scopes: [String]
    
    // MARK: - イニシャライザ
    
    /// イニシャライザ
    /// - parameter service: サービス
    /// - parameter keychainName: キーチェーン名
    /// - parameter clientID: クライアントID
    /// - parameter clientSecret: クライアントシークレット
    /// - parameter scopes: スコープ
    init(service: GTLService, keychainName: String, clientID: String, clientSecret: String, scopes: [String]) {
        self.service       = service
        self.keychainName  = keychainName
        self.clientID      = clientID
        self.clientSecret  = clientSecret
        self.scopes        = scopes
    }
    
    // MARK: - リクエスト送信
    
    /// GoogleAPIに対してリクエストを送信する
    /// - parameter request: リクエストオブジェクト
    /// - parameter handler: レスポンスハンドラ
    func request<T: GoogleAPIRequestable>(_ request: T, handler: @escaping (T.Response?, GoogleAPIResult) -> Void) {
        let result = GoogleAPIResult()
        
        // 認証チェック
        if !self.existsAuthorization() {
            result.state = .failed(Error("not authorized."))
            handler(nil, result)
            return
        }
        
        // クエリ
        guard let query = request.processQuery(request.query()) else {
            result.state = .failed(Error("no query."))
            handler(nil, result)
            return
        }
        
        // サービス
        guard let server = request.processService(self.service) else {
            result.state = .failed(Error("service not work."))
            handler(nil, result)
            return
        }
        
        server.executeQuery(query) { ticket, res, error in
            result.ticket = ticket
            
            var response: T.Response? = nil
            if let error = error {
                result.state = .failed(error as NSError)
            } else {
                response = request.processResponse(res)
                result.state = request.resultState()
            }
            
            handler(response, result)
        }
    }
    
    /// 認証されたメールアドレス
    var userEmail: String? {
        self.loadAuthorization()
        
        if self.existsAuthorization() {
            return self.service.authorizer.userEmail
        }
        return nil
    }
        
    // MARK: - 認証
    
    /// 認証を行う
    /// - parameter viewController: ビューコントローラ
    /// - parameter handler: 認証処理完了時ハンドラ
    func authorize(_ viewController: UIViewController, handler: @escaping AuthorizedHandler) {
        self.loadAuthorization()
        
        if self.existsAuthorization() {
            handler(.succeed)
            return
        }
        
        self.executeAuthorization(viewController) { state in
            handler(state)
        }
    }
    
    private func executeAuthorization(_ viewController: UIViewController, handler: @escaping AuthorizedHandler) {
        let issuer = URL(string: "https://accounts.google.com")
        OIDAuthorizationService.discoverConfiguration(forIssuer: issuer!) { configuration, error in
            guard let configuration = configuration else {
                handler(.failed(Error("configuration not discovered")))
                return
            }
            
            let redirectURL = URL(string: "com.googleusercontent.apps.\(self.clientID):/oauthredirect")
            let req = self.generateAuthorizationRequest(configuration, redirectURL!)
            let app = UIApplication.shared.delegate as! AppDelegate
            app.currentAuthorizationFlow = OIDAuthState.authState(byPresenting: req, presenting: viewController) { authState, error in
                if let authState = authState {
                    let auth = GTMAppAuthFetcherAuthorization(authState: authState)
                    self.setAuthorization(auth)
                    if self.existsAuthorization() {
                        handler(.succeed)
                    } else {
                        handler(.failed(Error("")))
                    }
                } else {
                    let err = (error as? NSError) ?? Error("unkonwn error.")
                    self.setAuthorization(nil)
                    handler(.failed(err))
                }
            }
        }
    }
    
    /// 認証の解除を行う
    func logoutAuthorization() {
        self.setAuthorization(nil)
    }
    
    private func setAuthorization(_ auth: GTMAppAuthFetcherAuthorization?) {
        if self.authorization == auth {
            return
        }
        self.authorization = auth
        self.saveAuthorization()
        self.service.authorizer = self.authorization
    }
    
    private func saveAuthorization() {
        if let auth = self.authorization {
            if auth.canAuthorize() {
                GTMAppAuthFetcherAuthorization.save(auth, toKeychainForName: self.keychainName)
            } else {
                GTMAppAuthFetcherAuthorization.removeFromKeychain(forName: self.keychainName)
            }
        } else {
            GTMAppAuthFetcherAuthorization.removeFromKeychain(forName: self.keychainName)
        }
    }
    
    private func loadAuthorization() {
        self.setAuthorization(GTMAppAuthFetcherAuthorization(fromKeychainForName: self.keychainName))
    }
    
    private func existsAuthorization() -> Bool {
        if let authorizer = self.service.authorizer, let canAuthorize = authorizer.canAuthorize {
            return canAuthorize
        }
        return false
    }
    
    private func generateAuthorizationRequest(_ configuration: OIDServiceConfiguration, _ redirectURL: URL) -> OIDAuthorizationRequest {
        var scopes = self.scopes
        scopes.append(OIDScopeEmail)
        
        return OIDAuthorizationRequest(
            configuration:        configuration,
            clientId:             self.clientID,
            clientSecret:         self.clientSecret,
            scopes:               scopes,
            redirectURL:          redirectURL,
            responseType:         OIDResponseTypeCode,
            additionalParameters: nil
        )
    }
}

