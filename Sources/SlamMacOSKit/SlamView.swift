//
//  SlamView.swift
//  SlamMacOSKit
//
//  Created by Steve Sheets on 2/4/18.
//  Copyright © 2020 Steve Sheets. All rights reserved.
//

import Cocoa
import SlamKit

// MARK: Class

/// Closure based simple view.
public class SlamView: NSView, SlamReferable, SlamVisibleable {
    
    // MARK: SlamReferable Requirments
    
    @IBInspectable public var slamReferral: String = ""

    @IBInspectable public var slamWord: String = ""

    @IBInspectable public var slamTag: Int = 0

    // MARK: SlamVisibleable Requirements
    
    public var slamVisibleState: Bool {
        get {
            !isHidden
        }
        set(value) {
            if isHidden != !value {
                isHidden = !value
            }
        }
    }
    
    public var slamVisibleDataSource: SlamKit.ActionBoolClosure?

    public func slamUpdateUI() {
        var ui = self
    
        ui.slamUpdateVisible()
    }

}
