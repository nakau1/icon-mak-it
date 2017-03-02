/**
 * Icon Make It
 * (c) NeroBlu All Rights Reserved.
 */
import UIKit
import NeroBlu

class BootstrapViewController: NBLandingViewController {
    override var items: [(title: String, rows: [NBLandingItem])] {
        return [
            (title:"画面", rows:[
                NBLandingItem("一覧") {
                    self.present(ListViewController.create())
                },
                NBLandingItem("設定") {
                    self.present(SettingViewController.create())
                },
                NBLandingItem("GoogleDrive") {
                    self.present(GoogleDriveViewController.create())
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
                    App.Google.API.authorize(self) { state in
                        
                    }
                },
                ]),
        ]
    }
}
