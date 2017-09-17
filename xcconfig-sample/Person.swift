//
//  Person.swift
//  xcconfig-sample
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
