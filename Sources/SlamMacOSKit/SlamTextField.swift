//
//  SlamTextField.swift
//  SlamCocoa
//
//  Created by Steve Sheets on 3/29/20.
//

import Cocoa
import SlamKit

/// Slam Based input style Text Field
public class SlamTextField: NSTextField, NSTextFieldDelegate, SlamReferable, SlamVisibleable, SlamEnableable, SlamTextInputable {
    
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
        ui.slamUpdateTextInput()
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

    // MARK: - SlamTextInputable Requirements
    
    public var slamTextState: String {
        get {
            return stringValue
        }
        set(value) {
            if value != stringValue {
                stringValue = value
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
    
    // MARK: - NSControlTextEditingDelegate Methods
    
    public func controlTextDidChange(_ obj: Notification) {
        if let block = slamTextChangedEvent {
            block(stringValue)
        }
    }
    
}

