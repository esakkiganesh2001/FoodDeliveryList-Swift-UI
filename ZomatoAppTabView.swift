//
//  ZomatoAppTabView.swift
//  Zomato
//
//  Created by Esakki-IOS on 19/07/20.
//

import SwiftUI

struct ZomatoAppTabView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        TabView {
            ZomatoListView()
                .tabItem { Label("Home", systemImage: "house") }
            AccountView()
                .tabItem { Label("Account", systemImage: "person") }
            OrderView()
                .tabItem { Label("Order", systemImage: "bag") }
                .badge(order.items.count)
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ZomatoAppTabView()
    }
}
