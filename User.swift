//
//  User.swift
//  Zomato
//
//  Created by Esakki-IOS on 19/07/20.
//

import Foundation

struct User: Codable {
    var firstName       = ""
    var lastName        = ""
    var email           = ""
    var birthdate       = Date()
    var extraNapkins    = false
    var frequentRefills = false
}
