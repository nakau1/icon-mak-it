/**
 * Icon Make It
 * (c) NeroBlu All Rights Reserved.
 */
import UIKit
import NeroBlu

/// 設定セクション: GoogleDrive
class SettingSectionGoogleDrive: SettingSectionBehavable {
    
    enum Row {
        case account
        case directory
        case selectEverytime
        case logout
        
        var name: String {
            switch self {
            case .account:         return "Account".localize()
            case .directory:       return "Directory".localize()
            case .selectEverytime: return "Select directory every time".localize()
            case .logout:          return "Logout".localize()
            }
        }
        
        var item: SettingItem {
            let ret = SettingItem(self.name)
            
            switch self {
            case .account:
                ret.subText = "アカウント名"
            case .directory:
                ret.subText = "ディレクトリ名"
            case .selectEverytime: ret.checked = App.Config.GoogleDrive.shouldSelectGoogleDriveFolder
            default: break
            }
            
            return ret
        }
        
        static let items: [Row] = [.account, .directory, .selectEverytime, .logout]
    }

    /// セクションタイトル
    var title: String {
        return "Google Drive".localize()
    }
    
    /// 項目の配列
    var items: [SettingItem] {
        return Row.items.map { $0.item }
    }
    
    /// 項目が選択された時の処理
    /// - parameter index: インデックス
    func didSelectItem(at index: Int) {
        guard App.System.TopViewController != nil else { return }
        
        switch Row.items[index] {
        case .account:
            break
        case .directory:
            break
        case .selectEverytime:
            let _ = App.Config.GoogleDrive.shouldSelectGoogleDriveFolder.reverse()
            break
        case .logout:
            break
        }
    }
}

/*
    ret.append(
        Section("Google Drive", [
            Row("アカウント", .Text).detailIs(Google.Api.authenticatedUserEmail ?? "(未認証)").handlerIs { d in
                if self.authorized {
                    self.message("アカウントを変更するには、まずログアウトを行ってください"); return
                }
                Google.Api.authenticate(self) { api, result in
                    if result.ok {
                        self.reload(true)
                    } else if let _ = result.error {
                        self.message("エラーが発生したため、認証できませんでした")
                    }
                }
            },
            Row("最後に選択したフォルダ", .Text).detailIs(self.displayedGoogleFolderName).handlerIs { d in
                if !self.authorized {
                    self.message("フォルダを変更するには、まずアカウントの認証を行ってください"); return
                }
                GoogleDriveSelectFolderViewController.show(self, delegate: self)
            },
            Row("毎回フォルダを選択する", .Check).checkedIs(App.Config.shouldSelectGoogleDriveFolder).handlerIs { d in
                App.Config.shouldSelectGoogleDriveFolder = d.row.checked
            },
            Row("ログアウトする", .Plain).handlerIs { d in
                if !self.authorized {
                    self.message("現在アカウントの認証はされていません"); return
                }
                self.confirm("本当にログアウトしますか?") {
                    Google.Api.logoutAuthenticate()
                    App.Config.latestGoogleDriveFolderID   = GoogleDriveApiRequest.rootFolder
                    App.Config.latestGoogleDriveFolderName = GoogleDriveApiRequest.rootFolderName
                    self.message("ログアウトしました")
                    self.reload(true)
                }
            },
            ]
        )
    )
 */