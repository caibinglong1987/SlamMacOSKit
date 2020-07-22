//
//  SlamSplit.swift
//  SlamMacOSKit
//
//  Created by Steve Sheets on 4/13/20.
//  Copyright © 2020 Steve Sheets. All rights reserved.
//

import Cocoa
import SlamKit

// MARK: Class

public class SlamSplit: NSSplitView, NSSplitViewDelegate, SlamReferable, SlamVisibleable, SlamViewContainable {    

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
    }

    // MARK: SlamViewContainable Requirement
    
    public var containerCount: Int {
        get {
            return arrangedSubviews.count
        }
        set(value) {
        }
    }
    
    public func containerLoad(view: NSView, position: Int) {
        // later
    }
    
    public func containerLoad(viewController: NSViewController, position: Int) {
        // later
    }
    
    public func containerRemove(position: Int) {
        // later
    }
    
    // MARK: Public Properties
    
    @IBInspectable var minFirst: Int = 10000

    @IBInspectable var minSecond: Int = 10000
    
    @IBInspectable var minThird: Int = 10000
    
    @IBInspectable var minFourth: Int = 10000

    // MARK: Lifecycle Functions
    
    override init(frame frameRect: NSRect) {
        super.init(frame:frameRect);
        
         delegate = self
    }

     required init?(coder: NSCoder) {
         super.init(coder: coder)
        
         delegate = self
     }

// MARK: NSSplitViewDelegate

    public func splitView(_ splitView: NSSplitView, constrainMinCoordinate proposedMinimumPosition: CGFloat, ofSubviewAt dividerIndex: Int) -> CGFloat {

//        NSLog("Split Min %f, for Divide %i", proposedMinimumPosition, dividerIndex)


        if dividerIndex==0 {
            return proposedMinimumPosition+CGFloat(minFirst)
        }
        if dividerIndex==1 {
            return proposedMinimumPosition+CGFloat(minSecond)
        }
        if dividerIndex==2 {
            return proposedMinimumPosition+CGFloat(minThird)
        } 

        return proposedMinimumPosition
    }
    
    public func splitView(_ splitView: NSSplitView, constrainMaxCoordinate proposedMaximumPosition: CGFloat, ofSubviewAt dividerIndex: Int) -> CGFloat {
        
//        NSLog("Split Max %f, for Divide %i", proposedMaximumPosition, dividerIndex)

        if dividerIndex==0 {
            return proposedMaximumPosition-CGFloat(minSecond)
        }
        if dividerIndex==1 {
            return proposedMaximumPosition-CGFloat(minThird)
        }
        if dividerIndex==2 {
            return proposedMaximumPosition-CGFloat(minFourth)
        }

        return proposedMaximumPosition
    }

}
