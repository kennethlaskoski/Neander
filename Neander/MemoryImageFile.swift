//
//  NeanderDocument.swift
//  Neander
//
//  Created by Kenneth Laskoski on 2023-10-05.
//

import SwiftUI
import UniformTypeIdentifiers

extension UTType {
  static var exampleText: UTType {
    UTType(importedAs: "com.example.plain-text")
  }
}

struct MemoryImageFile: FileDocument {
  let errorString = "## ERROR ##"
  var errorData: Data { errorString.data(using: .utf8)! }

  var data: Data = Data()
  var text: String {
    get { String(data: data, encoding: .utf8) ?? errorString }
    set { data = newValue.data(using: .utf8) ?? errorData }
  }

  static var readableContentTypes: [UTType] { [.exampleText] }

  init() {}

  init(configuration: ReadConfiguration) throws {
    guard let fileData = configuration.file.regularFileContents,
          let string = String(data: fileData, encoding: .utf8)
    else {
      throw CocoaError(.fileReadCorruptFile)
    }
    data = Data(base64Encoded: string)!
  }

  func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
    let string = data.base64EncodedString()
    return FileWrapper(regularFileWithContents: string.data(using: .utf8)!)
  }
}
