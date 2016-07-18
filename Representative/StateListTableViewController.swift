//
//  StateListTableViewController.swift
//  Representative
//
//  Created by Brad on 7/18/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class StateListTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Table view data source
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return StateController.states.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("stateCell", forIndexPath: indexPath)
        
        let state = StateController.states[indexPath.row]
        
        cell.textLabel?.text = state
        
        return cell
    }
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destinationVC = segue.destinationViewController as? StateDetailTableViewController
        
        if segue.identifier == "toStateDetailSegue" {
            if let indexPath = tableView.indexPathForSelectedRow {
                destinationVC?.state = StateController.states[indexPath.row]
            }
        }
    }
}
