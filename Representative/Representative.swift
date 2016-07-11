//
//  Representative.swift
//  Representative
//
//  Created by Brad on 7/11/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class Representative {
    
    let name: String
    let party: String
    let state: String
    let district: String
    let phone: String
    let office: String
    let link: String
    
    init?(dictionary: [String : AnyObject]) {
        guard let name = dictionary["name"] as? String, party = dictionary["party"] as? String, state = dictionary["state"] as? String, district = dictionary["district"] as? String, phone = dictionary["phone"] as? String, office = dictionary["office"] as? String, link = dictionary["link"] as? String else { return nil }
        self.name = name
        self.party = party
        self.state = state
        self.district = district
        self.phone = phone
        self.office = office
        self.link = link
    }
}
