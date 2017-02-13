/**
 * Icon Make It
 * (c) NeroBlu All Rights Reserved.
 */
import UIKit
import NeroBlu

// MARK: - GoogleAPIResultState -

/// GoogleAPI結果ステータス
enum GoogleAPIResultState {
    
    case none // まだリクエストしていない状態
    case succeed
    case failed(NSError)
    case cancelled
    
    /// エラーオブジェクト(Failedの時だけ取得できる)
    var error: NSError? {
        switch self {
        case let .failed(err): return err
        default:               return nil
        }
    }
    
    var ok: Bool {
        switch self {
        case .succeed: return true
        default:       return false
        }
    }
}
