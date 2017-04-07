/**
 * Icon Make It
 * (c) NeroBlu All Rights Reserved.
 */
import UIKit
import NeroBlu
import GoogleAPIClient

class BootstrapViewController: NBLandingViewController {
    override var items: [(title: String, rows: [NBLandingItem])] {
        return [
            (title:"画面", rows:[
                NBLandingItem("一覧") {
                    self.present(ListViewController.create())
                },
                NBLandingItem("プレフィクス") {
                    self.present(FixesSettingViewController.create(fixMode: .suffix))
                },
                NBLandingItem("設定") {
                    self.present(SettingViewController.create())
                },
                NBLandingItem("GoogleDrive") {
                    GoogleDriveViewController.show(self, selected: { folderName, folderID in
                        print(folderName, folderID)
                    })
                },
                NBLandingItem("チュートリアル") {
                    self.present(TutorialViewController.create())
                },
                ]),
            (title:"テスト", rows:[
                NBLandingItem("テスト") {
                    print(App.Config.Latest.iconFont)
                    App.Config.Latest.iconFont = .Genericons
                },
                ]),
            (title:"Google", rows:[
                NBLandingItem("認証画面") {
                    App.Google.DriveAPI.authorize(self) { state in
                        self.tableView.reloadData()
                        
                        App.Google.DriveAPI.request(App.Google.Drive.GetFiles()) { response, result in
                            if let lists = response as [GTLDriveFile]? {
                                print(lists)
                            }
                        }
                    }
                },
                NBLandingItem("フォルダ作成/ファイル作成テスト") {
                    App.Google.DriveAPI.authorize(self) { state in
                        
                        App.Google.DriveAPI.request(App.Google.Drive.CreateFolder(name: "テストだよ", parentFolder: nil)) { response, result in
                            if let file = response! as GTLDriveFile? {
                                
                                let rq = App.Google.Drive.UploadPngFile(image: UIImage(named: "icon_folder")!, name: "アイコン.png", folder: file)
                                
                                App.Google.DriveAPI.request(rq) { response, result in
                                    if let file = response! as GTLDriveFile? {
                                        print(file)
                                    }
                                }
                                
                                
                            }
                        }
                    }
                },
                NBLandingItem("ログアウト") {
                    App.Google.DriveAPI.logoutAuthorization()
                    self.tableView.reloadData()
                },
                NBLandingItem(App.Google.DriveAPI.userEmail ?? "(未認証)") {
                    
                },
                ]),
        ]
    }
}
