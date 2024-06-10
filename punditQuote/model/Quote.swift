//
//  Quote.swift
//  punditQuote
//
//  Created by Mac on 23/10/2023.
//

import Foundation

class Quote {
    var text: String?
    var colorCode: String
    var imagePath: String
    
    init(text: String, colorCode: String, imagePath: String) {
        self.text = text
        self.colorCode = colorCode
        self.imagePath = imagePath
    }
}
