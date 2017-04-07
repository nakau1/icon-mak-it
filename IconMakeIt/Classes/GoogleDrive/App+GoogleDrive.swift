/**
 * Icon Make It
 * (c) NeroBlu All Rights Reserved.
 */
import UIKit
import NeroBlu
import GoogleAPIClient

// MARK: - App拡張 -
extension App {
    
    class Google {
        
        static let DriveAPI = GoogleAPI(
            service:      GTLServiceDrive(),
            keychainName: "google.drive.authorization",
            clientID:     "594823318499-ii41vg4gv04f6u82hmldkmnqeo2ot1t9",
            clientSecret: "3k11eC2aUqrmXwQMgPFSBv0K",
            scopes:       ["https://www.googleapis.com/auth/drive"]
        )
        
        class Drive {}
    }
}

// MARK: - App.Google.Drive拡張 -
extension App.Google.Drive {
    
    static let folderMimeType = "application/vnd.google-apps.folder"
    static let rootFolderID   = "root"
    static let rootFolderName = "ルートフォルダ"
}

// MARK: - GTLDriveFile拡張 -
extension GTLDriveFile {
    
    /// フォルダかどうか
    var isFolder: Bool {
        return self.mimeType == App.Google.Drive.folderMimeType
    }
    
    open override var description: String {
        var ret = self.isFolder ? "[D" : "[F"
        ret += ":\(self.identifier!)] "
        ret += self.name
        return ret
    }
}
