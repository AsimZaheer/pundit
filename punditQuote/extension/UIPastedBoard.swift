//
//  UIPastedBoard.swift
//  punditQuote
//
//  Created by Mac on 24/10/2023.
//

import UIKit.UIPasteboard

extension UIPasteboard {
  static func pasteToClipboard(_ content: String) {
    self.general.string = content
  }

  static func readFromClipboard() -> String? {
    return self.general.string
  }
}
