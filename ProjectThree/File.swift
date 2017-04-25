//
//  File.swift
//  ProjectThree
//
//  Created by Grey Patterson on 2017-04-12.
//  Copyright © 2017 Grey Patterson. All rights reserved.
//

import Foundation

class File {
    var title: String
    var description: String
    var URL: NSURL
    
    convenience init(title: String, URL: NSURL){
        self.init(title: title, description: "", URL: URL)
    }
    
    init(title: String, description: String, URL: NSURL){
        self.title = title
        self.description = description
        
        let comps = NSURLComponents(string: URL.absoluteString!)
        comps?.scheme = "https"
        let string = comps!.string!
        
        self.URL = NSURL(string: string)!
        
    }
    
    init(){
        self.title = ""
        self.description = ""
        self.URL = NSURL()
    }
}
