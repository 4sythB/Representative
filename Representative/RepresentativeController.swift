//
//  RepresentativeController.swift
//  Representative
//
//  Created by Brad on 7/11/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class RepresentativeController {
    
    static let baseURL = NSURL(string: "http://whoismyrepresentative.com/getall_reps_bystate.php")
    
    static func searchRepsByState(state: String, completion: ((representative: [Representative]) -> Void)) {
        guard let url = baseURL else { fatalError("URL optional is nil") }
        
        let urlParameters = ["state" : "\(state)", "output" : "json"]
        NetworkController.performRequestForURL(url, httpMethod: .Get, urlParameters: urlParameters) { (data, error) in
            if let data = data,
                responseDataString = NSString(data: data, encoding: NSUTF8StringEncoding) {
                
                guard let jsonDictionary = (try? NSJSONSerialization.JSONObjectWithData(data, options: [])) as? [String : AnyObject],
                    representativesArray = jsonDictionary["results"] as? [[String : AnyObject]] else {
                        print("Unable to serialize JSON. \n\(responseDataString)")
                        completion(representative: [])
                        return
                }
                dispatch_async(dispatch_get_main_queue(), {
                    let representatives = representativesArray.flatMap { Representative(dictionary: $0) }
                    completion(representative: representatives)
                })
                
                
            } else {
                print("No data returned from network request")
                completion(representative: [])
            }
        }
    }
}
