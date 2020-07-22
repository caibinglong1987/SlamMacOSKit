//
//  SlamClickGesturable.swift
//  SlamMacOSKit
//
//  Created by Steve Sheets on 7/20/20.
//  Copyright © 2020 Steve Sheets. All rights reserved.
//

import Cocoa
import SlamKit

// MARK: Class

public class SlamClickGesture: NSClickGestureRecognizer {
    
    // MARK: Public Properties
    
    /// Weak link to actionable view to invoke
    private weak var myActionItem: SlamClickGesturable?
    
    // MARK: Public Functions
    
    @objc public func clickAction(sender: Any!) {
        if let item = myActionItem {
            item.slamPerformAction(item)
            
            guard let title = item.slamTaskTitle,
                title.isNotEmpty,
                let app = slamSharedMacApp else { return }
                
            app.appRunTask(referral: item, with: title, forWindow: nil)
        }
    }
    
    // MARK: Static Functions
    
    /// Add a single click gesture to  view. Click will cause invoke of  action.
    static public func addClickGesture(_ clicker: SlamClickGesturable) {
        let gesture = SlamClickGesture(target: nil, action: nil)
        gesture.target = gesture
        gesture.action = #selector(clickAction)
        gesture.myActionItem = clicker
        clicker.addGestureRecognizer(gesture)
    }

}


// MARK: Protocols

/// Protocol to support click gesgture for action or task.
public protocol SlamClickGesturable: NSView, SlamActionable, SlamTaskable {
    
}
