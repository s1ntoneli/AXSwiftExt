//
//  ContentView.swift
//  AXSwiftExtExample
//
//  Created by lixindong on 2024/4/18.
//

import SwiftUI
import AXSwift
import AXSwiftExt

struct ContentView: View {
    var body: some View {
        Button {
            testFindCopy()
        } label: {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
            }
            .padding()
        }
    }

    func testFindCopy() {
        guard UIElement.isProcessTrusted(withPrompt: true) else {
            NSLog("Permission is not granted")
            return
        }
        guard let application = NSWorkspace.shared.frontmostApplication, let app = Application(application) else {
            NSLog("Can't get frontmost app")
            return
        }
        
        guard let menu = app.menu else {
            NSLog("No Menu")
            return
        }
        if let copy = app.findCopy() {
            NSLog("found copy \(copy.identifier) \(copy.cmdVirtualKey) \(copy.isEnabled)")
        } else {
            NSLog("not found")
        }
    }
}

#Preview {
    ContentView()
}
