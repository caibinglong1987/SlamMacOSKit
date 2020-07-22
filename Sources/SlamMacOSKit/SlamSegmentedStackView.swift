//
//  SlamSegmentedStackView.swift
//  SlamMacOSKit
//
//  Created by Steve Sheets on 4/4/20.
//  Copyright © 2020 Steve Sheets. All rights reserved.
//

import Cocoa
import SlamKit

// MARK: Class

/// Closure based  stack view
public class SlamSegmentedStackView: NSStackView, NSStackViewDelegate, SlamReferable, SlamVisibleable, SlamEnableable, SlamNumberable, SlamSpecialViewable {
    
    // MARK: Private Properties
    
    var myEnabledFlag = true

    var myMarkNumber = -1

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
        ui.slamUpdateNumber()
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

    // MARK: SlamNumberable Requirements

    public var slamNumberState: Int {
        get {
            return myMarkNumber
        }
        set(value) {
            if value != myMarkNumber {
                myMarkNumber = value
                
                var count = 0
                for sub in views {
                    if var view = sub as? SlamSwitchable {
                        view.slamSwitchState = (myMarkNumber == count)
                    }
                    
                    count = count + 1
                }
            }
        }
    }
    
    public var slamNumberDataSource: SlamKit.ActionIntClosure?
    
    public var slamNumberChangedEvent: SlamKit.InformIntClosure?

    // MARK: Public Functions
    
    public func stackClear() {
        let list = views
        for sub in list {
            removeView(sub)
        }
    }
    
    public func stackAdd(view: NSView) {
        addView(view, in: .center)
    }
    
    public func stackList() -> [NSObject] {
        return views
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

