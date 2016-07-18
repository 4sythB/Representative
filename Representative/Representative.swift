//
//  Representative.swift
//  Representative
//
//  Created by Brad on 7/18/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class Representative {
    
    private let kName = "name"
    private let kParty = "party"
    private let kState = "state"
    private let kDistrict = "district"
    private let kPhone = "phone"
    private let kOffice = "office"
    private let kLink = "link"
    
    let name: String
    let party: String
    let state: String
    let district: String
    let phone: String
    let office: String
    let link: String
    
    init?(dictionary: [String : AnyObject]) {
        guard let name = dictionary[kName] as? String, party = dictionary[kParty] as? String, state = dictionary[kState] as? String, district = dictionary[kDistrict] as? String, phone = dictionary[kPhone] as? String, office = dictionary[kOffice] as? String, link = dictionary[kLink] as? String else { return nil }
        self.name = name
        self.party = party
        self.state = state
        self.district = district
        self.phone = phone
        self.office = office
        self.link = link
    }
}