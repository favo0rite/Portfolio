//
//  User.swift
//  Portfolio
//
//  Created by Pavel Zamotaev on 03.11.2022.
//

import Foundation
import UIKit

struct User {
    var name: String?
    var surname: String?
    var post: String?
    var adress: String?
    var avatarImage: UIImage?
    
    static func makeMockData() -> [Self] {
        return [
            User(name: "Bred",
                 surname: "Hadson",
                 post: "Ios Dev",
                 adress: "SwiftUI street",
                 avatarImage: UIImage(named: "UserPicture") ?? nil),
            User(name: "Gleb",
                 surname: "Gladkih",
                 post: "Android dev",
                 adress: "Android Native street",
                 avatarImage: UIImage(named: "Man") ?? nil),
            User(name: "Bob",
                 surname: "Broke",
                 post: "Devops",
                 adress: "Docker street",
                 avatarImage: UIImage(named: "Woman") ?? nil),
            User(name: "Jack",
                 surname: "London",
                 post: "Frontend dev",
                 adress: "Angular street",
                 avatarImage: UIImage(named: "Focus") ?? nil)
        ]
    }
}
