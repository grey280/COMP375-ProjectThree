//
//  TableViewCell.swift
//  ProjectThree
//
//  Created by Grey Patterson on 2017-04-12.
//  Copyright © 2017 Grey Patterson. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    var file: File!{
        didSet{
            titleLabel.text = file.title
            descriptionLabel.text = file.description
        }
    }
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    /// Whether or not the URL is being displayed
    private var showingURL = false

    /// Toggles whether the description or the URL is being displayed
    func swapDisplay(){
        if(showingURL){
            showingURL = false
            descriptionLabel.text = file.URL.absoluteString ?? ""
        }else{
            showingURL = true
            descriptionLabel.text = file.description
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Create and add the swipe recognizer for switching between showing the URL and the description
        let swipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swapDisplay))
        swipeRecognizer.direction = .right
        self.addGestureRecognizer(swipeRecognizer)
    }
}
