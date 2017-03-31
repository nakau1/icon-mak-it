/**
 * Icon Make It
 * (c) NeroBlu All Rights Reserved.
 */
import UIKit
import NeroBlu
import GoogleAPIClient

extension App.Google.Drive {
    
    /// ファイル(png)をアップロードする
    class UploadPngFile: GoogleAPIRequestable {
        
        typealias Response = GTLDriveFile?
        
        let file:             GTLDriveFile!
        let uploadParameters: GTLUploadParameters!
        
        init(image: UIImage, name: String, folder: GTLDriveFile) {
            self.file = GTLDriveFile()
            self.file.name                = name
            self.file.mimeType            = "image/png"
            self.file.descriptionProperty = "Uploaded form IconMakeIt"
            self.file.parents             = [folder.identifier]
            
            self.uploadParameters = GTLUploadParameters(
                data:     UIImagePNGRepresentation(image)!,
                mimeType: self.file.mimeType
            )
        }
        
        func query() -> GTLQuery {
            return GTLQueryDrive.queryForFilesCreate(withObject: self.file, uploadParameters: self.uploadParameters)
        }
        
        func processResponse(_ res: Any?) -> Response? {
            return res as? GTLDriveFile
        }
    }
}
