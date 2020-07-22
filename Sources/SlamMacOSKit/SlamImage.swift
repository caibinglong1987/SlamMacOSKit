//
//  SlamImage.swift
//  SlamMacOSKit
//
//  Created by Steve Sheets on 4/4/20.
//  Copyright © 2020 Steve Sheets. All rights reserved.
//

import Cocoa
import SlamKit

public class SlamImage: NSImageView, SlamReferable, SlamEnableable, SlamVisibleable, SlamImageable {
    
    // MARK: SlamReferable Requirement
    
    @IBInspectable public var slamReferral: String = ""
    
    @IBInspectable public var slamWord: String = ""
    
    @IBInspectable public var slamTag: Int = 0
    
    // MARK: SlamVisibleable Requirement
    
    public var slamVisibleState: Bool {
        get {
            !isHidden
        }
        set(value) {
            if isHidden != !value {
                isHidden = !value
            }
        }
    }

    public var slamVisibleDataSource: SlamKit.ActionBoolClosure?
    
    public func slamUpdateUI(reload: Bool){
        var ui = self
        
        ui.slamUpdateVisible()
        ui.slamUpdateEnable()
        ui.slamUpdateImageable()
    }

    // MARK: SlamImageable Requirement
    
    public var slamImageState: NSImage? {
        get {
            image
        }
        set(value) {
            if value != image {
                image = value
            }
        }
    }

    public var slamImageDataSource: ActionImageClosure?

    // MARK: SlamEnableable Requirement
    
    public var slamEnabledState: Bool {
        get {
            isEnabled
        }
        set(value) {
            isEnabled = value
        }
    }

    public var slamEnableDataSource: SlamKit.ActionBoolClosure?
        
}
