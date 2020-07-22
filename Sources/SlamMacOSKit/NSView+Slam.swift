//
//  NSView+Slam.swift
//  SlamMacOSKit
//
//  Created by Sheets, Steve on 7/8/17.
//  Copyright © 2020 Sheets, Steve. All rights reserved.
//

import Cocoa
import SlamKit

// MARK: Extensions

extension NSView {
    
    // MARK: Public Functions
    
    /// Find specified View, looking through subview. Only check subviews that have slamReferral string.
    /// - Parameter referral: String to look for
    /// - Returns: Optional NSView that has slamRerral string that matches referral string
    public func slamFindSubView(referral: String) -> NSView? {
        if let special = self as? SlamSpecialViewable {
            if let v = special.slamSpecialFindSubView(referral: referral) {
                return v
            }
        }

        for v in subviews {
            if let r = v as? SlamReferable {
                if r.slamReferral == referral {
                    return v
                }
            }
            
            if let f = v.slamFindSubView(referral: referral) {
                return f
            }
        }
        
        return nil
    }

    /// Invoke slamUpdateUI in all subviews that supports the call.
    /// - Parameter reload: Bool indicates deep data source must be reloaded (ex: list)
    public func slamUpdateSubUI(reload: Bool) {
        if let special = self as? SlamSpecialViewable {
            special.slamSpecialUpdateSubUI(reload: reload)
        }
        
        for v in self.subviews {
            if let ui = v as? SlamVisibleable {
                ui.slamUpdateUI(reload: reload)
            }
            
            v.slamUpdateSubUI(reload: reload)
        }
    }
    
}

