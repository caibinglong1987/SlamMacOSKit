//
//  SlamMacOSKit+Types.swift
//  SlamMacOSKit
//
//  Created by Steve Sheets on 7/11/20.
//  Copyright © 2020 Steve Sheets. All rights reserved.
//

import Cocoa
import SlamKit

// MARK: Extension

// Types (typealias) & Constants extension for SlamMacOSKit

public extension SlamMacOSKit {

    // MARK: Human Readable Constants
    
    /// HumanReadable Debug String
    static let debugHRConstant = "Debug"
    
    /// HumanReadable Onboarding String
    static let onboardingHRConstant = "Onboarding"
    
    /// HumanReadable Welcome String
    static let welcomeHRConstant = "Welcome"
    
    /// HumanReadable Acknowledgment String
    static let acknowledgmentHRConstant = "Acknowledgment"
    
    /// HumanReadable License Agreement String
    static let licenseAgreementtHRConstant = "License Agreement"
    
    /// HumanReadable Reset Onboarding String
    static let resetOnboardingHRConstant = "Reset Onboarding"
    
    /// HumanReadable Welcome prefix label
    static let welcomeLabelHRConstant = "Welcome to %@"
    
    /// HumanReadable Welcome prefix label
    static let versionLabelHRConstant = "Version: %@"
    
    /// HumanReadable Onboarding Legsal prefix label
    static let onboardingLegalHRConstant = "By clicking Continue, you agree to the terms of the Software License Agreement."
    
    /// HumanReadable license agreement label
    static let agreementHRConstant = "Software License Agreement"
    
    /// HumanReadable Space String
    static let spaceHRConstant = " "
    
    /// HumanReadable OK String
    static let okHRConstant = "OK"

    /// HumanReadable Cancel String
    static let cancelHRConstant = "Cancel"

    /// HumanReadable Yes String
    static let yesHRConstant = "Yes"

    /// HumanReadable No String
    static let noHRConstant = "No"

    /// HumanReadable Continue String
    static let continueHRConstant = "Continue"

    /// HumanReadable About String
    static let aboutHRConstant = "About"

    /// HumanReadable No String
    static let areYouSureHRConstant = "Are you sure you wish to do this?"

    // MARK: TypesAlias

    /// closure to return NSViewController
    typealias ViewControllerDataSourceClosure = () -> NSViewController

    /// closure to return Table Cell (with given width) based on given data
    typealias TableCellDataSourceClosure = (Any, Int) -> NSTableCellView

}
