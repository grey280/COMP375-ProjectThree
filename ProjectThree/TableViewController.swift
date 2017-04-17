//
//  TableViewController.swift
//  ProjectThree
//
//  Created by Grey Patterson on 2017-04-12.
//  Copyright © 2017 Grey Patterson. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    @IBOutlet var tView: UITableView!
    
    var files = [File]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        if files.count == 0{
            let file1 = File(title: "Linfield", description: "Linfield's website", URL: NSURL(string: "http://www.linfield.edu")!)
            let file2 = File(title: "Stanford", description: "Stanford's website", URL: NSURL(string: "http://www.stanford.edu")!)
            let file3 = File(title: "TwoEighty", URL: NSURL(string: "http://twoeighty.net")!)
            files.append(file1)
            files.append(file2)
            files.append(file3)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return files.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FileCell", for: indexPath) as! TableViewCell
        
        // Configure the cell...
        
        cell.file = files[indexPath.row]

        return cell
    }
    
    // Enable a row to be swiped
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool{
        return true;
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]?{
        
        let editAction = UITableViewRowAction(style: .normal, title: "Edit") { (rowAction, indexPath) in
            print("edit row")
//            self.performSegue(withIdentifier: "Edit Cell", sender: indexPath)
            let vc = UIStoryboard(name: "Main", bundle:nil).instantiateViewController(withIdentifier: "EditVC") as! EditCellViewController
            vc.file = self.files[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete"){
            (rowAction, indexPath) in
            print("delete row")
            self.deleteRow(at: indexPath)
        }
        
        return [deleteAction, editAction]
    }
    
    
    func deleteRow(at indexPath: IndexPath){
        let dialog = UIAlertController(title: "Delete?", message: "Are you sure you want to delete?", preferredStyle: .actionSheet)
        let deleteButton = UIAlertAction(title: "Delete", style: .destructive) { (action) in
            self.files.remove(at: indexPath.row)
            print("removed from files")
            self.tableView.deleteRows(at: [indexPath], with: .fade)
        }
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        dialog.addAction(deleteButton)
        dialog.addAction(cancelButton)
        present(dialog, animated: true, completion: nil)
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
