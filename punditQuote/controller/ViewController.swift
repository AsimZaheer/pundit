//
//  ViewController.swift
//  punditQuote
//
//  Created by Mac on 23/10/2023.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var dataSource = [Quote]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        FirebaseData.readUser { quotes in
                self.dataSource = quotes
                self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - UitableVIewDelegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if dataSource[indexPath.row].colorCode != "" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell") as! HomeTableViewCell
            cell.configureCell(data: dataSource[indexPath.row])
            return cell
        } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell1") as! HomeTableViewCell1
            
            if let imageURL = URL(string: dataSource[indexPath.row].imagePath) {
                // Load the image using SDWebImage
                cell.backgroundImage.sd_setImage(with: imageURL) { [weak self] (image, error, cacheType, imageURL) in
                    if let image = image {
                        // Set the image view's frame to match the actual image size
                        print(image.size.height)
                        //cell.frame.size.height = 400.0
                        cell.layoutIfNeeded()
                        
                    }
                }
            }
                cell.configureCell(data: dataSource[indexPath.row])
                return cell
        }
    }
}

