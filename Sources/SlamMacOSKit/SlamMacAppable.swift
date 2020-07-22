//
//  SlamMacAppable.swift
//  SlamMacOSKit
//
//  Created by Steve Sheets on 7/18/20.
//  Copyright © 2020 Steve Sheets. All rights reserved.
//

import Cocoa
import SlamKit

// MARK: Globals

/// Global Mac Slam App
var slamSharedMacApp : SlamMacAppable? {
  get {
    return slamSharedApp as? SlamMacAppable
  }
}

// MARK: Protocol

protocol SlamMacAppable: SlamAppable {
    
    // MARK: Required Functions
    
    /// App find a Task,wtih given name.
    ///
    /// - Parameter title: String Name of task to find
    /// - Parameter window: Optional NSWindow to search. If nil, will use apps main window
    /// - Returns: Task
    func appFindTask(with title: String, forWindow window: NSWindow?) -> SlamTask?

    /// Run find a Task,wtih given name.
    ///
    /// - Parameter referral: Optional SlamReferable that invoked run
    /// - Parameter title: String Name of task to find
    /// - Parameter window: Optional NSWindow to search. If nil, will use apps main window
    func appRunTask(referral: SlamReferable?, with title: String, forWindow window: NSWindow?)

}
