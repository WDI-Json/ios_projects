//
//  Chat.swift
//  appclone112app
//
//  Created by Wouter on 14/05/2022.
//

import Foundation

struct Message {
    var content: String
    var user: User
}
struct User {
    var name: String
    var avatar: String
    var isCurrentUser: Bool = false
}
