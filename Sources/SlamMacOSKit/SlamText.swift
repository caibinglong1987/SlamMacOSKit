//
//  SlamText.swift
//  SlamMacOSKit
//
//  Created by Steve Sheets on 4/14/20.
//  Copyright © 2020 Steve Sheets. All rights reserved.
//

import Cocoa
import SlamKit

// MARK: - Class

/// Slam Based Text View
public class SlamText: NSTextView, NSTextDelegate, NSTextViewDelegate, SlamReferable, SlamVisibleable, SlamTextInputable {
    
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
        ui.slamUpdateTextInput()
    }

    // MARK: - SlamTextInputable Requirements
    
    public var slamTextState: String {
        get {
            return string
        }
        set(value) {
            if value != string {
                string = value
            }
        }
    }
    
    public var slamTextDataSource: SlamKit.ActionStringClosure?
    
    public var slamTextChangedEvent: SlamKit.InformStringClosure?

    // MARK: - Lifecycle

    public override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        
        delegate = self
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        delegate = self
    }

    // MARK: - NSTextDelegate

    public func textDidChange(_ notification: Notification) {
        if let block = slamTextChangedEvent {
            block(self.string)
        }
    }

}
