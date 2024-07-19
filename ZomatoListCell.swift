//
//  ZomatoListCell.swift
//  Zomato
//
//  Created by Esakki-IOS on 19/07/20.
//

import SwiftUI

struct ZomatoListCell: View {
    
    let zomatiers: Zomatiers
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: zomatiers.imageURL)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 90)
                    .cornerRadius(8)
            } placeholder: {
                Image("food-placeholder")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 90)
                    .cornerRadius(8)
            }

            
            VStack(alignment: .leading, spacing: 5) {
                Text(zomatiers.name)
                    .font(.title2)
                    .fontWeight(.medium)
                
                Text("$\(zomatiers.price, specifier: "%.2f")")
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
            }
            .padding(.leading)
        }
    }
}

struct AppetizerListCell_Previews: PreviewProvider {
    static var previews: some View {
        ZomatoListCell(zomatiers: MockData.sampleZomatiers)
    }
}
