//
//  SearchListTableViewController.swift
//  Medimate
//
//  Created by 一川 黄 on 19/03/2016.
//  Copyright © 2016 Team MarshGhatti. All rights reserved.
//

import UIKit

class SearchListTableViewController: UITableViewController {

    var searchCategory: String!
    var sample: GP!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.automaticallyAdjustsScrollViewInsets = false;
        self.navigationItem.title = self.searchCategory
        
        self.sample = GP(name: "Dr.Henrietta Libhaber")
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0
        {
            if self.searchCategory == "GP"
            {
                return 3
            }
            else
            {
                return 2
            }
        }
        if section == 1
        {
            return 3
        }
        return 0
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.section == 0
        {
            let cell = tableView.dequeueReusableCellWithIdentifier("filterCell", forIndexPath: indexPath) as! FilterCell
            if indexPath.row == 0
            {
                cell.filterName.text = "Search Location"
                cell.filterValue.text = "Current Location"
            }
            if indexPath.row == 1
            {
                if self.searchCategory == "GP"
                {
                    cell.filterName.text = "Language Prefer"
                    cell.filterValue.text = "中文"
                }
                else
                {
                    cell.filterName.text = "Sort By"
                    cell.filterValue.text = "Distance"
                }
            }
            if indexPath.row == 2 && self.searchCategory == "GP"
            {
                cell.filterName.text = "Sort By"
                cell.filterValue.text = "Distance"
            }
            return cell
        }
        else
        {
            let cell = tableView.dequeueReusableCellWithIdentifier("resultCell", forIndexPath: indexPath) as! SearchResultCell
            cell.nameLabel.text = self.sample.name
            let stars = RatingStarGenerator.ratingStarsFromDouble(self.sample.rating)
            cell.ratingLabel.text = "Rating: \(stars)"
            cell.addressLabel.text = self.sample.address
            cell.reviewsLabel.text = "\(self.sample.numberOfReview) reviews"
            cell.distanceLabel.text = "\(self.sample.distance) km"
            
            let imageURL = NSURL(string: "\(self.sample.imageURL!)")
            let imageData = NSData(contentsOfURL: imageURL!)
            cell.picView.image = UIImage(data: imageData!)
            return cell
        }
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 0
        {
            return 25
        }
        if indexPath.section == 1
        {
            return 84
        }
        return 0
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0
        {
            return 75
        }
        return self.tableView.sectionHeaderHeight - 15
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 1
        {
            return "Results"
        }
        return ""
    }
    


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
