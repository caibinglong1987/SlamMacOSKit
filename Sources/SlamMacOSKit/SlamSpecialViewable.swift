//
//  SlamSpecialViewable.swift
//  SlamMacOSKit
//
//  Created by Steve Sheets on 4/10/20.
//  Copyright © 2020 Steve Sheets. All rights reserved.
//

import Cocoa
import SlamKit

// MARK: Protocols

/// Protocol for Slam  Views with special features (usually holding other views oddly)
public protocol SlamSpecialViewable{

    // MARK: Required Functions
    
    /// Find specified View, looking through subview. Only check subviews that have slamReferral string.
    /// - Parameter referral: String to look for
    /// - Returns: Optional NSView that has slamRerral string that matches referral string
    func slamSpecialFindSubView(referral: String) -> NSView?

    /// Returns an  item with given referral from subviews
    ///
    /// Special slamUpdateUI in all subviews that supports the call.
    /// - Parameter reload: Bool indicates deep data source must be reloaded (ex: list)
    func slamSpecialUpdateSubUI(reload: Bool)

}
