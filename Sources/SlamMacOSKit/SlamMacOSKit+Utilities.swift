//
//  SlamMacOSKit+Utilities.swift
//  SlamMacOSKit
//
//  Created by Steve Sheets on 7/19/20.
//  Copyright © 2020 Steve Sheets. All rights reserved.
//

import Cocoa
import SlamKit

// MARK: Extension

// Utilities extension for SlamMacOSKit

public extension SlamMacOSKit {
    
    // MARK: Public Static Functions

    /// Alert for asking question. With Yes/No response expected
    /// - Parameters:
    ///   - text: String main text to display
    ///   - info: Optional String for info text
    ///   - iconName: Optional String for name of icon used
    ///   - critical: critical description
    ///   - ok: Optional String for OK button title
    ///   - cancel: Optional String for Cancel button title
    /// - Returns: Bool true is user hit OK
    static func standardOKCancel(_ text: String, info: String? = nil, iconName: String? = nil, critical:  Bool = false, okName: String = SlamMacOSKit.okHRConstant, cancelName: String = SlamMacOSKit.cancelHRConstant) -> Bool {
        let alert = NSAlert()
        alert.messageText = text
        if let info = info {
            alert.informativeText = info
        }
        if let iconName = iconName {
            if let icon = NSImage(named: iconName) {
                alert.icon = icon
            }
        }
        if critical {
            alert.alertStyle = .critical
        }
        alert.addButton(withTitle: okName)
        alert.addButton(withTitle: cancelName)
        
        return alert.runModal() == .alertFirstButtonReturn
    }
    
    /// Alert confirming you are sure. With Yes/No response expected
    /// - Parameter info: Optional String with info to add
    /// - Returns: Bool True if user selected yes
    static func standardAreYouSureMessage(info: String? = nil) -> Bool {
        return standardOKCancel(SlamMacOSKit.areYouSureHRConstant, info: info, okName: SlamMacOSKit.yesHRConstant, cancelName: SlamMacOSKit.noHRConstant)

    }

    /// Alert for asking question. With Yes/No response expected
    /// - Parameters:
    ///   - text: String main text to display
    ///   - info: Optional String for info text
    ///   - iconName: Optional String for name of icon used
    ///   - critical: critical description
    ///   - ok: Optional String for OK button title
    static func standardMessage(_ text: String, info: String? = nil, iconName: String? = nil, critical:  Bool = false, okName: String = SlamMacOSKit.okHRConstant) {
        let alert = NSAlert()
        alert.messageText = text
        if let info = info {
            alert.informativeText = info
        }
        if let iconName = iconName {
            if let icon = NSImage(named: iconName) {
                alert.icon = icon
            }
        }
        if critical {
            alert.alertStyle = .critical
        }
        alert.addButton(withTitle: okName)
        
        _ = alert.runModal()
    }

    /// Given string, open Safari with that Link
    /// - Parameter link: String text to open.
    static func openURL(_ link: String) {
        guard link.isNotEmpty, let aURL = URL(string: link) else { return }
        
        NSWorkspace.shared.open(aURL)
    }

    /// Given string, open bundled file with that name
    /// - Parameter link: String File to open.
    static func openBundledFile(_ name: String) {
       guard name.isNotEmpty, let aPath = Bundle.main.path(forResource: name, ofType: nil) else { return }
        
       NSWorkspace.shared.openFile(aPath, withApplication: nil)
    }
    
    /// Given string, open Help wtih that section
    /// - Parameter link: String Help to open.
    static func openHelp(_ name: String? = nil) {
        NSApplication.shared.showHelp(nil)
        
        // guard name.isNotEmpty else { return }
        // NSHelpManager.shared.find(name, inBook: nil)
    }
    
}
