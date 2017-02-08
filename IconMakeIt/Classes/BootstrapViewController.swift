/**
 * Icon Make It
 * (c) NeroBlu All Rights Reserved.
 */
import UIKit
import NeroBlu

class BootstrapViewController: NBLandingViewController {
    override var items: [(title: String, rows: [NBLandingItem])] {
        return [
            (title:"書棚", rows:[
                NBLandingItem("書棚") {
                    
                },
                ]),
            (title:"データ確認", rows:[
                NBLandingItem("パス") {
                    
                },
                ]),
        ]
    }
}
