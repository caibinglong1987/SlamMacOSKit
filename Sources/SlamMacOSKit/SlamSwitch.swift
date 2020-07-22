//
//  SlamSwitch.swift
//  SlamMacOSKit
//
//  Created by Steve Sheets on 4/8/20.
//  Copyright © 2020 Steve Sheets. All rights reserved.
//

import Cocoa
import SlamKit

@available(OSX 10.15, *)
public class SlamSwitch: NSSwitch, SlamReferable, SlamVisibleable, SlamEnableable, SlamSwitchable {
    
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

    // MARK: SlamSwitchable Requirement
    
    public var slamSwitchState: Bool {
        get {
            return (state == .on)
        }
        set(value) {
            if value {
                if state != .on {
                    state = .on
                }
            }
            else {
                if state != .off {
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
       
       self.target = self
       self.action = #selector(pressedButtonAction)
    }

    required public init?(coder: NSCoder) {
       super.init(coder: coder)
       
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
