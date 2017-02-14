/**
 * Icon Make It
 * (c) NeroBlu All Rights Reserved.
 */
import UIKit
import AppAuth

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var currentAuthorizationFlow: OIDAuthorizationFlowSession?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        if (self.currentAuthorizationFlow?.resumeAuthorizationFlow(with: url))! {
            self.currentAuthorizationFlow = nil
            return true
        }
        return false
    }
}
