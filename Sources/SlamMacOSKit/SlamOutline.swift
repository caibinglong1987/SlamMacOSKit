//
//  SlamOutline.swift
//  SlamMacOSKit
//
//  Created by Steve Sheets on 7/10/20.
//  Copyright © 2020 Steve Sheets. All rights reserved.
//

import Cocoa
import SlamKit

// MARK: Class

/// Slam Based OutlineView
public class SlamOutline: NSOutlineView, NSOutlineViewDataSource, NSOutlineViewDelegate, SlamReferable, SlamVisibleable {

    // MARK: Public Properties
    
    /// List of items to display in outline
    public var slamHierharcyList: [AnyObject]?
    
    /// Closure to invoke when making Table Cells (if blank, used standard text table view cells).
    public var slamMakeTableCell: SlamMacOSKit.TableCellDataSourceClosure?
    
    // Flag to indicate the groups items should use group UI
    public var slamUseGroupUI = true
    
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

    public func slamUpdateUI() {
        var ui = self
        
        ui.slamUpdateVisible()
        
        reloadData()
    }
    
    // MARK: - Lifecycle Methods
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        
        dataSource = self
        delegate = self
        allowsMultipleSelection = false
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        dataSource = self
        delegate = self
        allowsMultipleSelection = false
    }
    
    // MARK: - NSOutlineViewDataSource Methods
    
    public func outlineView(_ outlineView: NSOutlineView, numberOfChildrenOfItem item: Any?) -> Int {
        if item==nil {
            if let list = slamHierharcyList {
                return list.count
            }
        }
        else if let hierarchy = item as? SlamHierarchable {
            if let list = hierarchy.slamHierarchyList {
                return list.count
            }
            else if let block = hierarchy.slamHierarchyListDataSource {
                if let list = block() {
                    return list.count
                }
            }
            else if let block = hierarchy.slamHierarchyCountDataSource {
                return block()
            }
        }
        else if let list = item as? [Any] {
            return list.count
        }
        
        return 0
    }
    
    public func outlineView(_ outlineView: NSOutlineView, child index: Int, ofItem item: Any?) -> Any {
        var useList: [Any] = []

        if item == nil {
            if let list = slamHierharcyList {
                let aCount = list.count
                if index>=0 && aCount>0 && index<aCount {
                    return list[index]
                }
            }
        }
        else if let hierarchy = item as? SlamHierarchable {
            if let list = hierarchy.slamHierarchyList {
                useList = list
            }
            else if let block = hierarchy.slamHierarchyListDataSource {
                if let list = block() {
                    useList = list
                }
            }
            else if let block = hierarchy.slamListItemDataSource {
                if let result = block(index) {
                    return result
                }
            }
        }
        else if let list = item as? [Any] {
            useList = list
        }

        let aCount = useList.count
        if index>=0 && aCount>0 && index<aCount {
            return useList[index]
        }

        return 0
    }
    
    public func outlineView(_ outlineView: NSOutlineView, isItemExpandable item: Any) -> Bool {
        if let hierarchy = item as? SlamHierarchable {
            return hierarchy.slamHasList
        }
        else if let list = item as? [Any] {
            return list.count > 0
        }

        return false
    }
    
// MARK: - NSOutlineViewDelegate Methods

    public func outlineView(_ outlineView: NSOutlineView, viewFor tableColumn: NSTableColumn?, item: Any) -> NSView? {
        let width = Int(tableColumn?.width ?? 1000 )

        if let hierarchy = item as? SlamHierachyList {
            if let block = hierarchy.slamCellDataSource {
                return block(item, width)
            }
        }
        
        if let block = slamMakeTableCell {
            return block(item, width)
        }
        
        if let block = SlamTableCellView.standardMakeTextTableCell {
            return block(item, width)
        }
        
        return NSTableCellView()
    }
    
    public func outlineView(_ outlineView: NSOutlineView, isGroupItem item: Any) -> Bool {
        guard slamUseGroupUI else { return false }
        
        if let hierarchy = item as? SlamHierachyList {
            return hierarchy.slamHasList
        }
        else if let list = item as? [Any] {
            return list.count > 0
        }
        
        return false
    }
    
}
