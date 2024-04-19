//
//  File.swift
//  
//
//  Created by lixindong on 2024/4/18.
//

import Foundation
import AXSwift

public extension UIElement {
    
    var isCopy: Bool {
        identifier == SystemMenuItem.copy.rawValue || (cmdChar == SystemMenuItem.copy.cmdChar && cmdModifiers == SystemMenuItem.copy.cmdModifiers)
    }
    
    func findMenuItem(cmdChar: String, cmdModifiers: Int, cmdVirtualKey: Int) -> UIElement? {
        return menu?.deepFirst { $0.cmdChar == cmdChar && $0.cmdModifiers == cmdModifiers && $0.cmdVirtualKey == cmdVirtualKey }
    }
    
    func findMenuItem(title: String) -> UIElement? {
        return menu?.deepFirst(where: { $0.title == title })
    }
    
    func findCopy() -> UIElement? {
        return menu?.deepFirst { $0.isCopy }
    }

    enum SystemMenuItem: String {
        case copy = "copy:"
        case paste = "paste:"
        case cut = "cut:"

        var cmdChar: String {
            switch self {
            case .copy:
                "C"
            case .paste:
                "P"
            case .cut:
                "X"
            }
        }
        
        var cmdModifiers: Int {
            switch self {
            case .copy:
                0
            case .paste:
                0
            case .cut:
                0
            }
        }
        
        var cmdVirtualKey: Int? {
            switch self {
            case .copy:
                nil
            case .paste:
                nil
            case .cut:
                nil
            }
        }
    }
}
