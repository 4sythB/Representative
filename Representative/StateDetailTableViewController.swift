//
//  StateDetailTableViewController.swift
//  Representative
//
//  Created by Brad on 7/18/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class StateDetailTableViewController: UITableViewController {
    
    var representatives: [Representative] = []
    var state: String? = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let state = state else { return }
        
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        
        RepresentativeController.searchRepsByState(state) { (representatives) in
            guard let representatives = representatives else { return }
            self.representatives = representatives
            dispatch_async(dispatch_get_main_queue()) {
                self.tableView.reloadData()
                UIApplication.sharedApplication().networkActivityIndicatorVisible = false
            }
        }
    }
    
    // MARK: - Table view data source
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return representatives.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("representativeCell", forIndexPath: indexPath) as? RepresentativeTableViewCell
        
        let representative = representatives[indexPath.row]
        
        cell?.updateWithRepresentative(representative)
        
        return cell ?? UITableViewCell()
    }
}
