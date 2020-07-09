//
//  NSView+Slam.swift
//  SlamMacOSKit
//
//  Created by Sheets, Steve on 7/8/17.
//  Copyright © 2017 Sheets, Steve. All rights reserved.
//

import SlamKit

#if os(macOS)

import Cocoa

// MARK: Extensions

extension NSView {
    
    /// Find specified View, looking through subview. Only check subviews that have slamReferral string.
    /// - Parameter referral: String to look for
    /// - Returns: Optional NSView that has slamRerral string that matches referral string
    public func slamFindSubView(referral: String) -> NSView? {
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
    public func slamUpdateSubUI() {
        for v in self.subviews {
            if var ui = v as? SlamVisibleable {
                ui.slamUpdateUI()
            }
            
            v.slamUpdateSubUI()
        }
    }
    
}

#endif

