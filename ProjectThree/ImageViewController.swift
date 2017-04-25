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

        // Do any additional setup after loading the view.
        
        let dat = NSData(contentsOf: file.URL as URL)!
        imageView.image = UIImage(data: dat as Data)
        self.scrollView.addSubview(imageView)
        imageView.image = UIImage(named: "Linfield")
        imageView.sizeToFit()
        scrollView?.contentSize = imageView.frame.size
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}