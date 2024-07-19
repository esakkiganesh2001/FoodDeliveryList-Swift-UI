//
//  Zomatiers.swift
//   Zomato
//
//  Created by Esakki-IOS on 19/07/20.
//

import Foundation

struct Zomatiers: Decodable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
}
struct ZomatiersResponse: Decodable {
    let request: [Zomatiers]
}
struct MockData {
    static let sampleZomatiers = Zomatiers(id: 0001, name: "Test Zomatiers", description: "This is the description for my Zomatiers. It's yummy.", price: 9.99, imageURL: "", calories: 99, protein: 99, carbs: 99)
    static let zomatiers       = [sampleZomatiers, sampleZomatiers, sampleZomatiers, sampleZomatiers]
    static let orderItemOne     = Zomatiers(id: 0001, name: "Test Zomatiers One", description: "This is the description for my Zomatiers. It's yummy.", price: 9.99, imageURL: "", calories: 99, protein: 99, carbs: 99)
    static let orderItemTwo     = Zomatiers(id: 0002, name: "Test Zomatiers Two", description: "This is the description for my Zomatiers. It's yummy.", price: 9.99, imageURL: "", calories: 99, protein: 99, carbs: 99)
    static let orderItemThree   = Zomatiers(id: 0003, name: "Test Zomatiers Three", description: "This is the description for my Zomatiers. It's yummy.", price: 9.99, imageURL: "", calories: 99, protein: 99, carbs: 99)
    static let orderItems       = [orderItemOne, orderItemTwo, orderItemThree]
}
