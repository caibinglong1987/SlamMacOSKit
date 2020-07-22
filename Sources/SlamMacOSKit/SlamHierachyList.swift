//
//  SlamHierachyList.swift
//  SlamMacOSKit
//
//  Created by Steve Sheets on 7/11/20.
//  Copyright © 2020 Steve Sheets. All rights reserved.
//

import Cocoa
import SlamKit

// MARK: Class

/// Structure holding named list of Hierachys
open class SlamHierachyList: NSObject, SlamHierarchable {
    
    // MARK: Public Properties
    
    public var slamCellDataSource: SlamMacOSKit.TableCellDataSourceClosure?
    
    // MARK: SlamTitleable Requirements
    
    public var slamTitle: String = ""
    
    // MARK: SlamHierarchable Requirements
    
    public var slamHierarchyList: [Any]?
    
    public var slamHierarchyListDataSource: SlamKit.AnyListDataSourceClosure?
    
    public var slamHierarchyCountDataSource: SlamKit.ReturnIntClosure?
    
    public var slamListItemDataSource: SlamKit.IntForAnyDataSourceClosure?

    // MARK: Lifecycle
    
    public init(title: String = "", items: [Any] = [], cellDataSource: SlamMacOSKit.TableCellDataSourceClosure? = nil) {
        self.slamTitle = title
        self.slamHierarchyList = items
        self.slamCellDataSource = cellDataSource
    }
    
}

