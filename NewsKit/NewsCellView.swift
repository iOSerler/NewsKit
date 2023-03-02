//
//  NewsCellView.swift
//  ReusEd
//
//  Created by Anna Dluzhinskaya on 23.06.2022.
//

import SwiftUI

@available(iOS 13.0.0, *)
public struct NewsCellView: View {
    var assets: NewsAssets
    var item: NewsItem
    
    public var body: some View {
        VStack(alignment: .center) {
            HStack(alignment: .center) {
                
                VStack {
                    Image(systemName: item.image ?? "newspaper")
                        .font(.title)
                    Spacer()
                }
               
                
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Text(item.title)
                            .font(.custom(assets.titleFont, size: 14))
                            .foregroundColor(Color(assets.primaryTextColor))
                        Spacer()
                        Text(item.date)
                            .font(.custom(assets.descriptionFont, size: 12))
                            .foregroundColor(Color(assets.secondaryColor))
                            .padding(.leading, 5)
                    }
            
                    Text(item.description)
                        .font(.custom(assets.descriptionFont, size: 12))
                        .foregroundColor(Color(assets.secondaryTextColor))
                        .multilineTextAlignment(.leading)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    Divider()
                    
                }
            }
            .padding(.horizontal, 20)
            .frame(height: 100)
            
        }
    }
}
