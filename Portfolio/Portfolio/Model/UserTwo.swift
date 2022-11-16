//
//  User.swift
//  Portfolio
//
//  Created by Pavel Zamotaev on 03.11.2022.
//

import Foundation
import UIKit

struct UserTwo {
    let name: String
    let surname: String
    let post: String
    let adress: String
    let avatarImage: UIImage
    
    static let defaultUserImage = UIImage(named: "UserPicture")!
    
    static func makeMockData() -> [Self] {
        return [
            User(name: "Bred",
                 surname: "Hadson",
                 post: "Ios Dev",
                 adress: "SwiftUI street",
                 avatarImage: User.defaultUserImage),
            User(name: "Gleb",
                 surname: "Gladkih",
                 post: "Android dev",
                 adress: "Android Native street",
                 avatarImage: User.defaultUserImage),
            User(name: "Bob",
                 surname: "Broke",
                 post: "Devops",
                 adress: "Docker street",
                 avatarImage: User.defaultUserImage),
            User(name: "Jack",
                 surname: "London",
                 post: "Frontend dev",
                 adress: "Angular street",
                 avatarImage: User.defaultUserImage)
        ]
    }
}
