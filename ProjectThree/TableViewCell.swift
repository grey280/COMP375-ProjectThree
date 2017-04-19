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
    
    private var showingURL = false

    func swapDisplay(){
        if(showingURL){
            showingURL=false
            descriptionLabel.text = file.URL.absoluteString ?? ""
        }else{
            showingURL = true
            descriptionLabel.text = file.description
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let swipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swapDisplay))
        swipeRecognizer.direction = .right
        self.addGestureRecognizer(swipeRecognizer)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
