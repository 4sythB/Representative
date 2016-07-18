//
//  RepresentativeController.swift
//  Representative
//
//  Created by Brad on 7/18/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class RepresentativeController {
    
    static let baseURL = NSURL(string: "http://whoismyrepresentative.com/getall_reps_bystate.php")
    
    static func searchRepsByState(state: String, completion: (representatives: [Representative]?) -> Void) {
        guard let url = baseURL else { return }
        
        let urlParameters = ["state" : state, "output" : "json"]
        
        NetworkController.performRequestForURL(url, httpMethod: .Get, urlParameters: urlParameters) { (data, error) in
            guard let data = data, responseDataString = NSString(data: data, encoding: NSUTF8StringEncoding) else {
                print("Error: Data is nil")
                completion(representatives: [])
                return
            }
            guard let jsonDictionary = (try? NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)) as? [String : AnyObject] else {
                print("Error: Unable to serialize JSON. \n\(responseDataString)")
                completion(representatives: [])
                return
            }
            
            guard let respresentativesResults = jsonDictionary["results"] as? [[String : AnyObject]] else {
                completion(representatives: [])
                return
            }
            
            let representatives = respresentativesResults.flatMap { Representative(dictionary: $0) }
            completion(representatives: representatives)
        }
    }
}
