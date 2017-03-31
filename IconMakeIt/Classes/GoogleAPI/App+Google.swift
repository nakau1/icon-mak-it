/**
 * Icon Make It
 * (c) NeroBlu All Rights Reserved.
 */
import UIKit
import NeroBlu

// MARK: - App拡張 -
extension App {
    
    /// GoogleAPI
    class Google {
    
        /// GoogleAPI設定
        class Configure {
            
            static let ClientID = "594823318499-ii41vg4gv04f6u82hmldkmnqeo2ot1t9"
            
            static let ClientSecret = "3k11eC2aUqrmXwQMgPFSBv0K"
            
            static let Scopes = [
                "https://www.googleapis.com/auth/drive",
                ]
        }
        
        /// GoogleAPIオブジェクト
        static let API = GoogleAPI()
    }
}
