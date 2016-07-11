//
//  DetailTableViewCell.swift
//  Representative
//
//  Created by Brad on 7/11/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var partyLabel: UILabel!
    @IBOutlet weak var districtLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func updateWithRepresentative(representative: Representative) {
        nameLabel.text = representative.name
        partyLabel.text = "Party:  \(representative.party)"
        districtLabel.text = "District:  \(representative.district)"
        websiteLabel.text = "Web:  \(representative.link)"
        phoneNumberLabel.text = "Phone:  \(representative.phone)"
    }
}

