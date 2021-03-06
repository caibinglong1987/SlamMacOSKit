//
//  SlamMenuItem.swift
//  SlamMacOSKit
//
//  Created by Steve Sheets on 2/5/18.
//  Copyright © 2020 Steve Sheets. All rights reserved.
//

import Cocoa
import SlamKit

// MARK: Class

/// Closure based version of NSMenuItem
@objc public class SlamMenuItem: NSMenuItem, SlamReferable, SlamTaskable, SlamActionable {
    
    // MARK: SlamReferable Requirement
    
    @IBInspectable public var slamReferral: String = ""
    
    @IBInspectable public var slamWord: String = ""
    
    @IBInspectable public var slamTag: Int = 0

    // MARK: SlamTaskable Requirement
    
    @IBInspectable public var slamTaskTitle: String? = nil

    // MARK: SlamActionable Requirement
    
    public var slamActionClosure: SlamKit.ActionClosure?

    // MARK: Lifecycle Functions
    
    public override init(title string: String, action selector: Selector?, keyEquivalent charCode: String) {
        super.init(title:string, action:selector, keyEquivalent:charCode)
        
        action = #selector(slamMenuAction)
        target = self
    }
    
    public required init(coder decoder: NSCoder) {
        super.init(coder: decoder)
        
        action = #selector(slamMenuAction)
        target = self
    }
    
    @objc public func validatesUserInterfaceItem(_ item: NSValidatedUserInterfaceItem) -> Bool {
        let actionSelector = #selector(slamMenuAction)
        if item.action == actionSelector {
            if let _ = slamActionClosure {
                return true
            }
            
            guard let app = slamSharedMacApp,
                let title = self.self.slamTaskTitle,
                title.isNotEmpty else { return false }
            
            var foundTask: SlamTask? = nil
            
            foundTask = app.appFindTask(with: title, forWindow: nil)

            guard let task = foundTask else { return false }
            
            if let taskMark = task.taskMark {
                if taskMark(self) {
                    self.state = .on
                } else {
                    self.state = .off
                }
            } else {
                self.state = .off
            }

            if let source = task.taskLabel {
                self.title = source(self)
            }

            if let source = task.taskValid {
                self.isEnabled =  source(self)
            }

            return task.validateTask(self)
        }
        
        return false
    }
    
    // MARK: Action Functions
    
    /// Action to to invoked when menu item selected.
    /// - Parameter sender: Object that invoked the method
    @objc @IBAction public func slamMenuAction(_ sender: Any) {
        slamPerformAction(self)

        guard let title = slamTaskTitle,
            title.isNotEmpty,
            let app = slamSharedMacApp else { return }
            
        app.appRunTask(referral: self, with: title, forWindow: nil)
    }
}
