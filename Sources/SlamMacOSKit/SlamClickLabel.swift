//
//  SlamClickLabel.swift
//  SlamMacOSKit
//
//  Created by Steve Sheets on 4/6/20.
//  Copyright © 2020 Steve Sheets. All rights reserved.
//

import Cocoa
import SlamKit

// MARK: Class

/// Slam Based Actionable Label style Text Field
@objcMembers public class SlamClickLabel: NSTextField, SlamReferable, SlamVisibleable, SlamEnableable, SlamLabelable, SlamActionable, SlamTaskable, SlamClickGesturable {

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
            stringValue
        }
        set(value) {
            if value != stringValue {
                stringValue = value
            }
        }
    }

    public var slamLabelDataSource: SlamKit.ActionStringClosure?

    // MARK: SlamActionable
    
    public var slamActionClosure: SlamKit.ActionClosure?
    
    // MARK: SlamTaskable Requirement
    
    @IBInspectable public var slamTaskTitle: String? = nil

    // MARK: Lifestyle
    
    public override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        
        textColor = .linkColor
        allowsEditingTextAttributes = true
            
        SlamClickGesture.addClickGesture(self)

        underline(text: stringValue)
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        textColor = .linkColor
        allowsEditingTextAttributes = true

        SlamClickGesture.addClickGesture(self)

        underline(text: stringValue)
    }
    
    // MARK: Public Functions
    
    /// Set text to given string with underline attribute
    /// - Parameter text: String to use to underline
    public func underline(text: String) {
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string:text)
        attributeString.addAttribute(NSAttributedString.Key.underlineStyle, value: 1, range: NSMakeRange(0, attributeString.length))
        attributedStringValue = attributeString
    }
    
}

