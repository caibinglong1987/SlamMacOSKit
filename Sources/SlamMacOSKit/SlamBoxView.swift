//
//  SlamBoxView.swift
//  SlamMacOSKit
//
//  Created by Steve Sheets on 4/14/20.
//  Copyright © 2020 Steve Sheets. All rights reserved.
//

import Cocoa
import SlamKit

public class SlamBoxView: NSBox, SlamReferable, SlamVisibleable  {
    
    // MARK: SlamReferable requirements
    
    @IBInspectable public var slamReferral: String = ""

    @IBInspectable public var slamWord: String = ""

    @IBInspectable public var slamTag: Int = 0

    // MARK: SlamVisibleable Requirements
    
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
    }

}
