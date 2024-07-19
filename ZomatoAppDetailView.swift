//
//  ZomatoAppDetailView.swift
//  Zomato
//
//  Created by Esakki-IOS on 19/07/20.
//

import SwiftUI

struct ZomatoAppDetailView: View {
    
    @EnvironmentObject var order: Order
    
    let zomatiers: Zomatiers
    @Binding var isShowingDetail: Bool
    
    var body: some View {
        VStack {
            AppetizerRemoteImage(urlString: zomatiers.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 225)
            VStack {
                Text(zomatiers.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                Text(zomatiers.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                HStack(spacing: 40) {
                    NutritionInfo(title: "Calories", value: "\(zomatiers.calories)")
                    NutritionInfo(title: "Carbs", value: "\(zomatiers.carbs) g")
                    NutritionInfo(title: "Protein", value: "\(zomatiers.protein) g")
                }
            }
            Spacer()
            Button {
                order.add(zomatiers)
                isShowingDetail = false
            } label: {
                Text("$\(zomatiers.price, specifier: "%.2f") - Add to Order")
            }
            .modifier(CustomModifiers())
            .padding(.bottom, 30)
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(Button {
            isShowingDetail = false
        } label: {
            XDismissButton()
        }, alignment: .topTrailing)
    }
}

struct AppetizerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ZomatoAppDetailView(zomatiers: MockData.sampleZomatiers,
                            isShowingDetail: .constant(true))
    }
}


struct NutritionInfo: View {
    
    let title: String
    let value: String
    
    var body: some View {
        VStack(spacing: 5) {
            Text(title)
                .bold()
                .font(.caption)
            
            Text(value)
                .foregroundColor(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}
