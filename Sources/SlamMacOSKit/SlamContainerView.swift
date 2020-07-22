//
//  SlamContainerView.swift
//  SlamMacOSKit
//
//  Created by Steve Sheets on 4/8/20.
//  Copyright © 2020 Steve Sheets. All rights reserved.
//

import Cocoa
import SlamKit

// MARK: Class

public class SlamContainerView: NSView, SlamReferable, SlamVisibleable, SlamSpecialViewable, SlamViewContainable {
    
    // MARK: Private Properties
    
    /// Private reference to child view contraier
    private var myChildViewController: NSViewController? = nil

    /// Private reference to child view
    private var myChildView: NSView? = nil

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

    // MARK: SlamSpecialViewable Requirements
    
    public func slamSpecialFindSubView(referral: String) -> NSView? {
        return nil // later
    }

    public func slamSpecialUpdateSubUI(reload: Bool) {
        // later
    }
    
    // MARK: SlamViewContainable Requirement
    
    public var containerCount: Int {
        get {
            1
        }
        set(value) {
        }
    }
    
    public func containerLoad(view: NSView, position: Int) {
        guard position == 0 else { return }

        containerRemove(position: position)

         view.frame = self.bounds
         self.addSubview(view)
        
         myChildView = view
    }
    
    public func containerLoad(viewController: NSViewController, position: Int) {
        guard position == 0, let parentViewController = window?.contentViewController else { return }
        let view = viewController.view

        containerRemove(position: position)
           
        parentViewController.addChild(viewController)
        view.frame = self.bounds
        self.addSubview(view)
       
        myChildViewController = viewController
        myChildView = view
    }

    public func containerRemove(position: Int) {
        guard position == 0 else { return }

        if let view = myChildView {
            view.removeFromSuperview()
        }
        if let viewController = myChildViewController {
            viewController.removeFromParent()
        }

        myChildViewController = nil
        myChildView = nil
    }
    
}


