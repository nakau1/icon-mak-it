/**
 * Icon Make It
 * (c) NeroBlu All Rights Reserved.
 */
import UIKit
import NeroBlu
import GoogleAPIClient

// MARK: - GoogleAPIResult -

class GoogleAPIResult {
    
    /// API結果ステータス
    var state = GoogleAPIResultState.none
    
    /// チケットオブジェクト
    var ticket: GTLServiceTicket? = nil
}

extension GoogleAPIResult: CustomStringConvertible {
    
    var description: String {
        var ret = "\(self.state) "
        
        if let ticket = self.ticket {
            ret += "\(ticket.statusCode)"
        }
        if let error = self.state.error {
            ret += " \(error.localizedDescription)"
        }
        
        return ret
    }
}
