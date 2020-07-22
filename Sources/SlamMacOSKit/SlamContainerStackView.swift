//
//  SlamContainerStackView.swift
//  SlamMacOSKit
//
//  Created by Steve Sheets on 4/4/20.
//  Copyright © 2020 Steve Sheets. All rights reserved.
//

import Cocoa
import SlamKit

// MARK: Class

/// Closure based  stack view
public class SlamContainerStackView: NSStackView, NSStackViewDelegate, SlamReferable, SlamVisibleable, SlamEnableable, SlamViewContainable, SlamSpecialViewable {
    
    // MARK: Private Properties
    
    var myEnabledFlag = true

    // MARK: SlamReferable Requirement
    
    @IBInspectable public var slamReferral: String = ""
    
    @IBInspectable public var slamWord: String = ""
    
    @IBInspectable public var slamTag: Int = 0
    
    // MARK: SlamVisibleable Requirement
    
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
    }

    // MARK: SlamEnableable Requirements
    
    public var slamEnabledState: Bool {
        get {
            myEnabledFlag
        }
        set(value) {
            myEnabledFlag = value
 
            for sub in views {
                if var view = sub as? SlamEnableable {
                    view.slamEnabledState = myEnabledFlag
                }
            }
        }
    }

    public var slamEnableDataSource: SlamKit.ActionBoolClosure?

    // MARK: SlamViewContainable Requirement
    
    public var containerCount: Int {
        get {
            0 // later
        }
        set(value) {
        }
    }
    
    public func containerLoad(view: NSView, position: Int) {
        guard position == 0 else { return }

        containerRemove(position: position)

        // later
    }
    
    public func containerLoad(viewController: NSViewController, position: Int) {
        guard position == 0, let _ = window?.contentViewController else { return }
        let _ = viewController.view

        containerRemove(position: position)
           
        // later
    }

    public func containerRemove(position: Int) {
        guard position == 0 else { return }

        // later
    }
    
    // MARK: SlamSpecialViewable Requirements
    
    public func slamSpecialUpdateSubUI(reload: Bool) {
        for sub in views {
            sub.slamUpdateSubUI(reload: reload)
        }
    }
    
    public func slamSpecialFindSubView(referral: String) -> NSView? {
        for sub in views {
            if let result = sub.slamFindSubView(referral: referral) {
                return result
            }
        }
        
        return nil
    }
    
    // MARK: Lifecycle

    public override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        
        delegate = self
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        delegate = self
    }
}

