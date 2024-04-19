// The Swift Programming Language
// https://docs.swift.org/swift-book

import AXSwift
import Cocoa

public extension Attribute {
    static let cmdVirtualKey = "AXMenuItemCmdVirtualKey"
    static let cmdChar = "AXMenuItemCmdChar"
    static let cmdModifiers = "AXMenuItemCmdModifiers"
}

public extension UIElement {
    
    var cmdChar: String? {
        return try? attribute(Attribute.cmdChar)
    }
    
    var cmdVirtualKey: Int? {
        return try? attribute(Attribute.cmdVirtualKey)
    }
    
    var cmdModifiers: Int? {
        return try? attribute(Attribute.cmdModifiers)
    }
    
    var title: String? {
        return try? attribute(.title)
    }
    
    var identifier: String? {
        return try? attribute(.identifier)
    }
    
    var menu: UIElement? {
        return try? attribute(.menuBar)
    }
    
    var isEnabled: Bool? {
        return try? attribute(.enabled)
    }
    
    var children: [UIElement]? {
        do {
            let axElements: [AXUIElement]? = try attribute(.children)
            return axElements?.map({ UIElement($0) })
        } catch {}
        return nil
    }
    
    func deepFirst(where condition: @escaping (UIElement) -> Bool) -> UIElement? {
        if condition(self) {
            return self
        }
        
        for child in children ?? [] {
            if let res = child.deepFirst(where: { condition($0) }) {
                return res
            }
        }

        return nil
    }
}
