//
//  SlamCheckbox.swift
//  SlamMacOSKit
//
//  Created by Steve Sheets on 4/7/20.
//  Copyright © 2020 Steve Sheets. All rights reserved.
//

import Cocoa
import SlamKit

// MARK: Class

/// Closure based checkbox
public class SlamCheckboxView: NSButton, SlamReferable, SlamVisibleable, SlamEnableable, SlamLabelable, SlamSwitchable {

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

    public func slamUpdateUI(reload: Bool){
        var ui = self
        
        ui.slamUpdateVisible()
        ui.slamUpdateEnable()
        ui.slamUpdateLabel()
        ui.slamUpdateSwitch()
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


    // MARK: SlamSwitchable Requirement
    
    public var slamSwitchState: Bool {
        get {
            (state == .on)
        }
        set(value) {
            if value {
                if (state != .on) {
                    state = .on
                }
            }
            else {
                if (state != .off) {
                    state = .off
                }
            }
        }
    }
        
    public var slamSwitchDataSource: SlamKit.ActionBoolClosure?
    
    public var slamSwitchChangedEvent: SlamKit.InformBoolClosure?

    // MARK: Lifecycle Functions
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        
        self.setButtonType(.switch)
        self.allowsMixedState = false
        self.target = self
        self.action = #selector(pressedButtonAction)
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        
        self.setButtonType(.switch)
        self.allowsMixedState = false
        self.target = self
        self.action = #selector(pressedButtonAction)
    }
    
    // MARK: Action Functions
    
    /// Action to invoked with user presses button.
    /// - Parameter sender: Object that invoked the method
    @objc func pressedButtonAction(sender: Any!) {
        slamSwitchChangedAction()
    }

    
}


