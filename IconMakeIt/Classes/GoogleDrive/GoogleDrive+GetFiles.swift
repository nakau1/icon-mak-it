/**
 * Icon Make It
 * (c) NeroBlu All Rights Reserved.
 */
import UIKit
import NeroBlu
import GoogleAPIClient

extension App.Google.Drive {
    
    /// フォルダ内のファイル(フォルダ)をすべて取得する
    class GetFiles: GoogleAPIRequestable {
        
        typealias Response = [GTLDriveFile]
        
        let folder: GTLDriveFile?
        
        init(parentFolder: GTLDriveFile? = nil) {
            self.folder = parentFolder
        }
        
        func query() -> GTLQuery {
            return GTLQueryDrive.queryForFilesList()
        }
        
        func processQuery(_ query: GTLQuery) -> GTLQuery? {
            if let queryDrive = query as? GTLQueryDrive {
                let folderID: String
                if let folder = self.folder {
                    folderID = folder.identifier
                } else {
                    folderID = "root"
                }
                queryDrive.q = "'\(folderID)' in parents and trashed = false"
                //queryDrive.q = "'\(folderID)' in parents and trashed = false and mimeType = 'application/vnd.google-apps.folder'"
                queryDrive.count = 999999999
            }
            return query
        }
        
        func processResponse(_ res: Any?) -> Array<GTLDriveFile>? {
            var ret = [GTLDriveFile]()
            var others = [GTLDriveFile]()
            guard
                let fileList = res as? GTLDriveFileList,
                let files    = fileList.files as? [GTLDriveFile]
                else {
                    return ret
            }
            for file in files {
                if file.isFolder {
                    ret.append(file)
                } else {
                    others.append(file)
                }
            }
            ret += others
            return ret
        }
    }
}
