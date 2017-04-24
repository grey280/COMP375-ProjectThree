//
//  FileViewController.swift
//  ProjectThree
//
//  Created by Grey Patterson on 2017-04-21.
//  Copyright © 2017 Grey Patterson. All rights reserved.
//

import UIKit

class FileViewController: UIViewController {
    
    weak var file: File!
    @IBOutlet weak var scrollView: UIScrollView!
    
    private func invalidURLError(){
        print("Attempted to load an invalid file.")
        let margins = scrollView.layoutMarginsGuide
        let problemLabel = UILabel()
        problemLabel.text = "Invalid URL"
        scrollView.addSubview(problemLabel)
        problemLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 8).isActive = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TODO: set the title of the page to the file.title
        
        guard let fileType = file.URL.pathExtension else{ // If it's an invalid URL, we'll drop in a label saying as much
            // TODO: this loads fileType as a blank string, which is... not what we want
            invalidURLError()
            return
        }
        print(fileType)
        guard fileType != "" else {
            invalidURLError()
            return
        }
        print("Loaded a valid file.")
        print(fileType)
        // TODO: load either a page or an image here
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
