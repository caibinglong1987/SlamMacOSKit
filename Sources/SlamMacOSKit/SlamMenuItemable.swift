//
//  SlamMenuItemable.swift
//  SlamMacOSKit
//
//  Created by Steve Sheets on 7/21/20.
//  Copyright © 2020 Steve Sheets. All rights reserved.
//

import Cocoa
import SlamKit

// MARK: Protocols

/// Protocol to support add menuitems to item
public protocol SlamMenuItemable: SlamReferable {

    // MARK: Required Functions

    /// Add Task with given title and associated info
    ///   - command: String command task to attach to item
    ///   - title: String title of item
    ///   - word: String optional task word to attach to item
    ///   - tag: String optional task tag to attach to item
    func addTaskMenuItem(command: String, title: String, word: String?, tag: Int?)
    
    /// Add cosmetic seperator menu item
    func addTaskSeperator()

}
