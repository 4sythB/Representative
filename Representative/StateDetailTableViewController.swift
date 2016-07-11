//
//  StateDetailTableViewController.swift
//  Representative
//
//  Created by Brad on 7/11/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class StateDetailTableViewController: UITableViewController {
    
    var state: String?
    var representatives: [Representative] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let state = state else { return }
        RepresentativeController.searchRepsByState(state, completion: { (representatives) in
            self.representatives = representatives
            dispatch_async(dispatch_get_main_queue(), {
                self.tableView.reloadData()
            })
        })
    }
    
    // MARK: - Table view data source
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return representatives.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCellWithIdentifier("detailCell", forIndexPath: indexPath) as? DetailTableViewCell else { return UITableViewCell() }
        
        cell.updateWithRepresentative(representatives[indexPath.row])
        
        return cell ?? UITableViewCell()
    }
}
