//
//  NeanderApp.swift
//  Neander
//
//  Created by Kenneth Laskoski on 2023-10-05.
//

import SwiftUI

@main
struct NeanderApp: App {
    var body: some Scene {
        DocumentGroup(newDocument: MemoryImageFile()) { file in
            ContentView(document: file.$document)
        }
    }
}
