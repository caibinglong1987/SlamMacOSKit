//
//  SlamTable.swift
//  SlamCocoa
//
//  Created by Steve Sheets on 2/4/18.
//  Copyright © 2018 Zodiac Innovations. All rights reserved.
//

import Cocoa
import SlamKit

/// Closure based Table View for single selectable text
public class SlamTable: NSTableView, NSTableViewDelegate, NSTableViewDataSource, SlamReferable, SlamVisibleable, SlamEnableable, SlamListable, SlamNumberable {

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
        ui.slamUpdateEnable()

        
        reloadData()
    }

    // MARK: SlamEnableable Requirements
    
    public var slamEnabledState: Bool {
        get {
            isEnabled
        }
        set(value) {
            isEnabled = value
        }
    }

    public var slamEnableDataSource: SlamKit.ActionBoolClosure?

    // MARK: - SlamListable Requirements

    public var slamList: [String]?
    
    public var slamListDataSource: SlamKit.ListDataSourceClosure?
    
    public var slamCountDataSource: SlamKit.ReturnIntClosure?
    
    public var slamListItemDataSource: SlamKit.IntReturnStringClosure?

    // MARK: - SlamNumberable Requirements

    public var slamNumberState: Int {
        get {
            return selectedRowIndexes.first ?? 0
        }
        set(value) {
            selectRowIndexes(IndexSet(integer: value), byExtendingSelection: false)
        }
    }
    
    public var slamNumberDataSource: SlamKit.ActionIntClosure?
    
    public var slamNumberChangedEvent: SlamKit.InformIntClosure?

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
    
    // MARK: - NSTableViewDelegate
    
    public func tableViewSelectionDidChange(_ notification: Notification) {
        if let event = slamNumberChangedEvent {
            event(self.selectedRow)
        }
    }
    
    public func tableView(_ tableView: NSTableView, shouldEdit tableColumn: NSTableColumn?, row: Int) -> Bool {
        return false
    }
    
    // MARK: - DataNSTableViewDataSource
    
    public func numberOfRows(in tableView: NSTableView) -> Int {
        if let source = slamCountDataSource {
            return source()
        }
        else if let source = slamListDataSource {
            let list = source()
            
            return list.count
        }
        else if let list = slamList {
            return list.count
        }
        
        return 0
    }
    
    public func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any? {
        if let block = slamListItemDataSource {
            return block(row)
        }
        else if let block = slamListDataSource {
            let list = block()
            
            if (row >= 0) && (row < list.count) {
                return list[row]
            }
        }
        else if let list = slamList {
            if (row >= 0) && (row < list.count) {
                return list[row]
            }
        }
        
        return nil
    }
    
    public func tableView(_ tableView: NSTableView, setObjectValue object: Any?, for tableColumn: NSTableColumn?, row: Int) {
        
    }
    
}

