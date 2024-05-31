//
//  ContentView.swift
//  Neander
//
//  Created by Kenneth Laskoski on 2023-10-05.
//

import SwiftUI

struct ContentView: View {
    @Binding var document: MemoryImageFile

    var body: some View {
        TextEditor(text: $document.text)
    }
}

#Preview {
    ContentView(document: .constant(MemoryImageFile()))
}
