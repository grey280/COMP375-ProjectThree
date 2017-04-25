//
//  EditCellViewController.swift
//  ProjectThree
//
//  Created by Grey Patterson on 2017-04-14.
//  Copyright © 2017 Grey Patterson. All rights reserved.
//

import UIKit

class EditCellViewController: UIViewController {
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var descriptionField: UITextField!
    @IBOutlet weak var urlField: UITextField!
    
    /// Which file is being displayed
    weak var file: File!
    
    /// When editing ends, save data
    ///
    /// - Parameter sender: the sender
    @IBAction func editingDidEnd(_ sender: UITextField) {
        file.title = titleField.text ?? ""
        self.title = titleField.text ?? ""
        file.description = descriptionField.text ?? ""
        file.URL = NSURL(string: urlField.text!) ?? NSURL()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = file.title
        titleField.text? = file.title
        descriptionField.text? = file.description
        urlField.text? = file.URL.absoluteString ?? ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
