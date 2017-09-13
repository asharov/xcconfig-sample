//
//  Person.swift
//  xcconfig-sample
//
//  Created by Jaakko Kangasharju on 12.09.17.
//  Copyright © 2017 Futurice. All rights reserved.
//

import Foundation

struct Person {
    let id: Int
    let firstName: String
    let lastName: String
    let company: String
    let joinDate: Date

    init(json: Dictionary<String, Any>) {
        id = json["id"] as! Int
        firstName = json["firstName"] as! String
        lastName = json["lastName"] as! String
        company = json["company"] as! String
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ss'.'SSS'Z'"
        joinDate = dateFormatter.date(from: json["joinDate"] as! String)!
    }
}
