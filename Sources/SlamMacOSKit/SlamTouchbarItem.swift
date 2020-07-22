//
//  SlamTouchbarItem.swift
//  SlamMacOSKit
//
//  Created by Steve Sheets on 2/13/18.
//  Copyright © 2020 Steve Sheets. All rights reserved.
//

import Cocoa
import SlamKit

/// Closure based version of NSTouchBarItem
class SlamTouchbarItem: NSTouchBarItem, SlamReferable, SlamTaskable, SlamActionable {
    
    // MARK: SlamReferable Requirement
    
    @IBInspectable public var slamReferral: String = ""
    
    @IBInspectable public var slamWord: String = ""
    
    @IBInspectable public var slamTag: Int = 0

    // MARK: SlamTaskable Requirement
    
    @IBInspectable public var slamTaskTitle: String? = nil

    // MARK: SlamActionable Requirement
    
    public var slamActionClosure: SlamKit.ActionClosure?

    // MARK: Lifecycle

    override init(identifier: NSTouchBarItem.Identifier) {
        super.init(identifier: identifier)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
