//
//  DataViewController.swift
//  DataProjectLauren
//
//  Created by Davis, Lauren on 11/30/18.
//  Copyright © 2018 Davis, Lauren. All rights reserved.
//

import UIKit

class DataViewController: UITableViewController
{

    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int
    {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        // #warning Incomplete implementation, return the number of rows
        return bucketList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dataIdentifier", for: indexPath) as! BucketItemCell
        
        cell.currentBucketItem = bucketList[indexPath.row]
        
        return cell
    }
    
    
    lazy var bucketList : [BucketItem] =
    {
            return loadBucketListFromFile()
    } ()
    
    
    private func loadBucketListFromFile() -> [BucketItem]
    {
        var items = [BucketItem]()
        do
        {
            if let filePath = Bundle.main.url(forResource: "bucket18", withExtension: "csv")
            {
                let input = try String(contentsOf: filePath)
                let bucketLines = input.components(separatedBy: "\n")
                for line in bucketLines
                {
                    let item = line.components(separatedBy: ",")
                    items.append(BucketItem(contents: item[0], author: item[1]))
                }
            }
        }
        catch
        {
            print("File load error")
        }
        return items
    } //end of loadBucketListFromFile()
    
    
  
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
     {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
     {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath)
     {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool
     {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
     {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
