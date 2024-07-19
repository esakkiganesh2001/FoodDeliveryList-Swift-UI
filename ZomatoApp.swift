//
//  ZomatoApp.swift
//  Zomato
//
//  Created by Esakki-IOS on 19/07/20.
//

import SwiftUI

@main
struct ZomatoApp: App {
    
    var order = Order()
    var body: some Scene {
        WindowGroup {
            ZomatoAppTabView().environmentObject(order)
        }
    }
}
