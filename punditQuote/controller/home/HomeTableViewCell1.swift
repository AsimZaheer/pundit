//
//  HomeTableViewCell1.swift
//  punditQuote
//
//  Created by Mac on 30/10/2023.
//

import UIKit
import SDWebImage

class HomeTableViewCell1: UITableViewCell {
    
    @IBOutlet weak var copyButton: UIButton!
    @IBOutlet weak var dataLabel: UILabel!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    @IBOutlet weak var imageHeightConstant: NSLayoutConstraint!
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    private func setupView() {
        cardView.layer.cornerRadius = 20
        backgroundImage.layer.cornerRadius = 20
        copyButton.layer.cornerRadius = 10

        //cardView.dropShadow()
    }
    
    func configureCell(data: Quote) {
        if let text = data.text {
            let label = UILabel()
            label.numberOfLines = 0
            label.text = data.text
            self.dataLabel.text = label.text
            self.dataLabel.sizeToFit()
            print(" data height \(dataLabel.frame.height)")
            //self.frame.size.height = dataLabel.frame.height
            if dataLabel.frame.height > 400 {
                self.imageHeightConstant.constant = dataLabel.frame.height + 50.0
                self.layoutIfNeeded()
            }
        }
        
      
        
//        if data.imagePath != "" {
//            let imageUrlString =  data.imagePath
//            let imageUrl = URL(string: imageUrlString)
//
//            // Use SDWebImage to load the image
//            backgroundImage.sd_setImage(with: imageUrl, placeholderImage: nil, options: .progressiveLoad, completed: { (image, error, _, _) in
//                if let error = error {
//                    // Handle the error, e.g., display a placeholder image or show an error message.
//                    print("Image load error: \(error.localizedDescription)")
//                } else {
//                    // The image has been successfully loaded and displayed in your imageView.
//                }
//            })
//        }
    }
    
    @IBAction func didTapCopyButton(_ sender: UIButton) {
        if let text = dataLabel.text {
            UIPasteboard.pasteToClipboard(text)
        }
    }
    
}
