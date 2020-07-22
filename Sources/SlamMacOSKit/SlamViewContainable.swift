//
//  SlamViewContainable.swift
//  SlamMacOSKit
//
//  Created by Steve Sheets on 7/21/20.
//  Copyright © 2020 Steve Sheets. All rights reserved.
//

import Cocoa

// MARK: Protocols

public protocol SlamViewContainable: NSView, SlamVisibleable {
    
    // MARK: Required Properties
    
    var containerCount: Int { get set }
    
    // MARK: Required Functions
    
    /// Embed child view
    /// - Parameters:
    ///   - view: NSView to embed
    ///   - position: Int position of container to fill
    func containerLoad(view: NSView, position: Int)
    
    /// Embed child view controller
    /// - Parameters:
    ///   - viewController: NSViewController to embed
    ///   - position: Int position of container to fill
    func containerLoad(viewController: NSViewController, position: Int)
    
    /// Remove embeded child view & view controller (at given location)
    /// - Parameter position: Int position of container to clean out
    func containerRemove(position: Int)

}
