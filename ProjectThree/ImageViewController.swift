//
//  ImageViewController.swift
//  ProjectThree
//
//  Created by Grey Patterson on 2017-04-25.
//  Copyright © 2017 Grey Patterson. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    private var imageView = UIImageView()
    
    weak var file: File!

    override func viewDidLoad() {
        super.viewDidLoad()
        // print("Loading image from \(file.URL.absoluteString!)")
        
        if let dat = NSData(contentsOf: file.URL as URL){ // This delays the subsequent code until the load is complete; easier than trying to figure out thread stuff
            imageView.image = UIImage(data: dat as Data)
            scrollView.addSubview(imageView)
            imageView.sizeToFit()
            scrollView?.contentSize = imageView.frame.size
            self.title = file.title
        }else{
            self.title = "404 Image Not Found" // Easiest way to show an error if it couldn't load
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
