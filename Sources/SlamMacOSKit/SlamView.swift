//
//  SlamView.swift
//  SlamMacOSKit
//
//  Created by Steve Sheets on 2/4/18.
//  Copyright © 2018 Zodiac Innovations. All rights reserved.
//

import SlamKit

#if os(macOS)

import Cocoa

public struct dummyKit {
    /// Version
    public static var kitVersion = 1
}

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

#endif

