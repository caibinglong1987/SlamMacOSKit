//
//  NSViewController+Slam.swift
//  SlamMacOSKit
//
//  Created by Sheets, Steve on 7/8/17.
//  Copyright © 2020 Sheets, Steve. All rights reserved.
//

import Cocoa
import SlamKit

// MARK: Extensions

extension NSViewController {
    
    /// Find specified View. Only check subviews that have slamReferral string.
    /// - Parameter referral: String to look for
    /// - Returns: Optional NSView that has slamRerral string that matches referral string
    public func slamFindView(referral: String) -> NSView? {
        guard !referral.isEmpty else { return nil }
        
        return view.slamFindSubView(referral: referral)
    }

    /// Invoke slamUpdateUI in all views that supports the call.
    public func slamUpdateAllUI() {
        for v in view.subviews {
            if var ui = v as? SlamVisibleable {
                ui.slamUpdateUI()
            }
            
            v.slamUpdateSubUI()
        }
    }

}

