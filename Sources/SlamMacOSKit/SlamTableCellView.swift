//
//  SlamTableCellView.swift
//  SlamMacOSKit
//
//  Created by Steve Sheets on 7/10/20.
//  Copyright © 2020 Steve Sheets. All rights reserved.
//

import Cocoa
import SlamKit

// MARK: Classes

/// Abstract Structrure for method relating to Table Cell
public struct SlamTableCellView {
    
    // MARK: Static Constants
    
    /// Standard Closure to create simple Text TableCellView, usnig given object & max width.
    static public let standardMakeTextTableCell: SlamMacOSKit.TableCellDataSourceClosure? = { item, width in
        var text = ""
        
        if let object = item as? NSObject {
            text = object.slamGetTitle
        }
        
        return SlamTableCellView.makeTableCell(text: text, width: width)
    }
    
    /// Standard Closure to create simple Folder TableCellView, usnig given object & max width.
    static public let standardMakeFolderTableCell: SlamMacOSKit.TableCellDataSourceClosure = { item, width in
        var text = ""
        
        if let object = item as? NSObject {
            text = object.slamGetTitle
        }
        
        return SlamTableCellView.makeTableCell(imageName: NSImage.folderName, text: text, width: width, color: .red)
    }

    // MARK: Static Functions
    
    /// Make a Text TableCellView with provided text, width & text color.
    /// - Parameters:
    ///   - text: String text to place into Cell (default empty)
    ///   - width: Int Max Width of Cell (usually provided by NSTableViewColumn, default 1000)
    ///   - color: NSColor Color of the text displayed (default Black)
    /// - Returns: NSTableCellView created using given parameters.
    static public func makeTableCell(text: String = "", width: Int = 1000, color: NSColor? = .black) -> NSTableCellView {
        let aRect = NSRect(x: 0, y: 0, width: width, height: 17)
        let view = NSTableCellView(frame: aRect)
        
        let aTextField = NSTextField(frame: aRect)
        aTextField.isEditable = false
        if #available(OSX 10.15, *) {
            aTextField.isBordered = false
        }
        aTextField.backgroundColor = .clear
        aTextField.textColor = color
        aTextField.stringValue = text
        view.textField = aTextField
        
        view.addSubview(aTextField)
        
        return view
    }
    
    /// Make a Text TableCellView with provided item, width & text color.
    /// - Parameters:
    ///   - item: NSObject uses the slamGetTitle result of object, to use as text.
    ///   - width: Int Max Width of Cell (usually provided by NSTableViewColumn, default 1000)
    ///   - color: NSColor Color of the text displayed (default Black)
    /// - Returns: NSTableCellView created using given parameters.
    static public func makeTableCell(item: NSObject, width: Int = 1000, color: NSColor? = .black) -> NSTableCellView {
        return SlamTableCellView.makeTableCell(text:item.slamGetTitle, width: width, color: color)
    }
    

    /// Make a Text TableCellView with provided image, text, width & text color.
    /// - Parameters:
    ///   - image: NSImage image to place into View.
    ///   - text: String text to place into Cell (default empty)
    ///   - width: Int Max Width of Cell (usually provided by NSTableViewColumn, default 1000)
    ///   - color: NSColor Color of the text displayed (default Black)
    /// - Returns: NSTableCellView created using given parameters.
    static public func makeTableCell(image: NSImage, text: String = "", width: Int = 1000, color: NSColor? = .black) -> NSTableCellView {
        let aRect = NSRect(x: 0, y: 0, width: width, height: 17)
        let view = NSTableCellView(frame: aRect)
        
        let aTextRect = NSRect(x: 20, y: 0, width: width-20, height: 17)
        let aTextField = NSTextField(frame: aTextRect)
        aTextField.isEditable = false
        if #available(OSX 10.15, *) {
            aTextField.isBordered = false
        }
        aTextField.backgroundColor = .clear
        aTextField.textColor = color
        aTextField.stringValue = text
        
        let aImageRect = NSRect(x: 0, y: 0, width: 20, height: 17)
        let aImageView = NSImageView(image: image)
        aImageView.frame = aImageRect
        aImageView.isEditable = false

        view.textField = aTextField
        view.imageView = aImageView
        view.addSubview(aTextField)
        view.addSubview(aImageView)

        return view
    }

    /// Make a Text TableCellView with provided image name, text, width & text color.
    /// - Parameters:
    ///   - imageName: String name image to place into View (if no image by this name, text table view cell is created).
    ///   - text: String text to place into Cell (default empty)
    ///   - width: Int Max Width of Cell (usually provided by NSTableViewColumn, default 1000)
    ///   - color: NSColor Color of the text displayed (default Black)
    /// - Returns: NSTableCellView created using given parameters.
    static public func makeTableCell(imageName: String, text: String = "", width: Int = 1000, color: NSColor? = .black) -> NSTableCellView {
        if let image = NSImage(named: imageName) {
            return makeTableCell(image: image, text: text, width: width, color: color)
        }
        
        return makeTableCell(text: text, width: width, color: color)

    }
}
