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
    @IBAction func editingDidEnd(_ sender: UITextField) {
    }

    override func viewDidLoad() {
        super.viewDidLoad()

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
