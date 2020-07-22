//
//  SlamToolbarItem.swift
//  SlamMacOSKit
//
//  Created by Steve Sheets on 2/5/18.
//  Copyright © 2018 Zodiac Innovations. All rights reserved.
//

import Cocoa
import SlamKit

/// Closure based version of NSToolbarItem
@objc class SlamToolbarItem: NSToolbarItem, SlamReferable, SlamTaskable, SlamActionable {

    // MARK: SlamReferable Requirement
    
    @IBInspectable public var slamReferral: String = ""
    
    @IBInspectable public var slamWord: String = ""
    
    @IBInspectable public var slamTag: Int = 0

    // MARK: SlamTaskable Requirement
    
    @IBInspectable public var slamTaskTitle: String? = nil

    // MARK: SlamActionable Requirement
    
    public var slamActionClosure: SlamKit.ActionClosure?

    // MARK: Lifecycle Functions
    
    public override init(itemIdentifier: NSToolbarItem.Identifier) {
        super.init(itemIdentifier: itemIdentifier)

        autovalidates = false
    }
    
    override func validate() {
        action = #selector(slamToolbarItemAction)
        target = self

        if let _ = slamActionClosure {
            isEnabled = true
            
            return
        }
        
        guard let app = slamSharedApp as? SlamBossable,
            let title = self.self.slamTaskTitle,
            title.isNotEmpty else {
                isEnabled = false
                
                return
        }
        
        var foundTask: SlamTask? = nil
        
        foundTask = app.findTask(with: title)

        guard let task = foundTask else { return  }

        if let block = task.taskValid {
            let flag = block(self)
        
            isEnabled = flag
        }

        if let block = task.taskMark {
            let flag = block(self)
        
            isBordered = flag
        }
    }
    
    @objc public func validateUserInterfaceItem(_ item: NSValidatedUserInterfaceItem) -> Bool {
        if let _ = slamActionClosure {
            return true
        }

        guard let app = slamSharedMacApp,
            let title = self.self.slamTaskTitle,
            title.isNotEmpty else { return false }
        
        var foundTask: SlamTask? = nil
        
        foundTask = app.appFindTask(with: title, forWindow: nil)

        guard let task = foundTask else { return false }

        if let block = task.taskValid {
            let flag = block(self)
        
            return flag
        }

        return false
    }
    
    // MARK: Action Functions
    
    /// Action to to invoked when toolbar item selected.
    /// - Parameter sender: Object that invoked the method
    @IBAction @objc public func slamToolbarItemAction(_ sender: Any) {
        slamPerformAction(self)
        
        guard let title = slamTaskTitle,
            title.isNotEmpty,
            let app = slamSharedMacApp else { return }
            
        app.appRunTask(referral: self, with: title, forWindow: nil)
    }
}
