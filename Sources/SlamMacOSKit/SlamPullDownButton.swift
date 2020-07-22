//
//  SlamPullDownButton.swift
//  SlamMacOSKit
//
//  Created by Steve Sheets on 4/19/20.
//  Copyright © 2020 Steve Sheets. All rights reserved.
//

import Cocoa
import SlamKit

// MARK: Class

/// Closure labeled based button that has drop down menu with Tasks on it
public class SlamPullDownButton: NSPopUpButton, SlamReferable, SlamEnableable, SlamLabelable, SlamVisibleable, SlamMenuItemable {

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

    // MARK: SlamMenuItemable Requirment
    
    public func addTaskMenuItem(command: String, title: String, word: String? = nil, tag: Int? = nil) {
        if let aMenu = menu {
            let aMenuItem = SlamMenuItem(title: title, action: nil, keyEquivalent: "")
            aMenuItem.slamTaskTitle = command
            if let word = word {
                aMenuItem.slamWord = word
            }
            if let tag = tag {
                aMenuItem.slamTag = tag
            }
            aMenu.addItem(aMenuItem)
        }
    }
        
    public func addTaskSeperator() {
        if let aMenu = menu {
            aMenu.addItem(NSMenuItem.separator())
        }
    }

    // MARK: Lifecycle Functions
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        
        pullsDown = true
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        pullsDown = true
    }
}
