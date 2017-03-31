/**
 * Icon Make It
 * (c) NeroBlu All Rights Reserved.
 */
import UIKit
import NeroBlu
import GoogleAPIClient

extension App.Google.Drive {
    
    /// フォルダを生成して追加する
    class CreateFolder: GoogleAPIRequestable {
        
        typealias Response = GTLDriveFile?
        
        let file: GTLDriveFile
        
        /// イニシャライザ
        /// - parameter name: フォルダ名
        /// - parameter parentFolder: 親フォルダ(nilを渡すとルートディレクトリに作成する)
        init(name: String, parentFolder: GTLDriveFile?) {
            self.file = GTLDriveFile()
            self.file.name = name
            self.file.mimeType = App.Google.Drive.folderMimeType
            
            if let folder = parentFolder {
                self.file.parents = [folder.identifier]
            }
        }
        
        func query() -> GTLQuery {
            return GTLQueryDrive.queryForFilesCreate(withObject: self.file, uploadParameters: nil)
        }
        
        func processResponse(_ res: Any?) -> Response? {
            return res as? GTLDriveFile
        }
    }
}
