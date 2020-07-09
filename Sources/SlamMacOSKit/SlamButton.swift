//
//  SlamButton.swift
//  SlamMacOSKit
//
//  Created by Sheets, Steve on 5/28/17.
//  Copyright © 2017 Sheets, Steve. All rights reserved.
//

import SlamKit

#if os(macOS)

import Cocoa

// MARK: Class

/// Closure based button
public class SlamButton: NSButton, SlamReferable, SlamVisibleable, SlamEnableable, SlamLabelable, SlamActionable {

    // MARK: SlamReferable requirements
    
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
        ui.slamUpdateEnable()
        ui.slamUpdateLabel()
    }

    // MARK: SlamEnableable Requirements
    
    public var slamEnabledState: Bool {
        get {
            isEnabled
        }
        set(value) {
            isEnabled = value
        }
    }

    public var slamEnableDataSource: SlamKit.ActionBoolClosure?

    // MARK: SlamLabelable Requirements
    
    public var slamLabeledState: String {
        get {
            title
        }
        set(value) {
            if value != title {
                title = value
            }
        }
    }

    public var slamLabelDataSource: SlamKit.ActionStringClosure?

    // MARK: SlamActionable
    
    public var slamActionClosure: SlamKit.ActionClosure?
    
    // MARK: Lifecycle Methods
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        
        self.setButtonType(.momentaryPushIn)
        self.allowsMixedState = false
        if self.target == nil {
            self.target = self
            self.action = #selector(pressedButtonAction)
        }
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        
        self.setButtonType(.momentaryPushIn)
        self.allowsMixedState = false
        if self.target == nil {
            self.target = self
            self.action = #selector(pressedButtonAction)
        }
    }
    
    // MARK: Action Methods
    
    /// Action to invoked with user presses button.
    /// - Parameter sender: Object that invoked the method
    @objc func pressedButtonAction(sender: Any!) {
        slamPerformAction()
    }

}

#endif


