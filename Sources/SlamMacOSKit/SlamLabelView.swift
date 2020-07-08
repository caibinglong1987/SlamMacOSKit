//
//  SlamLabelView.swift
//  SlamMacOSKit
//
//  Created by Sheets, Steve on 5/27/17.
//  Copyright © 2017 Sheets, Steve. All rights reserved.
//

import Cocoa
import SlamKit

// MARK: - Class

/// Slam Based Label style Text Field
public class SlamLabelView: NSTextField, SlamReferable, SlamVisibleable, SlamEnableable, SlamLabelable {
    
    // MARK: - SlamReferable requirements
    
    @IBInspectable public var slamReferral: String = ""

    @IBInspectable public var slamWord: String = ""

    @IBInspectable public var slamTag: Int = 0

    // MARK: - SlamVisibleable Requirements
    
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
        ui.slamUpdateEnable()
        ui.slamUpdateLabel()
    }

    // MARK: - SlamEnableable Requirements
    
    public var slamEnabledState: Bool {
        get {
            isEnabled
        }
        set(value) {
            isEnabled = value
        }
    }

    public var slamEnableDataSource: SlamKit.ActionBoolClosure?

    // MARK: - SlamLabelable Requirements
    
    public var slamLabeledState: String {
        get {
            stringValue
        }
        set(value) {
            if value != stringValue {
                stringValue = value
            }
        }
    }

    public var slamLabelDataSource: SlamKit.ActionStringClosure?

}


