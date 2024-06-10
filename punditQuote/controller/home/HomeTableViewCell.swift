//
//  HomeTableViewCell.swift
//  punditQuote
//
//  Created by Mac on 24/10/2023.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var dataLabel: UILabel!
    @IBOutlet weak var cardView: UIView!
    
    @IBOutlet weak var copyButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    private func setupView() {
        copyButton.layer.cornerRadius = 10
        cardView.layer.cornerRadius = 20
        //cardView.dropShadow()
    }
    
    func configureCell(data: Quote) {
        if let text = data.text {
            self.dataLabel.text = text
        }
        if let intValue =  Int(data.colorCode) {

            // Extract red, green, and blue components
            let red = CGFloat((intValue >> 16) & 0xFF) / 255.0
            let green = CGFloat((intValue >> 8) & 0xFF) / 255.0
            let blue = CGFloat(intValue & 0xFF) / 255.0

            // Create a UIColor
            let color = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
            cardView.backgroundColor = color
        }
    }
    
    @IBAction func didTapCopyButton(_ sender: UIButton) {
        if let text = dataLabel.text {
            UIPasteboard.pasteToClipboard(text)
        }
    }
}
