//
//  NSView+Slam.swift
//  SlamMacOSKit
//
//  Created by Sheets, Steve on 7/11/17.
//  Copyright © 2020 Sheets, Steve. All rights reserved.
//

import Cocoa
import SlamKit

// MARK: Extensions

extension NSObject {
    
    // MARK: Public Functions
    
    /// Get the title (string) of object, using slamTitle if available, otherwise use description.
    var slamGetTitle: String {
        if let t = self as? SlamTitleable {
            return t.slamTitle
        }

        return self.description
    }

}

