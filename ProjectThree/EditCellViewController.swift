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
    
    var file: File!
    
    @IBAction func editingDidEnd(_ sender: UITextField) {
        file.title = titleField.text ?? ""
        file.shortDescription = descriptionField.text ?? ""
        file.URL = NSURL(string: urlField.text!) ?? NSURL()
        
        print("theoretically saving some stuff")
        // TODO this doesn't actually save stuff yet, whoops
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        titleField.text? = file.title
        descriptionField.text? = file.shortDescription
        urlField.text? = file.URL.absoluteString ?? ""
        // Do any additional setup after loading the view.
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
