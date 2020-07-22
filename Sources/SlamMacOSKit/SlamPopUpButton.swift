//
//  SlamPopUpButton.swift
//  SlamMacOSKit
//
//  Created by Steve Sheets on 4/13/20.
//  Copyright © 2020 Steve Sheets. All rights reserved.
//

import Cocoa
import SlamKit

// MARK: Class

public class SlamPopUpButton: NSPopUpButton, SlamReferable, SlamVisibleable, SlamEnableable, SlamListable, SlamNumberable {

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
        ui.slamUpdateNumber()
        
        if reload {
            let currentState = slamNumberState
            
            if let list = slamList {
                removeAllItems()
                addItems(withTitles: list)
            }
            else if let source = slamListDataSource {
                let list = source()
                
                removeAllItems()
                addItems(withTitles: list)
            }
            else if let sourceCount = slamCountDataSource, let source = slamListItemDataSource  {
                removeAllItems()
                let number = sourceCount()
                if number > 0 {
                    for count in 0...number {
                        addItem(withTitle: source(count))
                    }
                }
            }
            
            selectItem(at: currentState)
        }
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

    // MARK: SlamListable Requirements

    public var slamList: [String]?
    
    public var slamListDataSource: SlamKit.ListDataSourceClosure?
    
    public var slamCountDataSource: SlamKit.ReturnIntClosure?
    
    public var slamListItemDataSource: SlamKit.IntReturnStringClosure?

    // MARK: SlamNumberable Requirements

    public var slamNumberState: Int {
        get {
            return indexOfSelectedItem
        }
        set(value) {
            if value != indexOfSelectedItem {
                selectItem(at: value)
            }
        }
    }
    
    public var slamNumberDataSource: SlamKit.ActionIntClosure?
    
    public var slamNumberChangedEvent: SlamKit.InformIntClosure?

    // MARK: Lifecycle Functions
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        
        pullsDown = false
        self.target = self
        self.action = #selector(pressedButtonAction)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        pullsDown = false
        self.target = self
        self.action = #selector(pressedButtonAction)
    }
    
    // MARK: Action Functions
    
    /// Action to invoked with user presses button.
    /// - Parameter sender: Object that invoked the method
    @objc func pressedButtonAction(sender: Any!) {
        slamNumberChangedAction()
    }

}
