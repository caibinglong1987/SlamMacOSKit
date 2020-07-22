//
//  SlamImageable.swift
//  SlamMacOSKit
//
//  Created by Steve Sheets on 4/10/20.
//  Copyright © 2020 Steve Sheets. All rights reserved.
//

import Cocoa
import SlamKit

// MARK: Protocols

/// Protocol to support having image
public protocol SlamImageable: SlamReferable {

    // MARK: Required Properties
    
    /// Closure type that is passed Task Info, and returns optional Image.
    typealias ActionImageClosure = (SlamReferable?) -> NSImage?

    // MARK: Properties

    /// image state
    var slamImageState: NSImage? { get set }

    /// Optional image source closure
    var slamImageDataSource: ActionImageClosure? { get set }

}

// MARK: Extension

public extension SlamImageable {
    
    /// Load image into state
    /// - Parameter name: String name to use
    mutating func loadImage(_ name: String) {
        guard name.isNotEmpty, let image = NSImage(named: name) else { return }
        
        slamImageState = image
    }

    /// update UI based on Image State closure
    mutating func slamUpdateImageable() {
        if let block = slamImageDataSource {
            self.slamImageState = block(self)
        }
    }
}

