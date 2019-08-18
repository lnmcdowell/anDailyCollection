//
//  TableViewController.swift
//  anDailyCollection
//
//  Created by Larry Mcdowell on 8/17/19.
//  Copyright © 2019 Nathaniel Mcdowell. All rights reserved.
//

import UIKit
import MBProgressHUD
import SwiftyXMLParser

fileprivate let CELL_ID = "CELL_ID"

class TableViewController: UITableViewController {

   
    
    var response:XML.Accessor?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        navigationItem.title = "CView from Scratch"
        let fl = UICollectionViewFlowLayout()
        fl.itemSize = CGSize(width: 190, height: 150)
        showLoadingHUD()
        //////////////////////////////////////////
        let fAAGetter:FAAGetter = FAAGetter()
        fAAGetter.getMetar(sender: self)
        //////////////////////////////////////////
        
        self.view.backgroundColor = .green
        self.view.isUserInteractionEnabled = true
        
        self.tableView.register(myTableCell.self, forCellReuseIdentifier: CELL_ID)
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        if self.response != nil {
            hideLoadingHUD()
        }
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if let count = response {
            let ret = Int(count.data.attributes["num_results"]!)!
            
            navigationItem.title = " \(ret) Results Returned"
            return ret
        } else {
            return 0
        }    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CELL_ID, for: indexPath) as! myTableCell

        // Configure the cell...
        if let myRx = response {
            cell.metar_accessor = myRx.data.METAR[indexPath.item]
        }
        return cell
    }
   

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

  
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
   

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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    private func showLoadingHUD() {
        let hud = MBProgressHUD.showAdded(to: self.tableView, animated: true)
        hud.label.text = "Loading..."
    }
    
    private func hideLoadingHUD() {
        MBProgressHUD.hide(for: self.tableView, animated: true)
    }
}
