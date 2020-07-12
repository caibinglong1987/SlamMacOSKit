//
//  SlamHierachyList.swift
//  SlamMacOSKit
//
//  Created by Steve Sheets on 7/11/20.
//  Copyright © 2020 Steve Sheets. All rights reserved.
//

import Cocoa
import SlamKit

// MARK: - Class

/// Structure holding named list of Hierachys
open class SlamHierachyList: NSObject, SlamHierarchable {
    
    // MARK: Public Properties
    
    public var slamCellDataSource: SlamMacOSKit.TableCellDataSourceClosure?
    
    // MARK: SlamTitleable Requiremetns
    
    public var slamTitle: String = ""
    
    // MARK: SlamHierarchable Requiremetns
    
    public var slamHierarchyList: [SlamHierarchable]?
    
    public var slamHierarchyListDataSource: SlamKit.HierarchyListDataSourceClosure?
    
    public var slamHierarchyCountDataSource: SlamKit.ReturnIntClosure?
    
    public var slamListItemDataSource: SlamKit.IntHierarchyDataSourceClosure?
    
    // MARK: Lifecycle
    
    init(title: String = "", items: [SlamHierarchable] = [], cellDataSource: SlamMacOSKit.TableCellDataSourceClosure? = nil) {
        self.slamTitle = title
        self.slamHierarchyList = items
        self.slamCellDataSource = cellDataSource
    }
    
}

