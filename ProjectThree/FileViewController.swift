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
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = file.title
        
        guard let fileType = file.URL.pathExtension else{
            // crash, I guess?
            return
        }
        switch fileType {
        case "jpg", "jpeg", "png", "gif": // handle as an image
            webView.removeFromSuperview()
            // TODO: finish this
        default: // handle as a URL
            imageView.removeFromSuperview()
            scrollView.removeFromSuperview()
//            let request = NSURLRequest(url: file.URL as URL)
            print(file.URL)
//            webView.loadHTMLString("<a href=\"\(file.URL.absoluteString!)\">Go to URL</a>", baseURL: URL(string: "localhost"))

            webView.load(Data(), mimeType: "text/html", textEncodingName: "utf-8", baseURL: file.URL as URL)
//            webView.load(request: request)
            print(webView.description)
            print(webView.stringByEvaluatingJavaScript(from: "window.location"))
            // TODO: finish this
        }
        
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
