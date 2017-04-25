//
//  TableViewController.swift
//  ProjectThree
//
//  Created by Grey Patterson on 2017-04-12.
//  Copyright © 2017 Grey Patterson. All rights reserved.
//

import UIKit
import SafariServices

class TableViewController: UITableViewController {

    @IBOutlet var tView: UITableView!
    
    /// List of files to be displayed
    var files = [File]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.leftBarButtonItem = self.editButtonItem // Show edit button on the left
        
        // Build some default files
        if files.count == 0{
            let file1 = File(title: "Linfield", description: "Linfield's website", URL: NSURL(string: "http://www.linfield.edu")!)
            let file2 = File(title: "Stanford", description: "Stanford's website", URL: NSURL(string: "http://www.stanford.edu")!)
            let file3 = File(title: "TwoEighty", URL: NSURL(string: "http://twoeighty.net")!) // Example of file without description
            let file4 = File(title: "NYF", description: "Not Your Forte logo", URL: NSURL(string: "http://cdn.twoeighty.net/static/NYF.jpg")!) // Example of image file
            files.append(file1)
            files.append(file2)
            files.append(file3)
            files.append(file4)
        }
    }
    
    /// Add a new file
    ///
    /// - Parameter sender: the sender
    @IBAction func addButton(_ sender: UIBarButtonItem) {
        let newFile = File()
        files.append(newFile)
        let vc = UIStoryboard(name: "Main", bundle:nil).instantiateViewController(withIdentifier: "EditVC") as! EditCellViewController
        vc.file = newFile
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) { // Reload the table view when it appears; fixes some issues with not showing new data after editing a file
        super.viewWillAppear(animated)
        tView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    /// Number of sections in table; only one
    ///
    /// - Parameter tableView: Which tableView we're getting info for
    /// - Returns: 1
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    /// Number of rows in the section
    ///
    /// - Parameters:
    ///   - tableView: tableView to get info for
    ///   - section: Which section? Ignored
    /// - Returns: files.count
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return files.count
    }
    
    /// Get a cell to display
    ///
    /// - Parameters:
    ///   - tableView: tableView to get a cell for
    ///   - indexPath: Which cell to get
    /// - Returns: the built cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FileCell", for: indexPath) as! TableViewCell
        cell.file = files[indexPath.row]
        return cell
    }
    
    /// Are cells allowed to be edited?
    ///
    /// - Parameters:
    ///   - tableView: Which tableView to use
    ///   - indexPath: Which cell we're asking about; ignored
    /// - Returns: Whether or not the cell can be edited - always true
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool{
        return true;
    }
    
    /// Which edit actions are allowed on a cell?
    ///
    /// - Parameters:
    ///   - tableView: which tableView
    ///   - indexPath: which cell
    /// - Returns: the set of edit actions allowed on a cell
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]?{
        let editAction = UITableViewRowAction(style: .normal, title: "Edit") { (rowAction, indexPath) in
            let vc = UIStoryboard(name: "Main", bundle:nil).instantiateViewController(withIdentifier: "EditVC") as! EditCellViewController
            vc.file = self.files[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete"){
            (rowAction, indexPath) in
            self.deleteRow(at: indexPath)
        }
        
        return [deleteAction, editAction]
    }
    
    /// Asks the user if they're sure they want to delete before it'll let it happen
    ///
    /// - Parameter indexPath: The location of the cell to delete.
    func deleteRow(at indexPath: IndexPath){
        let dialog = UIAlertController(title: nil, message: "Delete \(files[indexPath.row].title)?", preferredStyle: .actionSheet)
        let deleteButton = UIAlertAction(title: "Delete", style: .destructive) { (action) in
            self.files.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
        }
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        dialog.addAction(deleteButton)
        dialog.addAction(cancelButton)
        present(dialog, animated: true, completion: nil)
    }

    // Override to support rearranging the table view.
    /// Move an item from one place to another in the data store
    ///
    /// - Parameters:
    ///   - tableView: The tableView to use.
    ///   - fromIndexPath: The location being moved from
    ///   - to: The location being moved to
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let element = files.remove(at: fromIndexPath.row)
        files.insert(element, at: to.row)
    }
    
    /// Handle a row in the tableView being selected; used since you can't fire an @IBAction from a UITableViewCell
    ///
    /// - Parameters:
    ///   - tableView: the table view being used
    ///   - indexPath: which row was tapped
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let relevantFile = files[indexPath.row]
        switch relevantFile.URL.pathExtension! {
        case "jpeg", "jpg", "png", "gif":
            self.performSegue(withIdentifier: "imgSegue", sender: relevantFile)
            return
        default:
            let sVC = SFSafariViewController(url: relevantFile.URL as URL)
            self.navigationController?.pushViewController(sVC, animated: true)
            self.navigationController?.title = relevantFile.title
        }
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let iVC = segue.destination as? ImageViewController, let sFile = sender as? File else{
            return // something went wrong and everything's about to explode anyways
        }
        iVC.file = sFile
    }
    

}
