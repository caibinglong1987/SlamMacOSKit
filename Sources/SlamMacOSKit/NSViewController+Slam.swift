//
//  NSViewController+Slam.swift
//  SlamMacOSKit
//
//  Created by Sheets, Steve on 7/8/17.
//  Copyright © 2020 Sheets, Steve. All rights reserved.
//

import Cocoa
import SlamKit

// MARK: Extensions

extension NSViewController {
    
    // MARK: Public Functions

    /// Find specified View. Only check subviews that have slamReferral string.
    /// - Parameter referral: String to look for
    /// - Returns: Optional NSView that has slamRerral string that matches referral string
    public func slamFindView(referral: String) -> NSView? {
        guard !referral.isEmpty else { return nil }
        
        return view.slamFindSubView(referral: referral)
    }

    /// Invoke slamUpdateUI in all views that supports the call.
    /// - Parameter reload: Bool indicates deep data source must be reloaded (ex: list)
    public func slamUpdateAllUI(reload: Bool) {
        for v in view.subviews {
            if let ui = v as? SlamVisibleable {
                ui.slamUpdateUI(reload: reload)
            }
            
            v.slamUpdateSubUI(reload: reload)
        }
    }

    // MARK: IBAction Functions

    /// Action to dismiss Modal with OK condition
    /// - Parameter sender: Object that invoked the method
    @IBAction func modalOkAction(_ sender: Any) {
        if let _ = NSApplication.shared.modalWindow {
            NSApplication.shared.stopModal(withCode: .OK)
        }
        else {
            guard let aWindow = self.view.window, let aParent = aWindow.sheetParent else { return }
            
            aParent.endSheet(aWindow, returnCode: .OK)
        }
    }
    
    /// Action to dismiss Modal with Cancel condition
    /// - Parameter sender: Object that invoked the method
    @IBAction func modalCancelAction(_ sender: Any) {
        if let _ = NSApplication.shared.modalWindow {
            NSApplication.shared.stopModal(withCode: .cancel)
        }
        else {
            guard let aWindow = self.view.window, let aParent = aWindow.sheetParent else { return }
            
            aParent.endSheet(aWindow, returnCode: .cancel)
        }
    }
}

